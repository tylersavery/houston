import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:houston_flutter/config/env.dart';
import 'package:houston_flutter/core/error/exceptions.dart';
import 'package:houston_flutter/core/providers/rest_session_provider.dart';
import 'package:houston_flutter/core/utils/debugger_utils.dart';
import 'package:houston_flutter/features/auth/domain/models/session_token.dart';

enum HttpMethod { get, post, patch, delete }

class RestClient {
  final RestSession session;

  RestClient(this.session);

  String get type => kIsWeb ? 'web' : 'app';

  BaseOptions get _options {
    return BaseOptions(
      baseUrl: Env.apiBaseUrl,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json",
      },
    );
  }

  String _cleanPath(String path) {
    if (!path.endsWith("/")) {
      return "$path/";
    }

    return path;
  }

  _authInterceptor({bool withAuth = true}) {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        if (withAuth && session.token != null) {
          String accessToken = session.token!.access;

          if (session.token!.accessIsExpired) {
            final dio = Dio(_options);
            final result = await dio.post(
              "/auth/token/refresh/",
              data: {'refresh': session.token!.refresh},
            );
            final newToken = SessionToken.fromJson(result.data);
            accessToken = newToken.access;

            session.setToken(newToken);
          }

          options.headers['Authorization'] = 'Bearer $accessToken';
        }
        return handler.next(options);
      },
      onError: (DioException e, handler) async {
        Debugger.error("Dio Exception intercepted", e);
        return handler.next(e);
      },
    );
  }

  Future<Map<String, dynamic>> _handle({
    required HttpMethod method,
    required String path,
    Map<String, dynamic> data = const {},
    bool cleanPath = true,
    bool withAuth = true,
  }) async {
    try {
      late Response<dynamic> response;

      final dio = Dio(_options);
      dio.interceptors.add(_authInterceptor(withAuth: withAuth));

      switch (method) {
        case HttpMethod.get:
          response = await dio.get(
            cleanPath ? _cleanPath(path) : path,
            queryParameters: data,
          );
        case HttpMethod.post:
          response = await dio.post(
            cleanPath ? _cleanPath(path) : path,
            data: data,
          );
        case HttpMethod.patch:
          response = await dio.patch(
            cleanPath ? _cleanPath(path) : path,
            data: data,
          );
        case HttpMethod.delete:
          await dio.delete(cleanPath ? _cleanPath(path) : path);
          return {};
      }

      return response.data ?? {};
    } on DioException catch (e) {
      if (e.response != null) {
        print('HTTP Error: ${e.response?.statusCode}');
        print('Response data: ${e.response?.data}');

        throw ServerException(
          "${e.response?.statusCode} Error: ${e.response?.data}",
        );
      } else {
        print('Error message!!!: ${e.message}');
        throw const ServerException("Error: An unknown problem occurred");
      }
    } catch (e) {
      print(e);
      throw const ServerException("Error: An unknown problem occurred");
    }
  }

  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, dynamic> data = const {},
    bool cleanPath = true,
    bool withAuth = true,
    String? orderBy,
  }) {
    if (orderBy != null) {
      data = {...data, 'ordering': orderBy};
    }
    return _handle(
      method: HttpMethod.get,
      path: path,
      data: data,
      cleanPath: cleanPath,
      withAuth: withAuth,
    );
  }

  Future<Map<String, dynamic>> post(
    String path, {
    Map<String, dynamic> data = const {},
    bool cleanPath = true,
    bool withAuth = true,
  }) {
    return _handle(
      method: HttpMethod.post,
      path: path,
      data: data,
      cleanPath: cleanPath,
      withAuth: withAuth,
    );
  }

  Future<Map<String, dynamic>> patch(
    String path, {
    Map<String, dynamic> data = const {},
    bool cleanPath = true,
    bool withAuth = true,
  }) {
    return _handle(
      method: HttpMethod.patch,
      path: path,
      data: data,
      cleanPath: cleanPath,
      withAuth: withAuth,
    );
  }

  Future<Map<String, dynamic>> delete(
    String path, {
    bool cleanPath = true,
    bool withAuth = true,
  }) {
    return _handle(
      method: HttpMethod.delete,
      path: path,
      cleanPath: cleanPath,
      withAuth: withAuth,
    );
  }
}

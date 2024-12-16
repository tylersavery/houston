import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:houston_flutter/core/error/exceptions.dart';
import 'package:houston_flutter/core/providers/rest_session_provider.dart';

enum HttpMethod {
  get,
  post,
  patch,
  delete,
}

class RestClient {
  final RestSession session;

  RestClient(this.session);

  String get type => kIsWeb ? 'web' : 'app';

  BaseOptions _options({bool withAuth = true}) {
    if (withAuth && session.accessToken != null) {}
    return BaseOptions(
      baseUrl: "http://localhost:8000/v1",
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json",
        ...withAuth && session.accessToken != null ? {HttpHeaders.authorizationHeader: "Bearer ${session.accessToken}"} : {}
      },
    );
  }

  String _cleanPath(String path) {
    if (!path.endsWith("/")) {
      return "$path/";
    }

    return path;
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
      switch (method) {
        case HttpMethod.get:
          response = await Dio(_options(withAuth: withAuth)).get(
            cleanPath ? _cleanPath(path) : path,
            queryParameters: data,
          );
        case HttpMethod.post:
          response = await Dio(_options(withAuth: withAuth)).post(
            cleanPath ? _cleanPath(path) : path,
            data: data,
          );
        case HttpMethod.patch:
          response = await Dio(_options(withAuth: withAuth)).patch(
            cleanPath ? _cleanPath(path) : path,
            data: data,
          );
        case HttpMethod.delete:
          await Dio(_options(withAuth: withAuth)).delete(
            cleanPath ? _cleanPath(path) : path,
          );
          return {};
      }

      return response.data;
    } catch (e) {
      throw ServerException(e.toString());
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

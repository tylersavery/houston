import 'package:houston_flutter/core/error/exceptions.dart';
import 'package:houston_flutter/core/providers/rest_session_provider.dart';
import 'package:houston_flutter/core/providers/storage_provider.dart';
import 'package:houston_flutter/core/rest_client/rest_client.dart';
import 'package:houston_flutter/features/auth/domain/datasources/auth_data_source.dart';
import 'package:houston_flutter/features/auth/domain/models/session_token.dart';
import 'package:houston_flutter/features/auth/domain/models/user_model.dart';

class AuthDataSourceDjangoImpl implements AuthDataSource {
  final RestClient client;
  final RestSession session;
  final Storage storage;

  AuthDataSourceDjangoImpl(this.client, this.session, this.storage);

  @override
  Future<User?> currentUser() async {
    if (session.token == null) {
      return null;
    }

    try {
      final result = await client.get('/user/me');

      return User.fromJson(result);
    } catch (e, st) {
      print(e);
      print(st);
      throw ServerException(e.toString());
    }
  }

  @override
  Future<bool> register({
    required String email,
    required String username,
    required String password,
  }) async {
    try {
      await client.post(
        "/auth/register/",
        data: {'email': email, 'username': username, 'password': password},
      );

      await login(email: email, password: password);

      return true;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<User> confirmRegistration({
    required String email,
    required String verificationCode,
  }) async {
    try {
      await client.post(
        "/auth/email/confirm/",
        data: {'email': email, 'verification_code': verificationCode},
      );

      final user = await currentUser();
      if (user != null) {
        return user;
      }
      throw const ServerException("User data retrieval failed");
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<User> login({required String email, required String password}) async {
    try {
      final result = await client.post(
        '/auth/token/',
        data: {'email': email, 'password': password},
      );

      final token = SessionToken.fromJson(result);

      session.setToken(token);

      final user = await currentUser();

      if (user == null) {
        throw const ServerException("Could not fetch user");
      }
      return user;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> logout() async {
    await storage.removeString(StorageKey.authAccessToken);
    await storage.removeString(StorageKey.authRefreshToken);
    session.clearToken();
  }

  @override
  Future<void> requestPasswordReset({required String email}) async {
    try {
      await client.post(
        "/auth/password/reset/request/",
        data: {'email': email},
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<User> completePasswordReset({
    required String email,
    required String verificationCode,
    required String newPassword,
  }) async {
    try {
      final result = await client.post(
        "/auth/password/reset/complete/",
        data: {
          'email': email,
          'verification_code': verificationCode,
          'new_password': newPassword,
        },
      );

      final token = SessionToken.fromJson(result);

      session.setToken(token);

      final user = await currentUser();

      if (user == null) {
        throw const ServerException("Could not fetch user");
      }
      return user;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}

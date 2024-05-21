import 'package:houston_flutter/core/error/exceptions.dart';
import 'package:houston_flutter/core/providers/rest_session_provider.dart';
import 'package:houston_flutter/core/rest_client/rest_client.dart';
import 'package:houston_flutter/features/auth/domain/datasources/auth_data_source.dart';
import 'package:houston_flutter/features/auth/domain/models/user_model.dart';

class AuthDataSourceDjangoImpl implements AuthDataSource {
  final RestClient client;
  final RestSession session;

  AuthDataSourceDjangoImpl(this.client, this.session);

  @override
  Future<User?> currentUser() async {
    if (session.accessToken == null) {
      return null;
    }

    //TODO: check for expiry etc (or via interceptor)
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
  Future<bool> register({required String email, required String username, required String password}) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<User> confirmRegistration({required String email, required String verificationCode}) {
    // TODO: implement confirmRegistration
    throw UnimplementedError();
  }

  @override
  Future<User> login({required String email, required String password}) async {
    try {
      final result = await client.post(
        '/auth/token/',
        data: {
          'email': email,
          'password': password,
        },
      );

      final accessToken = result['access'];
      final refreshToken = result['refresh'];

      if (accessToken == null || refreshToken == null) {
        throw const ServerException("Access/Refresh token is null");
      }

      session.setToken(accessToken, refreshToken);

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
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}

import 'package:flutter/foundation.dart';
import 'package:houston_flutter/core/error/exceptions.dart';
import 'package:houston_flutter/features/auth/domain/models/user_model.dart';
import 'package:houston_flutter/features/auth/domain/datasources/auth_data_source.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthDataSourceSupabaseImpl implements AuthDataSource {
  final SupabaseClient client;

  AuthDataSourceSupabaseImpl(this.client);

  @override
  UserModel? currentUser() {
    final u = client.auth.currentSession?.user;
    if (u == null) {
      return null;
    }

    //todo: profile
    return UserModel(id: u.id, email: u.email ?? '', username: u.id);
  }

  @override
  Future<UserModel> login({required String email, required String password}) async {
    try {
      final result = await client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (result.session != null) {
        return UserModel(
          email: email,
          username: result.session!.user.id,
          id: result.session!.user.id,
        );
      }
      throw const ServerException();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<bool> register({required String email, required String username, required String password}) async {
    try {
      await client.auth.signUp(
        email: email,
        password: password,
        //TODO: dynamic deep link
        emailRedirectTo: kIsWeb ? null : 'io.houston.app://login-callback/',
      );
      return true;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> confirmRegistration({required String email, required String verificationCode}) async {
    try {
      final result = await client.auth.verifyOTP(
        token: verificationCode,
        type: OtpType.email,
        email: email,
      );

      if (result.user != null) {
        return UserModel(
          id: result.user!.id,
          email: result.user!.email ?? '',
          username: result.user!.id,
        );
      }
      throw const ServerException();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> logout() async {
    await client.auth.signOut();
  }
}

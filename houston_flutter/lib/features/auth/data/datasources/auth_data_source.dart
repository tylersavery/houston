import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:houston_client/houston_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/error/exceptions.dart';
import '../models/user_model.dart';

abstract interface class AuthDataSource {
  UserModel? currentUser();

  Future<bool> register({
    required String email,
    required String username,
    required String password,
  });

  Future<UserModel> confirmRegistration({
    required String email,
    required String verificationCode,
  });

  Future<UserModel> login({
    required String email,
    required String password,
  });

  Future<void> logout();
}

class AuthDataSourceImpl implements AuthDataSource {
  final Client client;
  final SessionManager sessionManager;

  AuthDataSourceImpl(this.client, this.sessionManager);

  @override
  UserModel? currentUser() {
    final user = sessionManager.signedInUser;

    if (user != null) {
      return UserModel(
        id: user.id!.toString(),
        email: user.email!,
        username: user.userName,
      );
    }
    return null;
  }

  @override
  Future<bool> register({
    required String email,
    required String username,
    required String password,
  }) async {
    try {
      final result = await client.modules.auth.email.createAccountRequest(username, email, password);

      if (result == false) {
        throw const ServerException();
      }

      return true;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> confirmRegistration({
    required String email,
    required String verificationCode,
  }) async {
    try {
      final result = await client.modules.auth.email.createAccount(email, verificationCode);

      if (result == null) {
        throw const ServerException("User was null");
      }

      return UserModel(
        id: result.id!.toString(),
        email: result.email!,
        username: result.userName,
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> login({required String email, required String password}) async {
    try {
      final result = await client.modules.auth.email.authenticate(email, password);

      if (!result.success) {
        throw ServerException(result.failReason?.toString() ?? "Not successful");
      }

      if (result.userInfo == null) {
        throw const ServerException("User info not found");
      }

      await sessionManager.registerSignedInUser(
        result.userInfo!,
        result.keyId!,
        result.key!,
      );

      return UserModel(
        id: result.userInfo!.id!.toString(),
        email: result.userInfo!.email!,
        username: result.userInfo!.userName,
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> logout() async {
    try {
      await sessionManager.signOut();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}

class AuthDataSourceImplSupabase implements AuthDataSource {
  final SupabaseClient client;

  AuthDataSourceImplSupabase(this.client);

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

import 'package:houston_flutter/features/auth/domain/models/user_model.dart';

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

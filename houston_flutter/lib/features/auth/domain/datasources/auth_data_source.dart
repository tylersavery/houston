import 'package:houston_flutter/features/auth/domain/models/user_model.dart';

abstract interface class AuthDataSource {
  Future<User?> currentUser();

  Future<bool> register({
    required String email,
    required String username,
    required String password,
  });

  Future<User> confirmRegistration({
    required String email,
    required String verificationCode,
  });

  Future<User> login({required String email, required String password});

  Future<void> logout();

  Future<void> requestPasswordReset({required String email});

  Future<User> completePasswordReset({
    required String email,
    required String verificationCode,
    required String newPassword,
  });

  Future<void> resendEmailVerificationCode({required String email});
}

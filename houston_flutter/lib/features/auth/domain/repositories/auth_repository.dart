import 'package:fpdart/fpdart.dart';
import 'package:houston_flutter/features/auth/domain/models/user_model.dart';
import '../../../../core/error/failures.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, bool>> registerWithEmailPassword({
    required String username,
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> confirmRegistration({
    required String email,
    required String verificationCode,
  });

  Future<Either<Failure, User>> loginWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> currentUser();

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, void>> requestPasswordReset({required String email});

  Future<Either<Failure, User>> completePasswordReset({
    required String email,
    required String verificationCode,
    required String newPassword,
  });

  Future<Either<Failure, void>> resendEmailVerificationCode({
    required String email,
  });
}

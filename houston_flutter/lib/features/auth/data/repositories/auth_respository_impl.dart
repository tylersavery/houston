import 'package:fpdart/fpdart.dart';
import 'package:houston_flutter/features/auth/domain/datasources/auth_data_source.dart';
import 'package:houston_flutter/features/auth/domain/models/user_model.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;

  const AuthRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, User>> currentUser() async {
    final user = await dataSource.currentUser();

    if (user == null) {
      return left(Failure('User not logged in!'));
    }

    return right(user);
  }

  @override
  Future<Either<Failure, User>> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final result = await dataSource.login(email: email, password: password);

      return right(result);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> registerWithEmailPassword({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final result = await dataSource.register(
        email: email,
        username: username,
        password: password,
      );

      if (result) {
        return right(true);
      }

      return left(Failure("Could not register"));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> confirmRegistration({
    required String email,
    required String verificationCode,
  }) async {
    try {
      final result = await dataSource.confirmRegistration(
        email: email,
        verificationCode: verificationCode,
      );
      return right(result);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      dataSource.logout();
      return right(null);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> requestPasswordReset({
    required String email,
  }) async {
    try {
      await dataSource.requestPasswordReset(email: email);
      return right(null);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> completePasswordReset({
    required String email,
    required String verificationCode,
    required String newPassword,
  }) async {
    try {
      final user = await dataSource.completePasswordReset(
        email: email,
        verificationCode: verificationCode,
        newPassword: newPassword,
      );
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> resendEmailVerificationCode({
    required String email,
  }) async {
    try {
      await dataSource.resendEmailVerificationCode(email: email);

      return right(null);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}

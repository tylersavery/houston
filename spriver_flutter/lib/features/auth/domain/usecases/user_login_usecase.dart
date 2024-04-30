import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:spriver_flutter/core/common/entities/user.dart';
import 'package:spriver_flutter/core/error/failures.dart';
import 'package:spriver_flutter/core/usecase/usecase.dart';
import 'package:spriver_flutter/features/auth/domain/providers/auth_repository_provider.dart';
import 'package:spriver_flutter/features/auth/domain/repositories/auth_repository.dart';

class UserLoginUseCase implements UseCase<User, UserLoginParams> {
  final AuthRepository authRepository;

  const UserLoginUseCase(this.authRepository);

  @override
  Future<Either<Failure, User>> call(UserLoginParams params) async {
    return await authRepository.loginWithEmailPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class UserLoginParams {
  final String email;
  final String password;
  const UserLoginParams({
    required this.email,
    required this.password,
  });
}

final userLoginUseCaseProvider = Provider<UserLoginUseCase>(
  (ref) {
    return UserLoginUseCase(ref.read(authRepositoryProvider));
  },
);

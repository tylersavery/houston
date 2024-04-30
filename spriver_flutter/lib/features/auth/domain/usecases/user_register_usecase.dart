import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:spriver_flutter/core/error/failures.dart';
import 'package:spriver_flutter/core/usecase/usecase.dart';
import 'package:spriver_flutter/features/auth/domain/providers/auth_repository_provider.dart';
import 'package:spriver_flutter/features/auth/domain/repositories/auth_repository.dart';

class UserRegisterUseCase implements UseCase<bool, UserRegisterParams> {
  final AuthRepository authRepository;

  const UserRegisterUseCase(this.authRepository);

  @override
  Future<Either<Failure, bool>> call(UserRegisterParams params) async {
    return await authRepository.registerWithEmailPassword(
      email: params.email,
      username: params.username,
      password: params.password,
    );
  }
}

class UserRegisterParams {
  final String email;
  final String username;
  final String password;
  const UserRegisterParams({
    required this.email,
    required this.username,
    required this.password,
  });
}

final userRegisterUseCaseProvider = Provider<UserRegisterUseCase>(
  (ref) {
    return UserRegisterUseCase(ref.read(authRepositoryProvider));
  },
);

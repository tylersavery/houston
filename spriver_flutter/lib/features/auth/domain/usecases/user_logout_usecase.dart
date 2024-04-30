import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:spriver_flutter/core/error/failures.dart';
import 'package:spriver_flutter/core/usecase/usecase.dart';
import 'package:spriver_flutter/features/auth/domain/providers/auth_repository_provider.dart';
import 'package:spriver_flutter/features/auth/domain/repositories/auth_repository.dart';

class UserLogoutUseCase implements UseCase<void, NoParams> {
  final AuthRepository authRepository;

  const UserLogoutUseCase(this.authRepository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await authRepository.logout();
  }
}

final userLogoutUseCaseProvider = Provider<UserLogoutUseCase>(
  (ref) {
    return UserLogoutUseCase(ref.read(authRepositoryProvider));
  },
);

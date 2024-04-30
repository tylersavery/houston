import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:spriver_flutter/core/common/entities/user.dart';
import 'package:spriver_flutter/core/error/failures.dart';
import 'package:spriver_flutter/core/usecase/usecase.dart';
import 'package:spriver_flutter/features/auth/domain/providers/auth_repository_provider.dart';
import 'package:spriver_flutter/features/auth/domain/repositories/auth_repository.dart';

class CurrentUserUseCase implements UseCase<User, NoParams> {
  final AuthRepository authRepository;
  CurrentUserUseCase(this.authRepository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await authRepository.currentUser();
  }
}

final currentUserUseCaseProvider = Provider<CurrentUserUseCase>(
  (ref) {
    return CurrentUserUseCase(ref.read(authRepositoryProvider));
  },
);

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../providers/auth_repository_provider.dart';
import '../repositories/auth_repository.dart';

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

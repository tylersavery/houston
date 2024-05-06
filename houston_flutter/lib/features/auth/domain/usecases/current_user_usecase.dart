import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/common/entities/user.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../providers/auth_repository_provider.dart';
import '../repositories/auth_repository.dart';

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

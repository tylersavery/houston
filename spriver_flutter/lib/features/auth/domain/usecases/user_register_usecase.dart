import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../providers/auth_repository_provider.dart';
import '../repositories/auth_repository.dart';

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

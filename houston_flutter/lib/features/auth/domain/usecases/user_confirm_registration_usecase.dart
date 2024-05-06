import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../core/common/entities/user.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../providers/auth_repository_provider.dart';
import '../repositories/auth_repository.dart';

class UserConfirmRegistrationUseCase implements UseCase<User, UserConfirmRegistrationParams> {
  final AuthRepository authRepository;

  const UserConfirmRegistrationUseCase(this.authRepository);

  @override
  Future<Either<Failure, User>> call(
    UserConfirmRegistrationParams params,
  ) async {
    final confirmationResult = await authRepository.confirmRegistration(
      email: params.email,
      verificationCode: params.verificationCode,
    );

    return await confirmationResult.fold((error) => left(error), (r) async {
      return await authRepository.loginWithEmailPassword(
        email: params.email,
        password: params.password,
      );
    });
  }
}

class UserConfirmRegistrationParams {
  final String email;
  final String verificationCode;
  final String password;
  const UserConfirmRegistrationParams({
    required this.email,
    required this.verificationCode,
    required this.password,
  });
}

final userConfirmRegistrationUseCaseProvider = Provider<UserConfirmRegistrationUseCase>(
  (ref) {
    return UserConfirmRegistrationUseCase(ref.read(authRepositoryProvider));
  },
);

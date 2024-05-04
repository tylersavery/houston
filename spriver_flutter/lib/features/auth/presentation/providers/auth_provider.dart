import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/providers/current_user_provider.dart';
import '../../../../core/providers/session_manager_provider.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/current_user_usecase.dart';
import '../../domain/usecases/user_confirm_registration_usecase.dart';
import '../../domain/usecases/user_login_usecase.dart';
import '../../domain/usecases/user_logout_usecase.dart';
import '../../domain/usecases/user_register_usecase.dart';
import 'auth_state.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  @override
  AuthState build() {
    _init();
    return AuthStateBooting();
  }

  Future<void> _init() async {
    await ref.read(sessionManagerProvider).initialize();

    final result = await ref.read(currentUserUseCaseProvider)(NoParams());

    result.fold(
      (failure) {
        state = AuthStateInitial();
      },
      (user) {
        ref.read(currentUserProvider.notifier).updateUser(user);
        state = AuthStateSuccess(user);
      },
    );
  }

  Future<void> register(UserRegisterParams params) async {
    state = AuthStateLoading();
    final result = await ref.read(userRegisterUseCaseProvider)(params);

    result.fold((failure) {
      state = AuthStateFailure(failure.message);
    }, (success) {
      if (success) {
        state = AuthStateVerificationRequired(email: params.email, password: params.password);
      } else {
        state = const AuthStateFailure("Registration Error.");
      }
    });
  }

  Future<void> confirmRegistration(UserConfirmRegistrationParams params) async {
    state = AuthStateLoading();

    final result = await ref.read(userConfirmRegistrationUseCaseProvider)(params);

    result.fold((failure) {
      state = AuthStateFailure(failure.message);
    }, (user) {
      ref.read(currentUserProvider.notifier).updateUser(user);
      state = AuthStateSuccess(user);
    });
  }

  Future<void> login(UserLoginParams params) async {
    state = AuthStateLoading();

    final result = await ref.read(userLoginUseCaseProvider)(params);

    result.fold((failure) {
      state = AuthStateFailure(failure.message);
    }, (user) {
      ref.read(currentUserProvider.notifier).updateUser(user);

      state = AuthStateSuccess(user);
    });
  }

  Future<void> logout() async {
    state = AuthStateLoading();

    final result = await ref.read(userLogoutUseCaseProvider)(NoParams());

    result.fold((failure) {
      state = AuthStateFailure(failure.message);
    }, (_) {
      ref.read(currentUserProvider.notifier).logout();

      state = AuthStateInitial();
    });
  }
}

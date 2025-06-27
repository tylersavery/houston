import 'package:houston_flutter/config/constants.dart';
import 'package:houston_flutter/core/providers/rest_session_provider.dart';
import 'package:houston_flutter/features/auth/domain/providers/auth_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/providers/current_user_provider.dart';
import '../../../../core/providers/session_manager_provider.dart';

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
    await ref.read(serverpodSessionManagerProvider).initialize();
    await ref.read(restSessionProvider.notifier).initialize();

    final result = await ref.read(authRepositoryProvider).currentUser();

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

  Future<void> login({required String email, required String password}) async {
    state = AuthStateLoading();

    final result = await ref
        .read(authRepositoryProvider)
        .loginWithEmailPassword(email: email, password: password);

    result.fold(
      (failure) {
        state = AuthStateFailure(failure.message);
      },
      (user) {
        ref.read(currentUserProvider.notifier).updateUser(user);

        state = AuthStateSuccess(user);
      },
    );
  }

  Future<void> register({
    required String email,
    required String password,
    required String username,
  }) async {
    state = AuthStateLoading();
    final result = await ref
        .read(authRepositoryProvider)
        .registerWithEmailPassword(
          email: email,
          password: password,
          username: username,
        );

    result.fold(
      (failure) {
        state = AuthStateFailure(failure.message);
      },
      (success) async {
        if (success) {
          if (Constants.serverBackend == ServerBackendOption.supabase &&
              !Constants.supabaseSignupRequiresConfirmation) {
            final loginResult = await ref
                .read(authRepositoryProvider)
                .loginWithEmailPassword(email: email, password: password);

            loginResult.fold(
              (failure) {
                state = AuthStateFailure(failure.message);
              },
              (user) {
                ref.read(currentUserProvider.notifier).updateUser(user);
                state = AuthStateSuccess(user);
              },
            );
          } else {
            state = AuthStateVerificationRequired(
              email: email,
              password: password,
            );
          }
        } else {
          state = const AuthStateFailure("Registration Error.");
        }
      },
    );
  }

  Future<void> confirmRegistration({
    required String email,
    required String password,
    required String verificationCode,
  }) async {
    state = AuthStateLoading();

    final confirmationResult = await ref
        .read(authRepositoryProvider)
        .confirmRegistration(email: email, verificationCode: verificationCode);

    await confirmationResult.fold(
      (failure) {
        state = AuthStateFailure(failure.message);
      },
      (r) async {
        final loginResult = await ref
            .read(authRepositoryProvider)
            .loginWithEmailPassword(email: email, password: password);
        loginResult.fold(
          (failure) {
            state = AuthStateFailure(failure.message);
          },
          (user) {
            ref.read(currentUserProvider.notifier).updateUser(user);
            state = AuthStateSuccess(user);
          },
        );
      },
    );
  }

  Future<void> logout() async {
    state = AuthStateLoading();

    final result = await ref.read(authRepositoryProvider).logout();

    result.fold(
      (failure) {
        state = AuthStateFailure(failure.message);
      },
      (_) {
        ref.read(currentUserProvider.notifier).logout();

        state = AuthStateInitial();
      },
    );
  }

  Future<void> requestPasswordReset({required String email}) async {
    final result = await ref
        .read(authRepositoryProvider)
        .requestPasswordReset(email: email);

    result.fold(
      (failure) {
        state = AuthStateFailure(failure.message);
      },
      (_) {
        state = AuthStatePasswordResetRequested(email: email);
      },
    );
  }

  Future<void> completePasswordReset({
    required String email,
    required String verificationCode,
    required String newPassword,
  }) async {
    final result = await ref
        .read(authRepositoryProvider)
        .completePasswordReset(
          email: email,
          verificationCode: verificationCode,
          newPassword: newPassword,
        );

    result.fold(
      (failure) {
        state = AuthStateFailure(failure.message);
      },
      (user) {
        ref.read(currentUserProvider.notifier).updateUser(user);
        state = AuthStateSuccess(user);
      },
    );
  }

  Future<bool> resendEmailVerificationCode({required String email}) async {
    final result = await ref
        .read(authRepositoryProvider)
        .resendEmailVerificationCode(email: email);

    return result.fold(
      (failure) {
        return false;
      },
      (_) {
        return true;
      },
    );
  }
}

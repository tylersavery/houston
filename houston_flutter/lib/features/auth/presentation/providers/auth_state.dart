import 'package:flutter/foundation.dart';
import 'package:houston_flutter/features/auth/domain/models/user_model.dart';

@immutable
sealed class AuthState {
  const AuthState();
}

final class AuthStateBooting extends AuthState {}

final class AuthStateInitial extends AuthState {}

final class AuthStateLoading extends AuthState {}

final class AuthStateVerificationRequired extends AuthState {
  final String email;
  final String password;
  const AuthStateVerificationRequired({required this.email, required this.password});
}

final class AuthStateSuccess extends AuthState {
  final User user;
  const AuthStateSuccess(this.user);
}

final class AuthStateFailure extends AuthState {
  final String message;
  const AuthStateFailure(this.message);
}

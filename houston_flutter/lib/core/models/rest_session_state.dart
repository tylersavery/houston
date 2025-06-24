import 'package:flutter/foundation.dart';
import 'package:houston_flutter/features/auth/domain/models/session_token.dart';

@immutable
sealed class RestSessionState {
  const RestSessionState();
}

final class RestSessionStateBooting extends RestSessionState {}

final class RestSessionStateInitial extends RestSessionState {}

final class RestSessionStateActive extends RestSessionState {
  final SessionToken token;

  const RestSessionStateActive({required this.token});
}

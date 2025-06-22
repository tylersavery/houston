import 'package:flutter/foundation.dart';

@immutable
sealed class RestSessionState {
  const RestSessionState();
}

final class RestSessionStateBooting extends RestSessionState {}

final class RestSessionStateInitial extends RestSessionState {}

final class RestSessionStateActive extends RestSessionState {
  final String accessToken;
  final String refreshToken;

  const RestSessionStateActive({
    required this.accessToken,
    required this.refreshToken,
  });
}

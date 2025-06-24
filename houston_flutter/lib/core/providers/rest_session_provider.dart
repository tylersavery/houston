import 'package:houston_flutter/core/models/rest_session_state.dart';
import 'package:houston_flutter/core/providers/storage_provider.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

part 'rest_session_provider.g.dart';

@Riverpod(keepAlive: true)
class RestSession extends _$RestSession {
  @override
  RestSessionState build() {
    return RestSessionStateBooting();
  }

  Future<void> initialize() async {
    final storedAccessToken = await ref
        .read(storageProvider)
        .getString(StorageKey.authAccessToken);

    final storedRefreshToken = await ref
        .read(storageProvider)
        .getString(StorageKey.authRefreshToken);

    if (storedAccessToken == null || storedRefreshToken == null) {
      state = RestSessionStateInitial();
      return;
    }

    // if (isTokenExpired(storedAccessToken)) {
    //   if (isTokenExpired(storedRefreshToken)) {
    //     ref.read(storageProvider).removeString(StorageKey.authAccessToken);
    //     ref.read(storageProvider).removeString(StorageKey.authRefreshToken);
    //     state = RestSessionStateInitial();
    //     return;
    //   }

    //   //TODO: Handle refresh here
    //   state = RestSessionStateInitial();
    //   return;
    // }

    setToken(storedAccessToken, storedRefreshToken);
  }

  bool isTokenExpired(String token) {
    return JwtDecoder.isExpired(token);
  }

  void setToken(String accessToken, String refreshToken) {
    state = RestSessionStateActive(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }

  void clearToken() {
    state = RestSessionStateInitial();
  }

  String? get accessToken {
    if (state is RestSessionStateActive) {
      return (state as RestSessionStateActive).accessToken;
    }
    return null;
  }
}

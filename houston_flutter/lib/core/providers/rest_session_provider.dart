import 'package:houston_flutter/core/models/rest_session_state.dart';
import 'package:houston_flutter/core/providers/storage_provider.dart';
import 'package:houston_flutter/features/auth/domain/models/session_token.dart';
import 'package:houston_flutter/features/auth/domain/providers/auth_datasource_provider.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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

    final token = SessionToken(
      access: storedAccessToken,
      refresh: storedRefreshToken,
    );

    //TODO: handle expired tokens and such
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

    setToken(token);

    try {
      await ref.read(authDataSourceProvider).currentUser();
    } catch (e) {
      state = RestSessionStateInitial();
    }
  }

  bool isTokenExpired(String token) {
    return JwtDecoder.isExpired(token);
  }

  void setToken(SessionToken token) {
    state = RestSessionStateActive(token: token);

    ref
        .read(storageProvider)
        .setString(StorageKey.authAccessToken, token.access);
    ref
        .read(storageProvider)
        .setString(StorageKey.authRefreshToken, token.refresh);
  }

  void clearToken() {
    state = RestSessionStateInitial();
  }

  SessionToken? get token {
    if (state is RestSessionStateActive) {
      return (state as RestSessionStateActive).token;
    }
    return null;
  }
}

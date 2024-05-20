import 'package:houston_flutter/core/models/rest_session_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rest_session_provider.g.dart';

@Riverpod(keepAlive: true)
class RestSession extends _$RestSession {
  @override
  RestSessionState build() {
    _init();

    return RestSessionStateBooting();
  }

  Future<void> _init() async {
    await Future.delayed(const Duration(milliseconds: 100));

    state = RestSessionStateInitial();
  }

  void setToken(String accessToken, String refreshToken) {
    state = RestSessionStateActive(accessToken: accessToken, refreshToken: refreshToken);
  }

  String? get accessToken {
    if (state is RestSessionStateActive) {
      return (state as RestSessionStateActive).accessToken;
    }
    return null;
  }
}

import 'package:flutter/foundation.dart';
import 'package:houston_flutter/features/auth/domain/models/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_user_provider.g.dart';

@immutable
sealed class CurrentUserState {}

final class CurrentUserStateInitial extends CurrentUserState {}

final class CurrentUserStateAuthenticated extends CurrentUserState {
  final User user;
  CurrentUserStateAuthenticated(this.user);
}

@Riverpod(keepAlive: true)
class CurrentUser extends _$CurrentUser {
  @override
  CurrentUserState build() {
    return CurrentUserStateInitial();
  }

  updateUser(User? user) {
    if (user == null) {
      state = CurrentUserStateInitial();
    } else {
      state = CurrentUserStateAuthenticated(user);
    }
  }

  void logout() {
    updateUser(null);
  }
}

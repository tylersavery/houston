import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../common/entities/user.dart';

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

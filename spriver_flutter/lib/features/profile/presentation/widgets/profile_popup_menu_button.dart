import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spriver_flutter/core/providers/current_user_provider.dart';
import 'package:spriver_flutter/features/auth/presentation/providers/auth_provider.dart';

class ProfilePopupMenuButton extends ConsumerWidget {
  const ProfilePopupMenuButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(currentUserProvider);

    switch (state) {
      case CurrentUserStateInitial():
        return const SizedBox();
      case CurrentUserStateAuthenticated():
        return PopupMenuButton(itemBuilder: (context) {
          return [
            PopupMenuItem(child: Text(state.user.username)),
            PopupMenuItem(
              child: const Text("Log Out"),
              onTap: () {
                ref.read(authProvider.notifier).logout();
              },
            ),
          ];
        });
    }
  }
}

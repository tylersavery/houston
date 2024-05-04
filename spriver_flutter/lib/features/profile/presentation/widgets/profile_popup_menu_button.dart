import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/current_user_provider.dart';
import '../../../../core/utils/dialog_utils.dart';
import '../../../auth/presentation/providers/auth_provider.dart';

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
              onTap: () async {
                final confirmed = await ConfirmDialog.show(
                  title: "Logout",
                  body: "Are you sure you want to logout?",
                  confirmText: "Logout",
                  destructive: true,
                );

                if (confirmed == true) {
                  ref.read(authProvider.notifier).logout();
                }
              },
            ),
          ];
        });
    }
  }
}

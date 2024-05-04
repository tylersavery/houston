import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../theme/theme.dart';
import '../base_component.dart';
import '../../../features/auth/presentation/providers/auth_provider.dart';

class MainDrawer extends BaseComponent {
  const MainDrawer({super.key});
  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Drawer(
      width: 220,
      backgroundColor: Theme.of(context).colorScheme.drawerBackground,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(
              color: Colors.white10,
              width: 1,
            ),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Houston",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
                Card(
                  child: ListTile(
                    title: const Text("Settings"),
                    leading: const Icon(Icons.settings),
                    onTap: () {
                      Navigator.of(context).pop();
                      context.push('/settings');
                    },
                  ),
                ),
                Card(
                  child: ListTile(
                    title: const Text("Logout"),
                    leading: const Icon(Icons.logout),
                    onTap: () {
                      Navigator.of(context).pop();
                      ref.read(authProvider.notifier).logout();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

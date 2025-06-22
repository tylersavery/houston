import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:houston_flutter/features/profile/presentation/widgets/profile_infinite_list_widget.dart';
import '../../../../core/widgets/base_screen.dart';
import 'profile_edit_screen.dart';
import '../providers/profile_form_provider.dart';

class ProfileListScreen extends BaseScreen {
  static String route() => "/profile";

  const ProfileListScreen({super.key, super.includeMainDrawer = true});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("My Profiles"),
      actions: [
        IconButton(
          onPressed: () {
            ref.read(profileFormProvider.notifier).reset();
            context.push(ProfileEditScreen.routeNew());
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const ProfileInfiniteListWidget();
  }
}

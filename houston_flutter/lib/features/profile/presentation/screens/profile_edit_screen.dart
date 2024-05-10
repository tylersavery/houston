import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/toast_utils.dart';
import '../../../../core/widgets/base_screen.dart';
import '../providers/profile_form_provider.dart';
import '../widgets/profile_form_widget.dart';

class ProfileEditScreen extends BaseScreen {
  final int? profileId;

  static String route([int? profileId]) =>
      "/profile/edit/${profileId ?? ':id'}";

  static String routeNew() => "/profile/new";

  const ProfileEditScreen({
    super.key,
    this.profileId,
  });

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final provider = ref.read(profileFormProvider.notifier);
    final state = ref.watch(profileFormProvider);

    final isEditing = state.profile.id != null;

    return AppBar(
      title: Text(isEditing ? "Edit Profile" : "Create Profile"),
      actions: [
        IconButton(
          onPressed: () async {
            final success = await provider.submit();
            if (success) {
              if (context.mounted) {
                Toast.message(context, "Profile Saved!");
                context.pop();
              }
            }
          },
          icon: const Icon(Icons.done),
        ),
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: ProfileFormWidget(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/base_screen.dart';
import '../../../../core/widgets/loader.dart';
import 'profile_edit_screen.dart';
import 'profile_list_screen.dart';
import '../providers/profile_detail_provider.dart';
import '../providers/profile_form_provider.dart';
import '../widgets/profile_detail_widget.dart';

class ProfileDetailScreen extends BaseScreen {
  final int profileId;

  static String route([int? profileId]) =>
      "${ProfileListScreen.route()}/${profileId ?? ':id'}";

  const ProfileDetailScreen({super.key, required this.profileId});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final data = ref.watch(profileDetailProvider(profileId));

    return data.when(
      loading: () => AppBar(),
      error: (error, __) => AppBar(title: const Text("Error")),
      data: (profile) {
        return AppBar(
          title: Text(profile.label),
          actions: [
            IconButton(
              onPressed: () async {
                await ref.read(profileFormProvider.notifier).load(profileId);
                if (context.mounted) {
                  context.push(ProfileEditScreen.route(profileId));
                }
              },
              icon: const Icon(Icons.edit),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final data = ref.watch(profileDetailProvider(profileId));

    return data.when(
      loading: () => const Loader(),
      error: (error, __) => Center(child: Text(error.toString())),
      data: (profile) {
        return Center(child: ProfileDetailWidget(profile: profile));
      },
    );
  }
}

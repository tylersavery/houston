import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widgets/base_component.dart';
import '../../../../core/widgets/infinite_list_widget.dart';
import '../../domain/models/profile_model.dart';
import '../providers/profile_infinite_list_provider.dart';
import 'profile_list_tile_widget.dart';

class ProfileInfiniteListWidget extends BaseComponent {
  final Function(Profile)? onPressed;
  const ProfileInfiniteListWidget({super.key, this.onPressed});

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(profileInfiniteListProvider);

    return InfiniteListWidget<Profile>(
      pagingController: provider.pagingController,
      itemBuilder: (context, profile, index) {
        return ProfileListTileWidget(profile: profile, onPressed: onPressed);
      },
      emptyText: "No Profiles",
      onRefresh: provider.refresh,
    );
  }
}

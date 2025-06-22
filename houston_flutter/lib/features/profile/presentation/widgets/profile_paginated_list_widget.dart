import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/buttons.dart';
import '../../../../core/widgets/base_component.dart';
import '../../../../core/widgets/loader.dart';
import '../providers/profile_paginated_list_provider.dart';
import '../state/profile_paginated_list_state.dart';
import 'profile_list_tile_widget.dart';

class ProfilePaginatedListWidget extends BaseComponent {
  const ProfilePaginatedListWidget({super.key});

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(profilePaginatedListProvider.notifier);
    final state = ref.watch(profilePaginatedListProvider);

    switch (state) {
      case ProfilePaginatedListStateLoading():
        return const Loader();
      case ProfilePaginatedListStateSuccess():
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: state.data.results.length,
                itemBuilder: (context, index) {
                  final profile = state.data.results[index];
                  return ProfileListTileWidget(profile: profile);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppButton(
                  label: "Previous",
                  icon: Icons.chevron_left,
                  type: AppButtonType.Text,
                  onPressed:
                      state.data.page > 1
                          ? () {
                            provider.load(
                              page: state.data.page - 1,
                              limit: state.data.limit,
                            );
                          }
                          : null,
                ),
                AppButton(
                  label: "Next",
                  type: AppButtonType.Text,
                  icon: Icons.chevron_right,
                  iconTrails: true,
                  onPressed:
                      state.data.canLoadMore
                          ? () {
                            provider.load(
                              page: state.data.page + 1,
                              limit: state.data.limit,
                            );
                          }
                          : null,
                ),
              ],
            ),
          ],
        );
      case ProfilePaginatedListStateFailure():
        return Center(child: Text(state.error));
      default:
        return const SizedBox.shrink();
    }
  }
}

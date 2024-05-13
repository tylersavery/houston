import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/buttons.dart';
import '../../../../core/widgets/base_component.dart';
import '../../../../core/widgets/loader.dart';
import '../../domain/models/game_system_list_variant.dart';
import '../providers/game_system_paginated_list_provider.dart';
import '../state/game_system_paginated_list_state.dart';
import 'game_system_list_tile_widget.dart';

class GameSystemPaginatedListWidget extends BaseComponent {
  final GameSystemListVariant variant;
  final String? variantArg;

  const GameSystemPaginatedListWidget({
    super.key,
    this.variant = GameSystemListVariant.all,
    this.variantArg,
  });

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(gameSystemPaginatedListProvider(variant, variantArg).notifier);
    final state = ref.watch(gameSystemPaginatedListProvider(variant, variantArg));

    switch (state) {
      case GameSystemPaginatedListStateLoading():
        return const Loader();
      case GameSystemPaginatedListStateSuccess():
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: state.data.results.length,
                itemBuilder: (context, index) {
                  final gameSystem = state.data.results[index];
                  return GameSystemListTileWidget(gameSystem: gameSystem);
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
                  onPressed: state.data.page > 1
                      ? () {
                          provider.load(page: state.data.page - 1, limit: state.data.limit);
                        }
                      : null,
                ),
                AppButton(
                  label: "Next",
                  type: AppButtonType.Text,
                  icon: Icons.chevron_right,
                  iconTrails: true,
                  onPressed: state.data.canLoadMore
                      ? () {
                          provider.load(page: state.data.page + 1, limit: state.data.limit);
                        }
                      : null,
                ),
              ],
            ),
          ],
        );
      case GameSystemPaginatedListStateFailure():
        return Center(
          child: Text(state.error),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}

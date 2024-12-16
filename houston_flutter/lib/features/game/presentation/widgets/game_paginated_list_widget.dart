import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/buttons.dart';
import '../../../../core/widgets/base_component.dart';
import '../../../../core/widgets/loader.dart';
import '../../domain/models/game_list_variant.dart';
import '../providers/game_paginated_list_provider.dart';
import '../state/game_paginated_list_state.dart';
import 'game_list_tile_widget.dart';

class GamePaginatedListWidget extends BaseComponent {
  final GameListVariant variant;
  final String? variantArg;

  const GamePaginatedListWidget({
    super.key,
    this.variant = GameListVariant.all,
    this.variantArg,
  });

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(gamePaginatedListProvider(variant, variantArg).notifier);
    final state = ref.watch(gamePaginatedListProvider(variant, variantArg));

    switch (state) {
      case GamePaginatedListStateLoading():
        return const Loader();
      case GamePaginatedListStateSuccess():
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: state.data.results.length,
                itemBuilder: (context, index) {
                  final game = state.data.results[index];
                  return GameListTileWidget(game: game);
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
      case GamePaginatedListStateFailure():
        return Center(
          child: Text(state.error),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}

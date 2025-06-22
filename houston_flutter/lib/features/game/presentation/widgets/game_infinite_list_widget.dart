import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widgets/base_component.dart';
import '../../../../core/widgets/infinite_list_widget.dart';
import '../../domain/models/game_list_variant.dart';
import '../../domain/models/game_model.dart';
import '../providers/game_infinite_list_provider.dart';
import 'game_list_tile_widget.dart';

class GameInfiniteListWidget extends BaseComponent {
  final Function(Game)? onPressed;
  final GameListVariant variant;
  final String? variantArg;

  const GameInfiniteListWidget({
    super.key,
    this.variant = GameListVariant.all,
    this.variantArg,
    this.onPressed,
  });

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(
      gameInfiniteListProvider(variant, variantArg).notifier,
    );

    return InfiniteListWidget<Game>(
      pagingController: provider.pagingController,
      itemBuilder: (context, game, index) {
        return GameListTileWidget(game: game, onPressed: onPressed);
      },
      emptyText: "No Games",
      onRefresh: provider.refresh,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widgets/base_component.dart';
import '../../../../core/widgets/infinite_list_widget.dart';
import '../../domain/models/game_system_list_variant.dart';
import '../../domain/models/game_system_model.dart';
import '../providers/game_system_infinite_list_provider.dart';
import 'game_system_list_tile_widget.dart';

class GameSystemInfiniteListWidget extends BaseComponent {
  final Function(GameSystem)? onPressed;
  final GameSystemListVariant variant;
  final String? variantArg;

  const GameSystemInfiniteListWidget({
    super.key,
    this.variant = GameSystemListVariant.all,
    this.variantArg,
    this.onPressed,
  });

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(gameSystemInfiniteListProvider(variant, variantArg).notifier);

    return InfiniteListWidget<GameSystem>(
      pagingController: provider.pagingController,
      itemBuilder: (context, gameSystem, index) {
        return GameSystemListTileWidget(gameSystem: gameSystem, onPressed: onPressed);
      },
      emptyText: "No Game Systems",
      onRefresh: provider.refresh,
    );
  }
}

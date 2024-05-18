import 'package:flutter/material.dart';
import '../../domain/models/game_system_model.dart';

import '../../../game/domain/models/game_list_variant.dart';
import '../../../game/presentation/widgets/game_infinite_list_widget.dart';

class GameSystemDetailWidget extends StatelessWidget {
  final GameSystem gameSystem;
  const GameSystemDetailWidget({
    super.key,
    required this.gameSystem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(gameSystem.label),
        Text(gameSystem.price.toString()),
        Text(gameSystem.description),
        Expanded(
          child: GameInfiniteListWidget(
            variant: GameListVariant.gameSystem,
            variantArg: gameSystem.uid,
          ),
        ),
      ],
    );
  }
}

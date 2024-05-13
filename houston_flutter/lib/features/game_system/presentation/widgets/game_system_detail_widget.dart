import 'package:flutter/material.dart';
import 'package:houston_flutter/features/game/domain/models/game_list_variant.dart';
import 'package:houston_flutter/features/game/presentation/widgets/game_infinite_list_widget.dart';
import '../../domain/models/game_system_model.dart';

class GameSystemDetailWidget extends StatelessWidget {
  final GameSystem gameSystem;
  const GameSystemDetailWidget({
    super.key,
    required this.gameSystem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(gameSystem.label),
        Text(gameSystem.price.toString()),
        Text(gameSystem.description),
        const Divider(),
        const Text("GAMES:"),
        Expanded(
          child: GameInfiniteListWidget(
            variant: GameListVariant.system,
            variantArg: gameSystem.uid,
          ),
        ),
      ],
    );
  }
}

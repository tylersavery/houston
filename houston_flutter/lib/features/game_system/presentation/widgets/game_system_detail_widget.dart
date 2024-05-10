import 'package:flutter/material.dart';
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
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(gameSystem.label),
        Text(gameSystem.price.toString()),
        Text(gameSystem.description),
      ],
    );
  }
}

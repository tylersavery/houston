import 'package:flutter/material.dart';
import '../../domain/models/game_model.dart';

class GameDetailWidget extends StatelessWidget {
  final Game game;
  const GameDetailWidget({
    super.key,
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(game.label),
        Text(game.price.toString()),
        Text(game.description),
      ],
    );
  }
}

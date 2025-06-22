import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../domain/models/game_model.dart';
import '../screens/game_detail_screen.dart';

class GameListTileWidget extends StatelessWidget {
  final Game game;
  final Function(Game)? onPressed;

  const GameListTileWidget({super.key, required this.game, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(game.name),

        subtitle: Text(game.price.toString()),
        onTap: () {
          if (onPressed != null) {
            onPressed!(game);
            return;
          }

          context.push(GameDetailScreen.route(game.id));
        },
      ),
    );
  }
}

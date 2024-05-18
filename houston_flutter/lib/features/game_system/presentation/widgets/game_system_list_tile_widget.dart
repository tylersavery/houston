import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../domain/models/game_system_model.dart';
import '../screens/game_system_detail_screen.dart';

class GameSystemListTileWidget extends StatelessWidget {
  final GameSystem gameSystem;
  final Function(GameSystem)? onPressed;

  const GameSystemListTileWidget({
    super.key,
    required this.gameSystem,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(gameSystem.name),
        subtitle: Text(gameSystem.price.toString()),
        onTap: () {
          if (onPressed != null) {
            onPressed!(gameSystem);
            return;
          }

          context.push(GameSystemDetailScreen.route(gameSystem.id));
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/toast_utils.dart';
import '../../../../core/widgets/base_screen.dart';
import '../providers/game_form_provider.dart';
import '../widgets/game_form_widget.dart';

class GameEditScreen extends BaseScreen {
  final int? gameId;

  static String route([int? gameId]) => "/game/edit/${gameId ?? ':id'}";

  static String routeNew() => "/game/new";

  const GameEditScreen({
    super.key,
    this.gameId,
  });

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final provider = ref.read(gameFormProvider.notifier);
    final state = ref.watch(gameFormProvider);

    final isEditing = state.game.id != null;

    return AppBar(
      title: Text(isEditing ? "Edit Game" : "Create Game"),
      actions: [
        IconButton(
          onPressed: () async {
            final success = await provider.submit();
            if (success) {
              if (context.mounted) {
                Toast.message(context, "Game Saved!");
                context.pop();
              }
            }
          },
          icon: const Icon(Icons.done),
        ),
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: GameFormWidget(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/base_screen.dart';
import '../../../../core/widgets/loader.dart';
import 'game_edit_screen.dart';
import 'game_list_screen.dart';
import '../providers/game_detail_provider.dart';
import '../providers/game_form_provider.dart';
import '../widgets/game_detail_widget.dart';

class GameDetailScreen extends BaseScreen {
  final int gameId;

  static String route([int? gameId]) =>
      "${GameListScreen.route()}/${gameId ?? ':id'}";

  const GameDetailScreen({super.key, required this.gameId});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final data = ref.watch(gameDetailProvider(gameId));

    return data.when(
      loading: () => AppBar(),
      error: (error, __) => AppBar(title: const Text("Error")),
      data: (game) {
        return AppBar(
          title: Text(game.label),
          actions: [
            IconButton(
              onPressed: () async {
                await ref.read(gameFormProvider.notifier).load(gameId);
                if (context.mounted) {
                  context.push(GameEditScreen.route(gameId));
                }
              },
              icon: const Icon(Icons.edit),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final data = ref.watch(gameDetailProvider(gameId));

    return data.when(
      loading: () => const Loader(),
      error: (error, __) => Center(child: Text(error.toString())),
      data: (game) {
        return Center(child: GameDetailWidget(game: game));
      },
    );
  }
}

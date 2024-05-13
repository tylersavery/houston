import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/base_screen.dart';
import '../../../../core/widgets/loader.dart';
import 'game_system_edit_screen.dart';
import 'game_system_list_screen.dart';
import '../providers/game_system_detail_provider.dart';
import '../providers/game_system_form_provider.dart';
import '../widgets/game_system_detail_widget.dart';

class GameSystemDetailScreen extends BaseScreen {
  final int gameSystemId;
  
  static String route([int? gameSystemId]) => "${GameSystemListScreen.route()}/${gameSystemId ?? ':id'}";
  
  const GameSystemDetailScreen({super.key, required this.gameSystemId});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final data = ref.watch(gameSystemDetailProvider(gameSystemId));

    return data.when(
      loading: () => AppBar(),
      error: (error, __) => AppBar(
        title: const Text("Error"),
      ),
      data: (gameSystem) {
        return AppBar(
          title: Text(gameSystem.label),
          actions: [
            IconButton(
              onPressed: () async {
                await ref.read(gameSystemFormProvider.notifier).load(gameSystemId);
                if (context.mounted) {
                  context.push(GameSystemEditScreen.route(gameSystemId));
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
    final data = ref.watch(gameSystemDetailProvider(gameSystemId));

    return data.when(
      loading: () => const Loader(),
      error: (error, __) => Center(
        child: Text(error.toString()),
      ),
      data: (gameSystem) {
        return Center(
          child: GameSystemDetailWidget(
            gameSystem: gameSystem,
          ),
        );
      },
    );
  }
}

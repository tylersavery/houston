import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:houston_flutter/features/game/presentation/widgets/game_infinite_list_widget.dart';
import '../../../../core/widgets/base_screen.dart';
import 'game_edit_screen.dart';
import '../providers/game_form_provider.dart';

class GameListScreen extends BaseScreen {
  static String route() => "/game";

  const GameListScreen({super.key, super.includeMainDrawer = true});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("My Games"),
      actions: [
        IconButton(
          onPressed: () {
            ref.read(gameFormProvider.notifier).reset();
            context.push(GameEditScreen.routeNew());
          },
          icon: const Icon(Icons.add),
        )
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const GameInfiniteListWidget();
  }
}

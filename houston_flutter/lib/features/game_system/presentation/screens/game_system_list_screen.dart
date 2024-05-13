import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:houston_flutter/features/game_system/presentation/widgets/game_system_infinite_list_widget.dart';
import '../../../../core/widgets/base_screen.dart';
import 'game_system_edit_screen.dart';
import '../providers/game_system_form_provider.dart';

class GameSystemListScreen extends BaseScreen {
  static String route() => "/game-system";

  const GameSystemListScreen({super.key, super.includeMainDrawer = true});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("My Game Systems"),
      actions: [
        IconButton(
          onPressed: () {
            ref.read(gameSystemFormProvider.notifier).reset();
            context.push(GameSystemEditScreen.routeNew());
          },
          icon: const Icon(Icons.add),
        )
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const GameSystemInfiniteListWidget();
  }
}

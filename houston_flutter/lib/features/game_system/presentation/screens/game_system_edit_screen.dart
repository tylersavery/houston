import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/toast_utils.dart';
import '../../../../core/widgets/base_screen.dart';
import '../providers/game_system_form_provider.dart';
import '../widgets/game_system_form_widget.dart';

class GameSystemEditScreen extends BaseScreen {
  final int? gameSystemId;
  
  static String route([int? gameSystemId]) => "/game-system/edit/${gameSystemId ?? ':id'}";
  
  static String routeNew() => "/game-system/new";

  const GameSystemEditScreen({
    super.key,
    this.gameSystemId,
  });

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final provider = ref.read(gameSystemFormProvider.notifier);
    final state = ref.watch(gameSystemFormProvider);

    final isEditing = state.gameSystem.id != null;

    return AppBar(
      title: Text(isEditing ? "Edit Game System" : "Create Game System"),
      actions: [
        IconButton(
          onPressed: () async {
            final success = await provider.submit();
            if (success) {
              if (context.mounted) {
                Toast.message(context, "Game System Saved!");
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
        child: GameSystemFormWidget(),
      ),
    );
  }
}

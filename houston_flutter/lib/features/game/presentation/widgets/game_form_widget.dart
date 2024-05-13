import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../asset/presentation/widgets/upload_image_widget.dart';
import '../../../../core/theme/buttons.dart';
import '../../../game_system/domain/models/game_system_model.dart';
import '../../../game_system/presentation/widgets/game_system_infinite_list_widget.dart';

import '../providers/game_form_provider.dart';

class GameFormWidget extends ConsumerWidget {
  final int? gameId;
  const GameFormWidget({super.key, this.gameId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(gameFormProvider.notifier);
    final state = ref.watch(gameFormProvider);
    final isEditing = state.game.id != null;

    return Form(
      key: provider.formKey,
      child: Column(
        children: [
          if (state.error != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(state.error!),
            ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text("Game System"),
            subtitle: state.game.gameSystem.exists ? Text(state.game.gameSystem.name) : const Text("-"),
            trailing: AppButton(
              label: "Choose",
              onPressed: () async {
                final GameSystem? gameSystem = await showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return GameSystemInfiniteListWidget(
                      onPressed: (gameSystem) => Navigator.of(context).pop(gameSystem),
                    );
                  },
                );
                if (gameSystem != null) {
                  provider.setGameSystem(gameSystem);
                }
              },
            ),
          ),
          TextFormField(
            controller: provider.nameController,
            validator: provider.nameValidator,
            decoration: const InputDecoration(label: Text("Name")),
          ),
          TextFormField(
            controller: provider.priceController,
            validator: provider.priceValidator,
            decoration: const InputDecoration(label: Text("Price")),
          ),
          TextFormField(
            controller: provider.descriptionController,
            validator: provider.descriptionValidator,
            decoration: const InputDecoration(label: Text("Description")),
            minLines: 3,
            maxLines: 3,
          ),
          TextFormField(
            controller: provider.playersController,
            validator: provider.playersValidator,
            decoration: const InputDecoration(label: Text("Players")),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 16),
            child: UploadImageWidget(
              url: state.game.imageUrl,
              label: "Image Url",
              onComplete: (url) {
                provider.setImageUrl(url);
              },
            ),
          ),
          if (isEditing)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  final success = await provider.delete();
                  if (success) {
                    if (context.mounted) {
                      context.pop();
                      context.pop();
                    }
                  }
                },
                child: const Text("Delete Game"),
              ),
            ),
        ],
      ),
    );
  }
}

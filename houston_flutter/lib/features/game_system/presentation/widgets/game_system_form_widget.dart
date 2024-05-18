import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../asset/presentation/widgets/upload_image_widget.dart';

import '../providers/game_system_form_provider.dart';

class GameSystemFormWidget extends ConsumerWidget {
  final int? gameSystemId;
  const GameSystemFormWidget({super.key, this.gameSystemId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(gameSystemFormProvider.notifier);
    final state = ref.watch(gameSystemFormProvider);
    final isEditing = state.gameSystem.id != null;

    return Form(
      key: provider.formKey,
      child: Column(
        children: [
          if (state.error != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(state.error!),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 16),
            child: UploadImageWidget(
              url: state.gameSystem.imageUrl,
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
                child: const Text("Delete Game System"),
              ),
            ),
        ],
      ),
    );
  }
}

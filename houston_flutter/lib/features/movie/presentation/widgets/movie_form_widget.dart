import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../asset/presentation/widgets/image_upload_widget.dart';

import '../providers/movie_form_provider.dart';

class MovieFormWidget extends ConsumerWidget {
  final int? movieId;
  const MovieFormWidget({super.key, this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(movieFormProvider.notifier);
    final state = ref.watch(movieFormProvider);
    final isEditing = state.movie.id != null;

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
            controller: provider.titleController,
            validator: provider.titleValidator,
            decoration: const InputDecoration(label: Text("Title")),
          ),
          TextFormField(
            controller: provider.yearController,
            validator: provider.yearValidator,
            decoration: const InputDecoration(label: Text("Year")),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 16),
            child: ImageUploadWidget(
              currentUrl: state.movie.imageUrl,
              title: "Image Url",
              onChange: (url) {
                provider.setImageUrl(url);
              },
              onRemove: () {
                provider.setImageUrl("");
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
                child: const Text("Delete Movie"),
              ),
            ),
        ],
      ),
    );
  }
}

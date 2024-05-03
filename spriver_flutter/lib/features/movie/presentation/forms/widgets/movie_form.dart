import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spriver_flutter/features/asset/presentation/widgets/upload_file_widget.dart';
import 'package:spriver_flutter/features/movie/presentation/forms/providers/movie_form_provider.dart';

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
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
            validator: provider.titleValidator,
          ),
          TextFormField(
            controller: provider.yearController,
            decoration: const InputDecoration(
              label: Text("Year"),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            validator: provider.yearValidator,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 16),
            child: UploadImageWidget(
              url: state.movie.imageUrl,
              label: "Movie Poster Image",
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
                child: const Text("Delete"),
              ),
            ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spriver_flutter/core/utils/show_snackbar.dart';
import 'package:spriver_flutter/features/movie/presentation/providers/movie_form_provider.dart';
import 'package:spriver_flutter/features/movie/presentation/widgets/movie_form.dart';

class MovieEditPage extends ConsumerWidget {
  final int? movieId;

  static String route([int? movieId]) => "/movies/edit/${movieId ?? ':id'}";
  static String routeNew() => "/movies/new";

  const MovieEditPage({
    super.key,
    this.movieId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(movieFormProvider.notifier);
    final state = ref.watch(movieFormProvider);

    final isEditing = state.movie.id != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? "Edit Movie" : "Create Movie"),
        actions: [
          IconButton(
            onPressed: () async {
              final success = await provider.submit();
              if (success) {
                if (context.mounted) {
                  showSnackBar(context, "Movie Saved!");
                  context.pop();
                }
              }
            },
            icon: const Icon(Icons.done),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: MovieFormWidget(),
        ),
      ),
    );
  }
}

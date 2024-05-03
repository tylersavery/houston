import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spriver_flutter/core/utils/toast_utils.dart';
import 'package:spriver_flutter/core/widgets/base_screen.dart';
import 'package:spriver_flutter/features/movie/presentation/forms/providers/movie_form_provider.dart';
import 'package:spriver_flutter/features/movie/presentation/forms/widgets/movie_form.dart';

class MovieEditScreen extends BaseScreen {
  final int? movieId;

  static String route([int? movieId]) => "/movies/edit/${movieId ?? ':id'}";
  static String routeNew() => "/movies/new";

  const MovieEditScreen({
    super.key,
    this.movieId,
  });

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final provider = ref.read(movieFormProvider.notifier);
    final state = ref.watch(movieFormProvider);

    final isEditing = state.movie.id != null;

    return AppBar(
      title: Text(isEditing ? "Edit Movie" : "Create Movie"),
      actions: [
        IconButton(
          onPressed: () async {
            final success = await provider.submit();
            if (success) {
              if (context.mounted) {
                Toast.message(context, "Movie Saved!");
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
        child: MovieFormWidget(),
      ),
    );
  }
}

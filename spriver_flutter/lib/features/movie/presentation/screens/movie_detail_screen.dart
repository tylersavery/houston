import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/base_screen.dart';
import '../../../../core/widgets/loader.dart';
import '../../domain/extensions/movie_extension.dart';
import 'movie_edit_screen.dart';
import 'movie_list_screen.dart';
import '../providers/movie_detail_provider.dart';
import '../forms/providers/movie_form_provider.dart';
import '../widgets/movie_detail_widget.dart';

class MovieDetailScreen extends BaseScreen {
  final int movieId;
  static String route([int? movieId]) => "${MovieListScreen.route()}/${movieId ?? ':id'}";
  const MovieDetailScreen({super.key, required this.movieId});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final data = ref.watch(movieDetailProvider(movieId));

    return data.when(
      loading: () => AppBar(),
      error: (error, __) => AppBar(
        title: const Text("Error"),
      ),
      data: (movie) {
        return AppBar(
          title: Text(movie.label),
          actions: [
            IconButton(
              onPressed: () async {
                await ref.read(movieFormProvider.notifier).load(movieId);
                if (context.mounted) {
                  context.push(MovieEditScreen.route(movieId));
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
    final data = ref.watch(movieDetailProvider(movieId));

    return data.when(
      loading: () => const Loader(),
      error: (error, __) => Center(
        child: Text(error.toString()),
      ),
      data: (movie) {
        return Center(
          child: MovieDetailWidget(
            movie: movie,
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spriver_flutter/core/common/widgets/loader.dart';
import 'package:spriver_flutter/features/movie/presentation/pages/movie_edit_page.dart';
import 'package:spriver_flutter/features/movie/presentation/pages/movie_list_page.dart';
import 'package:spriver_flutter/features/movie/presentation/providers/movie_detail_provider.dart';
import 'package:spriver_flutter/features/movie/presentation/providers/movie_form_provider.dart';
import 'package:spriver_flutter/features/movie/presentation/widgets/movie_detail_widget.dart';

class MovieDetailPage extends StatelessWidget {
  final int movieId;
  static String route([int? movieId]) => "${MovieListPage.route()}/${movieId ?? ':id'}";
  const MovieDetailPage({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final data = ref.watch(movieDetailProvider(movieId));

        return data.when(
          loading: () => Scaffold(
            appBar: AppBar(),
            body: const Loader(),
          ),
          error: (error, __) => Scaffold(
            appBar: AppBar(
              title: const Text("Error"),
            ),
            body: Center(
              child: Text(error.toString()),
            ),
          ),
          data: (movie) {
            return Scaffold(
              appBar: AppBar(
                title: Text(movie.title),
                actions: [
                  IconButton(
                    onPressed: () async {
                      await ref.read(movieFormProvider.notifier).load(movieId);
                      if (context.mounted) {
                        context.push(MovieEditPage.route(movieId));
                      }
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ],
              ),
              body: MovieDetailWidget(
                movie: movie,
              ),
            );
          },
        );
      },
    );
  }
}

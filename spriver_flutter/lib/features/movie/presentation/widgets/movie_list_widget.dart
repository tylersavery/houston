import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spriver_flutter/core/common/widgets/loader.dart';
import 'package:spriver_flutter/features/movie/presentation/pages/movie_detail_page.dart';
import 'package:spriver_flutter/features/movie/presentation/providers/movie_list_provider.dart';

class MovieListWidget extends ConsumerWidget {
  const MovieListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(movieListProvider);

    return data.when(
      loading: () => const Loader(),
      error: (e, st) => Center(child: Text(e.toString())),
      data: (movies) {
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return Card(
              child: ListTile(
                title: Text(movie.title),
                subtitle: Text(
                  movie.year.toString(),
                ),
                onTap: () {
                  context.push(MovieDetailPage.route(movie.id));
                },
              ),
            );
          },
        );
      },
    );
  }
}

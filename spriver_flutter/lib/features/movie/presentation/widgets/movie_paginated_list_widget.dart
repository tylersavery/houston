import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spriver_flutter/core/theme/buttons.dart';
import 'package:spriver_flutter/core/widgets/base_component.dart';
import 'package:spriver_flutter/core/widgets/loader.dart';
import 'package:spriver_flutter/features/movie/domain/extensions/movie_list_extension.dart';
import 'package:spriver_flutter/features/movie/presentation/providers/movie_paginated_list_provider.dart';
import 'package:spriver_flutter/features/movie/presentation/providers/movie_paginated_list_state.dart';
import 'package:spriver_flutter/features/movie/presentation/widgets/movie_list_tile_widget.dart';

class MoviePaginatedListWidget extends BaseComponent {
  const MoviePaginatedListWidget({super.key});

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(moviePaginatedListProvider.notifier);
    final result = ref.watch(moviePaginatedListProvider);

    switch (result) {
      case MoviePaginatedListStateLoading():
        return const Loader();
      case MoviePaginatedListStateSuccess():
        final movies = result.data.results;
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return MovieListTileWidget(movie: movie);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppButton(
                  label: "Previous",
                  onPressed: result.data.page > 1
                      ? () {
                          provider.load(page: result.data.page - 1, limit: result.data.limit);
                        }
                      : null,
                ),
                AppButton(
                  label: "Next",
                  onPressed: result.data.canLoadMore
                      ? () {
                          provider.load(page: result.data.page + 1, limit: result.data.limit);
                        }
                      : null,
                ),
              ],
            ),
          ],
        );
      case MoviePaginatedListStateFailure():
        return Center(
          child: Text(result.error),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}

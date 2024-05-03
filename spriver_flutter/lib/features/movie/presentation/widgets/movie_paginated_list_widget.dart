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
    final state = ref.watch(moviePaginatedListProvider);

    switch (state) {
      case MoviePaginatedListStateLoading():
        return const Loader();
      case MoviePaginatedListStateSuccess():
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: state.data.results.length,
                itemBuilder: (context, index) {
                  final movie = state.data.results[index];
                  return MovieListTileWidget(movie: movie);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppButton(
                  label: "Previous",
                  icon: Icons.chevron_left,
                  type: AppButtonType.Text,
                  onPressed: state.data.page > 1
                      ? () {
                          provider.load(page: state.data.page - 1, limit: state.data.limit);
                        }
                      : null,
                ),
                AppButton(
                  label: "Next",
                  type: AppButtonType.Text,
                  icon: Icons.chevron_right,
                  iconTrails: true,
                  onPressed: state.data.canLoadMore
                      ? () {
                          provider.load(page: state.data.page + 1, limit: state.data.limit);
                        }
                      : null,
                ),
              ],
            ),
          ],
        );
      case MoviePaginatedListStateFailure():
        return Center(
          child: Text(state.error),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}

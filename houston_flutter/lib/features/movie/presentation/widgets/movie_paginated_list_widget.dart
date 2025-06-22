import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/buttons.dart';
import '../../../../core/widgets/base_component.dart';
import '../../../../core/widgets/loader.dart';
import '../../domain/models/movie_list_variant.dart';
import '../providers/movie_paginated_list_provider.dart';
import '../state/movie_paginated_list_state.dart';
import 'movie_list_tile_widget.dart';

class MoviePaginatedListWidget extends BaseComponent {
  final MovieListVariant variant;
  final String? variantArg;

  const MoviePaginatedListWidget({
    super.key,
    this.variant = MovieListVariant.all,
    this.variantArg,
  });

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(
      moviePaginatedListProvider(variant, variantArg).notifier,
    );
    final state = ref.watch(moviePaginatedListProvider(variant, variantArg));

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
                  onPressed:
                      state.data.page > 1
                          ? () {
                            provider.load(
                              page: state.data.page - 1,
                              limit: state.data.limit,
                            );
                          }
                          : null,
                ),
                AppButton(
                  label: "Next",
                  type: AppButtonType.Text,
                  icon: Icons.chevron_right,
                  iconTrails: true,
                  onPressed:
                      state.data.canLoadMore
                          ? () {
                            provider.load(
                              page: state.data.page + 1,
                              limit: state.data.limit,
                            );
                          }
                          : null,
                ),
              ],
            ),
          ],
        );
      case MoviePaginatedListStateFailure():
        return Center(child: Text(state.error));
      default:
        return const SizedBox.shrink();
    }
  }
}

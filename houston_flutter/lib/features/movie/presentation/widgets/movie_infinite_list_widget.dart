import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_flutter/features/movie/domain/models/movie_list_variant.dart';
import 'package:houston_flutter/features/movie/domain/models/movie_model.dart';
import '../../../../core/widgets/base_component.dart';
import '../../../../core/widgets/infinite_list_widget.dart';
import '../providers/movie_infinite_list_provider.dart';
import 'movie_list_tile_widget.dart';

class MovieInfiniteListWidget extends BaseComponent {
  final MovieListVariant variant;
  final String? variantArg;

  const MovieInfiniteListWidget({
    super.key,
    this.variant = MovieListVariant.all,
    this.variantArg,
  });

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(movieInfiniteListProvider(variant, variantArg).notifier);

    return InfiniteListWidget<Movie>(
      pagingController: provider.pagingController,
      itemBuilder: (context, movie, index) {
        return MovieListTileWidget(movie: movie);
      },
      emptyText: "No Movies",
      onRefresh: provider.refresh,
    );
  }
}

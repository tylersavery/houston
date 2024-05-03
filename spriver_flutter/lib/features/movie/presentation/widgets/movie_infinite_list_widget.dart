import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spriver_client/spriver_client.dart';
import 'package:spriver_flutter/core/widgets/base_component.dart';
import 'package:spriver_flutter/core/widgets/infinite_list_widget.dart';
import 'package:spriver_flutter/features/movie/presentation/providers/movie_infinite_list_provider.dart';
import 'package:spriver_flutter/features/movie/presentation/widgets/movie_list_tile_widget.dart';

class MovieInfiniteListWidget extends BaseComponent {
  const MovieInfiniteListWidget({super.key});

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(movieInfiniteListProvider);

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

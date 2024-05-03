import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:spriver_client/spriver_client.dart';
import 'package:spriver_flutter/core/utils/debugger_utils.dart';
import 'package:spriver_flutter/features/movie/domain/extensions/movie_list_extension.dart';
import 'package:spriver_flutter/features/movie/domain/usecases/movie_list_usecase.dart';

class MovieInfiniteListProvider {
  final Ref ref;
  final PagingController<int, Movie> pagingController = PagingController(firstPageKey: 1);

  MovieInfiniteListProvider(this.ref) {
    pagingController.addPageRequestListener((page) {
      fetchPage(page: page);
    });
  }

  Future<void> fetchPage({required int page, int limit = 1}) async {
    final result = await ref.read(movieListUseCaseProvider)(MovieListParams(page: page, limit: limit));

    result.fold((failure) {
      pagingController.error = failure.message;

      Debugger.error(
        "MoviePaginatedListProvider Fetch Error",
        failure.message,
      );
    }, (data) {
      if (data.canLoadMore) {
        pagingController.appendPage(data.results, page + 1);
      } else {
        pagingController.appendLastPage(data.results);
      }
    });
  }

  void refresh() {
    pagingController.refresh();
  }
}

final movieInfiniteListProvider = Provider<MovieInfiniteListProvider>((ref) {
  return MovieInfiniteListProvider(ref);
});

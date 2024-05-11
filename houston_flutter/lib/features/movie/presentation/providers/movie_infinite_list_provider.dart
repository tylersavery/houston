import 'package:houston_flutter/features/movie/domain/models/movie_list_variant.dart';
import 'package:houston_flutter/features/movie/domain/models/movie_model.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../config/constants.dart';
import '../../../../core/utils/debugger_utils.dart';
import '../../domain/providers/movie_repository_provider.dart';

part 'movie_infinite_list_provider.g.dart';

@Riverpod(keepAlive: true)
class MovieInfiniteList extends _$MovieInfiniteList {
  final PagingController<int, Movie> pagingController = PagingController(firstPageKey: 1);

  @override
  PagingStatus build(MovieListVariant variant, [String? arg]) {
    pagingController.addPageRequestListener((page) {
      fetchPage(page: page);
    });

    pagingController.addStatusListener((status) {
      state = status;
    });

    return PagingStatus.loadingFirstPage;
  }

  Future<void> fetchPage({required int page, int limit = Constants.defaultPaginationLimit}) async {
    final result = await ref.read(movieRepositoryProvider).list(page: page, limit: limit);

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

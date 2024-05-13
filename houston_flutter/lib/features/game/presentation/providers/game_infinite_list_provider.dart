import 'package:fpdart/fpdart.dart';
import 'package:houston_flutter/core/error/failures.dart';
import 'package:houston_flutter/core/models/paginated_response.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../config/constants.dart';
import '../../../../core/utils/debugger_utils.dart';
import '../../domain/providers/game_repository_provider.dart';
import '../../domain/models/game_list_variant.dart';
import '../../domain/models/game_model.dart';

part 'game_infinite_list_provider.g.dart';

@Riverpod(keepAlive: true)
class GameInfiniteList extends _$GameInfiniteList {
  final PagingController<int, Game> pagingController = PagingController(firstPageKey: 1);

  @override
  PagingStatus build(GameListVariant variant, [String? arg]) {
    pagingController.addPageRequestListener((page) {
      fetchPage(page: page);
    });

    pagingController.addStatusListener((status) {
      state = status;
    });

    return PagingStatus.loadingFirstPage;
  }

  Future<void> fetchPage({required int page, int limit = Constants.defaultPaginationLimit}) async {
    late final Either<Failure, PaginatedResponse<Game>> result;

    switch (variant) {
      case GameListVariant.system:
        result = await ref.read(gameRepositoryProvider).list(page: page, limit: limit, gameSystemUid: arg);
      default:
        result = await ref.read(gameRepositoryProvider).list(page: page, limit: limit);
    }

    result.fold((failure) {
      pagingController.error = failure.message;

      Debugger.error(
        "GamePaginatedListProvider Fetch Error",
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

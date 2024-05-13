import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../../config/constants.dart';
import '../../../../core/utils/debugger_utils.dart';
import '../../domain/models/game_system_model.dart';
import '../../domain/providers/game_system_repository_provider.dart';

class GameSystemInfiniteListProvider {
  final Ref ref;
  final PagingController<int, GameSystem> pagingController =
      PagingController(firstPageKey: 1);

  GameSystemInfiniteListProvider(this.ref) {
    pagingController.addPageRequestListener((page) {
      fetchPage(page: page);
    });
  }

  Future<void> fetchPage(
      {required int page, int limit = Constants.defaultPaginationLimit}) async {
    final result = await ref
        .read(gameSystemRepositoryProvider)
        .list(page: page, limit: limit);

    result.fold((failure) {
      pagingController.error = failure.message;

      Debugger.error(
        "GameSystemPaginatedListProvider Fetch Error",
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

final gameSystemInfiniteListProvider =
    Provider<GameSystemInfiniteListProvider>((ref) {
  return GameSystemInfiniteListProvider(ref);
});

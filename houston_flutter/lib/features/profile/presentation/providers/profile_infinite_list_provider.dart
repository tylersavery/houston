import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../../config/constants.dart';
import '../../../../core/utils/debugger_utils.dart';
import '../../domain/models/profile_model.dart';
import '../../domain/providers/profile_repository_provider.dart';

class ProfileInfiniteListProvider {
  final Ref ref;
  final PagingController<int, Profile> pagingController = PagingController(
    firstPageKey: 1,
  );

  ProfileInfiniteListProvider(this.ref) {
    pagingController.addPageRequestListener((page) {
      fetchPage(page: page);
    });
  }

  Future<void> fetchPage({
    required int page,
    int limit = Constants.defaultPaginationLimit,
  }) async {
    final result = await ref
        .read(profileRepositoryProvider)
        .list(page: page, limit: limit);

    result.fold(
      (failure) {
        pagingController.error = failure.message;

        Debugger.error(
          "ProfilePaginatedListProvider Fetch Error",
          failure.message,
        );
      },
      (data) {
        if (data.canLoadMore) {
          pagingController.appendPage(data.results, page + 1);
        } else {
          pagingController.appendLastPage(data.results);
        }
      },
    );
  }

  void refresh() {
    pagingController.refresh();
  }
}

final profileInfiniteListProvider = Provider<ProfileInfiniteListProvider>((
  ref,
) {
  return ProfileInfiniteListProvider(ref);
});

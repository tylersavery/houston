import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../../config/constants.dart';
import '../../../../core/utils/debugger_utils.dart';
import '../../domain/models/{{#snakeCase}}{{name}}{{/snakeCase}}_model.dart';
import '../../domain/providers/{{#snakeCase}}{{name}}{{/snakeCase}}_repository_provider.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}InfiniteListProvider {
  final Ref ref;
  final PagingController<int, {{#pascalCase}}{{name}}{{/pascalCase}}> pagingController = PagingController(firstPageKey: 1);

  {{#pascalCase}}{{name}}{{/pascalCase}}InfiniteListProvider(this.ref) {
    pagingController.addPageRequestListener((page) {
      fetchPage(page: page);
    });
  }

  Future<void> fetchPage({required int page, int limit = Constants.defaultPaginationLimit}) async {
    final result = await ref.read({{#camelCase}}{{name}}{{/camelCase}}RepositoryProvider).list(page: page, limit: limit);

    result.fold((failure) {
      pagingController.error = failure.message;

      Debugger.error(
        "{{#pascalCase}}{{name}}{{/pascalCase}}PaginatedListProvider Fetch Error",
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

final {{#camelCase}}{{name}}{{/camelCase}}InfiniteListProvider = Provider<{{#pascalCase}}{{name}}{{/pascalCase}}InfiniteListProvider>((ref) {
  return {{#pascalCase}}{{name}}{{/pascalCase}}InfiniteListProvider(ref);
});

import 'package:fpdart/fpdart.dart';
import 'package:houston_flutter/core/error/failures.dart';
import 'package:houston_flutter/core/models/paginated_response.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/models/{{#snakeCase}}{{name}}{{/snakeCase}}_model.dart';
import '../../../../config/constants.dart';
import '../../../../core/utils/debugger_utils.dart';
import '../../domain/providers/{{#snakeCase}}{{name}}{{/snakeCase}}_repository_provider.dart';
import '../../domain/models/{{#snakeCase}}{{name}}{{/snakeCase}}_list_variant.dart';
import '../../domain/models/{{#snakeCase}}{{name}}{{/snakeCase}}_model.dart';

part '{{#snakeCase}}{{name}}{{/snakeCase}}_infinite_list_provider.g.dart';

@Riverpod(keepAlive: true)
class {{#pascalCase}}{{name}}{{/pascalCase}}InfiniteList extends _${{#pascalCase}}{{name}}{{/pascalCase}}InfiniteList {
  final PagingController<int, {{#pascalCase}}{{name}}{{/pascalCase}}> pagingController = PagingController(firstPageKey: 1);

  @override
  PagingStatus build({{#pascalCase}}{{name}}{{/pascalCase}}ListVariant variant, [String? arg]) {
    pagingController.addPageRequestListener((page) {
      fetchPage(page: page);
    });

    pagingController.addStatusListener((status) {
      state = status;
    });

    return PagingStatus.loadingFirstPage;
  }

  Future<void> fetchPage({required int page, int limit = Constants.defaultPaginationLimit}) async {

    {{^hasListProviderVariantCases}}
    final result = await ref.read({{#camelCase}}{{name}}{{/camelCase}}RepositoryProvider).list(page: page, limit: limit);
    {{/hasListProviderVariantCases}}

    {{#hasListProviderVariantCases}}
    late final Either<Failure, PaginatedResponse<{{#pascalCase}}{{name}}{{/pascalCase}}>> result;

    switch (variant) {
      {{#listProviderVariantCases}}{{.}}{{/listProviderVariantCases}}
      default:
        result = await ref.read({{#camelCase}}{{name}}{{/camelCase}}RepositoryProvider).list(page: page, limit: limit);
    }
    {{/hasListProviderVariantCases}}


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

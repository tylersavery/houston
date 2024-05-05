import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../config/constants.dart';
import '../../domain/usecases/{{#snakeCase}}{{name}}{{/snakeCase}}_list_usecase.dart';
import '../state/{{#snakeCase}}{{name}}{{/snakeCase}}_paginated_list_state.dart';

part '{{#snakeCase}}{{name}}{{/snakeCase}}_paginated_list_provider.g.dart';

@Riverpod(keepAlive: true)
class {{#pascalCase}}{{name}}{{/pascalCase}}PaginatedList extends _${{#pascalCase}}{{name}}{{/pascalCase}}PaginatedList {
  @override
  {{#pascalCase}}{{name}}{{/pascalCase}}PaginatedListState build() {
    load(page: 1);
    return {{#pascalCase}}{{name}}{{/pascalCase}}PaginatedListStateInitial();
  }

  Future<void> load({required int page, int limit = Constants.defaultPaginationLimit}) async {
    state = {{#pascalCase}}{{name}}{{/pascalCase}}PaginatedListStateLoading();
    final result = await ref.read({{#camelCase}}{{name}}{{/camelCase}}ListUseCaseProvider)({{#pascalCase}}{{name}}{{/pascalCase}}ListParams(page: page, limit: limit));

    result.fold((failure) {
      state = {{#pascalCase}}{{name}}{{/pascalCase}}PaginatedListStateFailure(error: failure.message);
    }, (data) {
      state = {{#pascalCase}}{{name}}{{/pascalCase}}PaginatedListStateSuccess(data: data);
    });
  }
}

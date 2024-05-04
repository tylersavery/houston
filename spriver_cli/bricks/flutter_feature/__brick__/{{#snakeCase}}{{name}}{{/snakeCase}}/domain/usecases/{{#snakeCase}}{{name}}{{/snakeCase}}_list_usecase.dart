import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spriver_client/spriver_client.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../providers/{{#snakeCase}}{{name}}{{/snakeCase}}_repository_provider.dart';
import '../repositories/{{#snakeCase}}{{name}}{{/snakeCase}}_repository.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}ListUseCase implements UseCase<{{#pascalCase}}{{name}}{{/pascalCase}}List, {{#pascalCase}}{{name}}{{/pascalCase}}ListParams> {
  final {{#pascalCase}}{{name}}{{/pascalCase}}Repository {{#camelCase}}{{name}}{{/camelCase}}Repository;

  const {{#pascalCase}}{{name}}{{/pascalCase}}ListUseCase(this.{{#camelCase}}{{name}}{{/camelCase}}Repository);

  @override
  Future<Either<Failure, {{#pascalCase}}{{name}}{{/pascalCase}}List>> call({{#pascalCase}}{{name}}{{/pascalCase}}ListParams params) async {
    return await {{#camelCase}}{{name}}{{/camelCase}}Repository.list(page: params.page, limit: params.limit);
  }
}

class {{#pascalCase}}{{name}}{{/pascalCase}}ListParams {
  final int page;
  final int limit;

  {{#pascalCase}}{{name}}{{/pascalCase}}ListParams({required this.page, required this.limit});
}

final {{#camelCase}}{{name}}{{/camelCase}}ListUseCaseProvider = Provider<{{#pascalCase}}{{name}}{{/pascalCase}}ListUseCase>(
  (ref) {
    return {{#pascalCase}}{{name}}{{/pascalCase}}ListUseCase(ref.read({{#camelCase}}{{name}}{{/camelCase}}RepositoryProvider));
  },
);

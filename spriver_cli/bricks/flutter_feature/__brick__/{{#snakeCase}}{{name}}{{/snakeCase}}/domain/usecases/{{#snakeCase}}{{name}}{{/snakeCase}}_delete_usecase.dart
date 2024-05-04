import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../providers/{{#snakeCase}}{{name}}{{/snakeCase}}_repository_provider.dart';
import '../repositories/{{#snakeCase}}{{name}}{{/snakeCase}}_repository.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}DeleteUseCase implements UseCase<void, Delete{{#pascalCase}}{{name}}{{/pascalCase}}Params> {
  final {{#pascalCase}}{{name}}{{/pascalCase}}Repository {{#camelCase}}{{name}}{{/camelCase}}Repository;

  const {{#pascalCase}}{{name}}{{/pascalCase}}DeleteUseCase(this.{{#camelCase}}{{name}}{{/camelCase}}Repository);

  @override
  Future<Either<Failure, void>> call(Delete{{#pascalCase}}{{name}}{{/pascalCase}}Params params) async {
    return await {{#camelCase}}{{name}}{{/camelCase}}Repository.delete(params.id);
  }
}

class Delete{{#pascalCase}}{{name}}{{/pascalCase}}Params {
  final int id;
  const Delete{{#pascalCase}}{{name}}{{/pascalCase}}Params({required this.id});
}

final {{#camelCase}}{{name}}{{/camelCase}}DeleteUseCaseProvider = Provider<{{#pascalCase}}{{name}}{{/pascalCase}}DeleteUseCase>(
  (ref) {
    return {{#pascalCase}}{{name}}{{/pascalCase}}DeleteUseCase(ref.read({{#camelCase}}{{name}}{{/camelCase}}RepositoryProvider));
  },
);

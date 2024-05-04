import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spriver_client/spriver_client.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../providers/{{#snakeCase}}{{name}}{{/snakeCase}}_repository_provider.dart';
import '../repositories/{{#snakeCase}}{{name}}{{/snakeCase}}_repository.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}SaveUseCase implements UseCase<{{#pascalCase}}{{name}}{{/pascalCase}}, Save{{#pascalCase}}{{name}}{{/pascalCase}}Params> {
  final {{#pascalCase}}{{name}}{{/pascalCase}}Repository {{#camelCase}}{{name}}{{/camelCase}}Repository;

  const {{#pascalCase}}{{name}}{{/pascalCase}}SaveUseCase(this.{{#camelCase}}{{name}}{{/camelCase}}Repository);

  @override
  Future<Either<Failure, {{#pascalCase}}{{name}}{{/pascalCase}}>> call(Save{{#pascalCase}}{{name}}{{/pascalCase}}Params params) async {
    return await {{#camelCase}}{{name}}{{/camelCase}}Repository.save(params.{{#camelCase}}{{name}}{{/camelCase}});
  }
}

class Save{{#pascalCase}}{{name}}{{/pascalCase}}Params {
  final {{#pascalCase}}{{name}}{{/pascalCase}} {{#camelCase}}{{name}}{{/camelCase}};
  const Save{{#pascalCase}}{{name}}{{/pascalCase}}Params({required this.{{#camelCase}}{{name}}{{/camelCase}}});
}

final {{#camelCase}}{{name}}{{/camelCase}}SaveUseCaseProvider = Provider<{{#pascalCase}}{{name}}{{/pascalCase}}SaveUseCase>(
  (ref) {
    return {{#pascalCase}}{{name}}{{/pascalCase}}SaveUseCase(ref.read({{#camelCase}}{{name}}{{/camelCase}}RepositoryProvider));
  },
);

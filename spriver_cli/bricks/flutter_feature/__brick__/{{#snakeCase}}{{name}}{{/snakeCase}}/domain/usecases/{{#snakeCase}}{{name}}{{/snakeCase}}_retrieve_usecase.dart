import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spriver_client/spriver_client.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../providers/{{#snakeCase}}{{name}}{{/snakeCase}}_repository_provider.dart';
import '../repositories/{{#snakeCase}}{{name}}{{/snakeCase}}_repository.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}RetrieveUseCase implements UseCase<{{#pascalCase}}{{name}}{{/pascalCase}}, Retrieve{{#pascalCase}}{{name}}{{/pascalCase}}Params> {
  final {{#pascalCase}}{{name}}{{/pascalCase}}Repository {{#camelCase}}{{name}}{{/camelCase}}Repository;

  const {{#pascalCase}}{{name}}{{/pascalCase}}RetrieveUseCase(this.{{#camelCase}}{{name}}{{/camelCase}}Repository);

  @override
  Future<Either<Failure, {{#pascalCase}}{{name}}{{/pascalCase}}>> call(Retrieve{{#pascalCase}}{{name}}{{/pascalCase}}Params params) async {
    return await {{#camelCase}}{{name}}{{/camelCase}}Repository.retrieve(params.id);
  }
}

class Retrieve{{#pascalCase}}{{name}}{{/pascalCase}}Params {
  final int id;
  const Retrieve{{#pascalCase}}{{name}}{{/pascalCase}}Params({required this.id});
}

final {{#camelCase}}{{name}}{{/camelCase}}RetrieveUseCaseProvider = Provider<{{#pascalCase}}{{name}}{{/pascalCase}}RetrieveUseCase>(
  (ref) {
    return {{#pascalCase}}{{name}}{{/pascalCase}}RetrieveUseCase(ref.read({{#camelCase}}{{name}}{{/camelCase}}RepositoryProvider));
  },
);

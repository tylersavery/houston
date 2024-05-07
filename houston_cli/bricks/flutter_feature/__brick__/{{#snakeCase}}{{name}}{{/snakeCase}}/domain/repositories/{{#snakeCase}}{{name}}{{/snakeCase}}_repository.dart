import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import 'package:houston_flutter/core/models/paginated_response.dart';
import '../models/{{#snakeCase}}{{name}}{{/snakeCase}}_model.dart';

abstract interface class {{#pascalCase}}{{name}}{{/pascalCase}}Repository {
  Future<Either<Failure, PaginatedResponse<{{#pascalCase}}{{name}}{{/pascalCase}}>>> list({required int page, required int limit});
  Future<Either<Failure, {{#pascalCase}}{{name}}{{/pascalCase}}>> retrieve(int id);
  Future<Either<Failure, {{#pascalCase}}{{name}}{{/pascalCase}}>> save({{#pascalCase}}{{name}}{{/pascalCase}} {{#camelCase}}{{name}}{{/camelCase}});
  Future<Either<Failure, void>> delete(int id);
}

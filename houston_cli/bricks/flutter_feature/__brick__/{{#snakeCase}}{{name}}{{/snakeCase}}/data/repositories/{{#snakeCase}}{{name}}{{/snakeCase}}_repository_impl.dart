import 'package:fpdart/fpdart.dart';
import 'package:houston_flutter/core/models/paginated_response.dart';
import 'package:houston_flutter/features/{{#snakeCase}}{{name}}{{/snakeCase}}/data/mappers/{{#snakeCase}}{{name}}{{/snakeCase}}_mapper.dart';
import 'package:houston_flutter/features/{{#snakeCase}}{{name}}{{/snakeCase}}/domain/models/{{#snakeCase}}{{name}}{{/snakeCase}}_model.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../datasources/{{#snakeCase}}{{name}}{{/snakeCase}}_datasource.dart';
import '../../domain/repositories/{{#snakeCase}}{{name}}{{/snakeCase}}_repository.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}RespositoryImpl implements {{#pascalCase}}{{name}}{{/pascalCase}}Repository {
  final {{#pascalCase}}{{name}}{{/pascalCase}}DataSource dataSource;

  const {{#pascalCase}}{{name}}{{/pascalCase}}RespositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, PaginatedResponse<{{#pascalCase}}{{name}}{{/pascalCase}}>>> list({
    required int page,
    required int limit,
  }) async {
    try {
      final {{#camelCase}}{{name}}{{/camelCase}}DtoList = await dataSource.list(page: page, limit: limit);

      return right(
        PaginatedResponse<{{#pascalCase}}{{name}}{{/pascalCase}}>(
          page: {{#camelCase}}{{name}}{{/camelCase}}DtoList.page,
          count: {{#camelCase}}{{name}}{{/camelCase}}DtoList.count,
          numPages: {{#camelCase}}{{name}}{{/camelCase}}DtoList.numPages,
          limit: {{#camelCase}}{{name}}{{/camelCase}}DtoList.limit,
          results: {{#pascalCase}}{{name}}{{/pascalCase}}Mapper.listToModel({{#camelCase}}{{name}}{{/camelCase}}DtoList.results),
        ),
      );
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, {{#pascalCase}}{{name}}{{/pascalCase}}>> retrieve(int id) async {
    try {
      final {{#camelCase}}{{name}}{{/camelCase}}Dto = await dataSource.retrieve(id);
      return right({{#pascalCase}}{{name}}{{/pascalCase}}Mapper.toModel({{#camelCase}}{{name}}{{/camelCase}}Dto));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, {{#pascalCase}}{{name}}{{/pascalCase}}>> save({{#pascalCase}}{{name}}{{/pascalCase}} {{#camelCase}}{{name}}{{/camelCase}}) async {
    try {
      final {{#camelCase}}{{name}}{{/camelCase}}Dto = await dataSource.save({{#pascalCase}}{{name}}{{/pascalCase}}Mapper.toDto({{#camelCase}}{{name}}{{/camelCase}}));
      return right({{#pascalCase}}{{name}}{{/pascalCase}}Mapper.toModel({{#camelCase}}{{name}}{{/camelCase}}Dto));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> delete(int id) async {
    try {
      await dataSource.delete(id);
      return right(null);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}

import 'package:fpdart/fpdart.dart';
import 'package:houston_flutter/core/models/paginated_response.dart';
import 'package:houston_flutter/features/{{#snakeCase}}{{name}}{{/snakeCase}}/data/datasources/{{#snakeCase}}{{name}}{{/snakeCase}}_datasource_supabase.dart';
import 'package:houston_flutter/features/{{#snakeCase}}{{name}}{{/snakeCase}}/domain/models/{{#snakeCase}}{{name}}{{/snakeCase}}_model.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/{{#snakeCase}}{{name}}{{/snakeCase}}_repository.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}RespositoryImplSupabase implements {{#pascalCase}}{{name}}{{/pascalCase}}Repository {
  final {{#pascalCase}}{{name}}{{/pascalCase}}DataSourceSupabase dataSource;

  const {{#pascalCase}}{{name}}{{/pascalCase}}RespositoryImplSupabase(this.dataSource);

  @override
  Future<Either<Failure, PaginatedResponse<{{#pascalCase}}{{name}}{{/pascalCase}}>>> list({
    required int page,
    required int limit,
  }) async {
    try {
      final result = await dataSource.list(page: page, limit: limit);

      return right(
        PaginatedResponse<{{#pascalCase}}{{name}}{{/pascalCase}}>(
          status: 200,
          page: result.page,
          count: result.count,
          numPages: result.numPages,
          limit: result.limit,
          results: result.results,
        ),
      );
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, {{#pascalCase}}{{name}}{{/pascalCase}}>> retrieve(int id) async {
    try {
      return right(await dataSource.retrieve(id));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, {{#pascalCase}}{{name}}{{/pascalCase}}>> save({{#pascalCase}}{{name}}{{/pascalCase}} {{#camelCase}}{{name}}{{/camelCase}}) async {
    try {
      return right(await dataSource.save({{#camelCase}}{{name}}{{/camelCase}}));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> delete(int id) async {
    try {
      return right(await dataSource.delete(id));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
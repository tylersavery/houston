import 'package:fpdart/fpdart.dart';
import 'package:houston_client/houston_client.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../datasources/{{#snakeCase}}{{name}}{{/snakeCase}}_datasource.dart';
import '../../domain/repositories/{{#snakeCase}}{{name}}{{/snakeCase}}_repository.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}RespositoryImpl implements {{#pascalCase}}{{name}}{{/pascalCase}}Repository {
  final {{#pascalCase}}{{name}}{{/pascalCase}}DataSource dataSource;

  const {{#pascalCase}}{{name}}{{/pascalCase}}RespositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, {{#pascalCase}}{{name}}{{/pascalCase}}List>> list({required int page, required int limit}) async {
    try {
      return right(await dataSource.list(page: page, limit: limit));
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

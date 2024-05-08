import 'package:houston_client/houston_client.dart';
import 'package:houston_flutter/core/models/paginated_response.dart';
import '../../../../core/error/exceptions.dart';
import '../mappers/{{#snakeCase}}{{name}}{{/snakeCase}}_mapper.dart';
import '../../domain/datasources/{{#snakeCase}}{{name}}{{/snakeCase}}_datasource.dart';
import '../../domain/models/{{#snakeCase}}{{name}}{{/snakeCase}}_model.dart';


class {{#pascalCase}}{{name}}{{/pascalCase}}DataSourceServerpodImpl implements {{#pascalCase}}{{name}}{{/pascalCase}}DataSource {
  final Client client;

  const {{#pascalCase}}{{name}}{{/pascalCase}}DataSourceServerpodImpl(this.client);

  @override
  Future<PaginatedResponse<{{#pascalCase}}{{name}}{{/pascalCase}}>> list({required int page, required int limit}) async {
    try {
      final response = await client.{{#camelCase}}{{name}}{{/camelCase}}.list(page: page, limit: limit, orderBy: 'id');
      return PaginatedResponse<{{#pascalCase}}{{name}}{{/pascalCase}}>(
        status: 200,
        page: response.page,
        count: response.count,
        numPages: response.numPages,
        limit: response.limit,
        results: {{#pascalCase}}{{name}}{{/pascalCase}}Mapper.listToModel(response.results),
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<{{#pascalCase}}{{name}}{{/pascalCase}}> retrieve(int id) async {

    try {
      final result = await client.{{#camelCase}}{{name}}{{/camelCase}}.retrieve(id);
      if (result == null) {
        throw const ServerException("Not Found");
      }
      return {{#pascalCase}}{{name}}{{/pascalCase}}Mapper.toModel(result);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<{{#pascalCase}}{{name}}{{/pascalCase}}> save({{#pascalCase}}{{name}}{{/pascalCase}} {{#camelCase}}{{name}}{{/camelCase}}) async {
    try {
      final result = await client.{{#camelCase}}{{name}}{{/camelCase}}.save({{#pascalCase}}{{name}}{{/pascalCase}}Mapper.toDto({{#camelCase}}{{name}}{{/camelCase}}));
      return {{#pascalCase}}{{name}}{{/pascalCase}}Mapper.toModel(result);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      await client.{{#camelCase}}{{name}}{{/camelCase}}.delete(id);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}

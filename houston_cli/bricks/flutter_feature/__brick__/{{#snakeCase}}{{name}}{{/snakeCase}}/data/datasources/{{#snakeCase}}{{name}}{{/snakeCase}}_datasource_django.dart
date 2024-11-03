import 'package:houston_flutter/core/error/exceptions.dart';
import 'package:houston_flutter/core/models/paginated_response.dart';
import 'package:houston_flutter/core/providers/rest_session_provider.dart';
import 'package:houston_flutter/core/rest_client/rest_client.dart';
import '../../domain/datasources/{{#snakeCase}}{{name}}{{/snakeCase}}_datasource.dart';
import '../../domain/models/{{#snakeCase}}{{name}}{{/snakeCase}}_model.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}DataSourceDjangoImpl implements {{#pascalCase}}{{name}}{{/pascalCase}}DataSource {
  final RestClient client;
  final RestSession session;

  {{#pascalCase}}{{name}}{{/pascalCase}}DataSourceDjangoImpl(this.client, this.session);

  @override
  Future<PaginatedResponse<{{#pascalCase}}{{name}}{{/pascalCase}}>> list({required int page, required int limit, {{{datasourceRelationshipParams}}}}) async {
    try {
      {{{datasourceRelationshipDjangoParams}}}
      final response = await client.get("/{{#paramCase}}{{name}}{{/paramCase}}/", orderBy: 'id', data: params);
      final results = response['results'].map<{{#pascalCase}}{{name}}{{/pascalCase}}>((json) => {{#pascalCase}}{{name}}{{/pascalCase}}.fromJson(json)).toList();

      return PaginatedResponse<{{#pascalCase}}{{name}}{{/pascalCase}}>(
        status: 200,
        page: response['page'],
        count: response['count'],
        numPages: response['num_pages'],
        limit: response['limit'],
        results: results,
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<{{#pascalCase}}{{name}}{{/pascalCase}}> retrieve(int id) async {
    try {
      final response = await client.get("/{{#paramCase}}{{name}}{{/paramCase}}/$id/");
      return {{#pascalCase}}{{name}}{{/pascalCase}}.fromJson(response);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<{{#pascalCase}}{{name}}{{/pascalCase}}> save({{#pascalCase}}{{name}}{{/pascalCase}} {{#camelCase}}{{name}}{{/camelCase}}) async {
    try {
      if ({{#camelCase}}{{name}}{{/camelCase}}.exists) {
        {{=<% %>=}}
        return <% #pascalCase %><% name %><% /pascalCase %>.fromJson(await client.patch('/<% #paramCase %><% name %><% /paramCase %>/${<% #camelCase %><% name %><% /camelCase %>.id}/', data: <% #camelCase %><% name %><% /camelCase %>.toJson()));
        <%={{ }}=%>

      } else {
        return {{#pascalCase}}{{name}}{{/pascalCase}}.fromJson(await client.post('/{{#paramCase}}{{name}}{{/paramCase}}/', data: {{#camelCase}}{{name}}{{/camelCase}}.toJson()));
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      await client.delete("/{{#paramCase}}{{name}}{{/paramCase}}/$id/");
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}

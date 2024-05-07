import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:houston_client/houston_client.dart';

import '../../../../core/error/exceptions.dart';

abstract interface class {{#pascalCase}}{{name}}{{/pascalCase}}DataSource {
  Future<{{#pascalCase}}{{name}}{{/pascalCase}}DTOList> list({required int page, required int limit});
  Future<{{#pascalCase}}{{name}}{{/pascalCase}}DTO> retrieve(int id);
  Future<{{#pascalCase}}{{name}}{{/pascalCase}}DTO> save({{#pascalCase}}{{name}}{{/pascalCase}}DTO {{#camelCase}}{{name}}{{/camelCase}});
  Future<void> delete(int id);
}


class {{#pascalCase}}{{name}}{{/pascalCase}}DataSourceImpl implements {{#pascalCase}}{{name}}{{/pascalCase}}DataSource {
  final Client client;
  final SessionManager sessionManager;

  {{#pascalCase}}{{name}}{{/pascalCase}}DataSourceImpl(this.client, this.sessionManager);

  @override
  Future<{{#pascalCase}}{{name}}{{/pascalCase}}DTOList> list({required int page, required int limit}) async {
    try {
      return await client.{{#camelCase}}{{name}}{{/camelCase}}.list(page: page, limit: limit, orderBy: 'id');
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<{{#pascalCase}}{{name}}{{/pascalCase}}DTO> retrieve(int id) async {
    final result = await client.{{#camelCase}}{{name}}{{/camelCase}}.retrieve(id);
    if (result == null) {
      throw const ServerException("Not Found");
    }
    return result;
  }

  @override
  Future<{{#pascalCase}}{{name}}{{/pascalCase}}DTO> save({{#pascalCase}}{{name}}{{/pascalCase}}DTO {{#camelCase}}{{name}}{{/camelCase}}) async {
    try {
      return await client.{{#camelCase}}{{name}}{{/camelCase}}.save({{#camelCase}}{{name}}{{/camelCase}});
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

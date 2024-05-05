import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:spriver_client/spriver_client.dart';

import '../../../../core/error/exceptions.dart';

abstract interface class {{#pascalCase}}{{name}}{{/pascalCase}}DataSource {
  Future<{{#pascalCase}}{{name}}{{/pascalCase}}List> list({required int page, required int limit});
  Future<{{#pascalCase}}{{name}}{{/pascalCase}}> retrieve(int id);
  Future<{{#pascalCase}}{{name}}{{/pascalCase}}> save({{#pascalCase}}{{name}}{{/pascalCase}} {{#camelCase}}{{name}}{{/camelCase}});
  Future<void> delete(int id);
}


class {{#pascalCase}}{{name}}{{/pascalCase}}DataSourceImpl implements {{#pascalCase}}{{name}}{{/pascalCase}}DataSource {
  final Client client;
  final SessionManager sessionManager;

  {{#pascalCase}}{{name}}{{/pascalCase}}DataSourceImpl(this.client, this.sessionManager);

  @override
  Future<{{#pascalCase}}{{name}}{{/pascalCase}}List> list({required int page, required int limit}) async {
    try {
      return await client.{{#camelCase}}{{name}}{{/camelCase}}.list(page: page, limit: limit, orderBy: 'id');
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<{{#pascalCase}}{{name}}{{/pascalCase}}> retrieve(int id) async {
    final result = await client.{{#camelCase}}{{name}}{{/camelCase}}.retrieve(id);
    if (result == null) {
      throw const ServerException("Not Found");
    }
    return result;
  }

  @override
  Future<{{#pascalCase}}{{name}}{{/pascalCase}}> save({{#pascalCase}}{{name}}{{/pascalCase}} {{#camelCase}}{{name}}{{/camelCase}}) async {
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

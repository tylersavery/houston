import 'package:serverpod/serverpod.dart';
import 'package:spriver_server/src/generated/protocol.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}Endpoint extends Endpoint {
  Future<{{#pascalCase}}{{name}}{{/pascalCase}}List> list(
    Session session, {
    required int page,
    required int limit,
    String? orderBy,
  }) async {
    final count = await {{#pascalCase}}{{name}}{{/pascalCase}}.db.count(session);

    final results = await {{#pascalCase}}{{name}}{{/pascalCase}}.db.find(
      session,
      limit: limit,
      offset: (page * limit) - limit,
      orderBy: orderBy != null
          ? (t) {
              switch (orderBy.replaceAll("-", "")) {
                case 'id':
                  return t.id;
                default:
                  return t.id;
              }
            }
          : null,
      orderDescending: orderBy != null ? orderBy.contains('-') : false,
    );

    return {{#pascalCase}}{{name}}{{/pascalCase}}List(
      count: count,
      numPages: (count / limit).ceil(),
      page: page,
      results: results,
      limit: limit,
    );
  }

  Future<{{#pascalCase}}{{name}}{{/pascalCase}}?> retrieve(Session session, int id) async {
    return await {{#pascalCase}}{{name}}{{/pascalCase}}.db.findById(session, id);
  }

  Future<{{#pascalCase}}{{name}}{{/pascalCase}}> save(Session session, {{#pascalCase}}{{name}}{{/pascalCase}} {{#camelCase}}{{name}}{{/camelCase}}) async {
    return await ({{#camelCase}}{{name}}{{/camelCase}}.id != null ? {{#pascalCase}}{{name}}{{/pascalCase}}.db.updateRow(session, {{#camelCase}}{{name}}{{/camelCase}}) : {{#pascalCase}}{{name}}{{/pascalCase}}.db.insertRow(session, {{#camelCase}}{{name}}{{/camelCase}}));
  }

  Future<void> delete(Session session, int id) async {
    await {{#pascalCase}}{{name}}{{/pascalCase}}.db.deleteWhere(session, where: (row) => row.id.equals(id));
  }
}

import 'package:serverpod/serverpod.dart';
import 'package:houston_server/src/generated/protocol.dart';
import 'package:houston_server/src/utils/strings.dart';

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
                case 'createdAt':
                  return t.createdAt;
                case 'updatedAt':
                  return t.updatedAt;
                {{#additionalOrdering}}{{{.}}}
                {{/additionalOrdering}}
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
    if ({{#camelCase}}{{name}}{{/camelCase}}.id != null) {
      final existing{{#pascalCase}}{{name}}{{/pascalCase}} = await {{#pascalCase}}{{name}}{{/pascalCase}}.db.findById(session, {{#camelCase}}{{name}}{{/camelCase}}.id!);

      if (existing{{#pascalCase}}{{name}}{{/pascalCase}} != null) {
        return await {{#pascalCase}}{{name}}{{/pascalCase}}.db.updateRow(
          session,
          {{#camelCase}}{{name}}{{/camelCase}}.copyWith(
            uid: existing{{#pascalCase}}{{name}}{{/pascalCase}}.uid,
            createdAt: existing{{#pascalCase}}{{name}}{{/pascalCase}}.createdAt,
            updatedAt: DateTime.now(),
          ),
        );
      }
    }

    final uid = await _uniqueUid(session);
    return await {{#pascalCase}}{{name}}{{/pascalCase}}.db.insertRow(
      session,
      {{#camelCase}}{{name}}{{/camelCase}}.copyWith(uid: uid, createdAt: DateTime.now(), updatedAt: DateTime.now()),
    );
  }

  Future<void> delete(Session session, int id) async {
    await {{#pascalCase}}{{name}}{{/pascalCase}}.db.deleteWhere(session, where: (row) => row.id.equals(id));
  }

  Future<String> _uniqueUid(Session session) async {
    late String uid;

    while (true) {
      uid = generateRandomString(8);
      final unique = (await {{#pascalCase}}{{name}}{{/pascalCase}}.db.findFirstRow(session, where: (row) => row.uid.equals(uid))) == null;
      if (unique) {
        return uid;
      }
    }
  }
}

import 'package:serverpod/serverpod.dart';
import 'package:houston_server/src/generated/protocol.dart';
import 'package:houston_server/src/utils/strings.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}Endpoint extends Endpoint {
  Future<{{#pascalCase}}{{name}}{{/pascalCase}}DTOList> list(
    Session session, {
    required int page,
    required int limit,
    String? orderBy,
    {{{endpointRelationshipParams}}}
  }) async {
    final count = await {{#pascalCase}}{{name}}{{/pascalCase}}DTO.db.count(session);

    final results = await {{#pascalCase}}{{name}}{{/pascalCase}}DTO.db.find(
      session,
      limit: limit,
      offset: (page * limit) - limit,
      orderBy: orderBy != null
          ? (t) {
              switch (orderBy.replaceAll("-", "")) {
                case 'createdAt':
                  return t.createdAt;
                {{#additionalOrdering}}{{{.}}}
                {{/additionalOrdering}}
                default:
                  return t.id;
              }
            }
          : null,
      orderDescending: orderBy != null ? orderBy.contains('-') : false,
      {{endpointIncludes}}
      {{{endpointRelationshipWhereClause}}}
    );

    return {{#pascalCase}}{{name}}{{/pascalCase}}DTOList(
      count: count,
      numPages: (count / limit).ceil(),
      page: page,
      results: results,
      limit: limit,
    );
  }

  Future<{{#pascalCase}}{{name}}{{/pascalCase}}DTO?> retrieve(Session session, int id) async {
    return await {{#pascalCase}}{{name}}{{/pascalCase}}DTO.db.findById(session, id, {{endpointIncludes}});
  }

  Future<{{#pascalCase}}{{name}}{{/pascalCase}}DTO> save(Session session, {{#pascalCase}}{{name}}{{/pascalCase}}DTO {{#camelCase}}{{name}}{{/camelCase}}) async {
    if ({{#camelCase}}{{name}}{{/camelCase}}.id != null) {
      final existing{{#pascalCase}}{{name}}{{/pascalCase}} = await {{#pascalCase}}{{name}}{{/pascalCase}}DTO.db.findById(session, {{#camelCase}}{{name}}{{/camelCase}}.id!,{{endpointIncludes}});

      if (existing{{#pascalCase}}{{name}}{{/pascalCase}} != null) {
        return await {{#pascalCase}}{{name}}{{/pascalCase}}DTO.db.updateRow(
          session,
          {{#camelCase}}{{name}}{{/camelCase}}.copyWith(
            uid: existing{{#pascalCase}}{{name}}{{/pascalCase}}.uid,
            createdAt: existing{{#pascalCase}}{{name}}{{/pascalCase}}.createdAt,
          ),
        );
      }
    }

    final uid = await _uniqueUid(session);
    final new{{#pascalCase}}{{name}}{{/pascalCase}} = await {{#pascalCase}}{{name}}{{/pascalCase}}DTO.db.insertRow(
      session,
      {{#camelCase}}{{name}}{{/camelCase}}.copyWith(uid: uid, createdAt: DateTime.now()),
    );

    return new{{#pascalCase}}{{name}}{{/pascalCase}}.copyWith({{copyWithForRelationships}});
  }

  Future<void> delete(Session session, int id) async {
    await {{#pascalCase}}{{name}}{{/pascalCase}}DTO.db.deleteWhere(session, where: (row) => row.id.equals(id));
  }

  Future<String> _uniqueUid(Session session) async {
    late String uid;

    while (true) {
      uid = generateRandomString(8);
      final unique = (await {{#pascalCase}}{{name}}{{/pascalCase}}DTO.db.findFirstRow(session, where: (row) => row.uid.equals(uid))) == null;
      if (unique) {
        return uid;
      }
    }
  }
}

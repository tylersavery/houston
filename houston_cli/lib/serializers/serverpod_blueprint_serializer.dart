import 'package:houston_cli/constants.dart';
import 'package:houston_cli/serializers/blueprint_serializer.dart';
import 'package:houston_cli/utils/string_utils.dart';

class ServerpodBlueprintSerializer extends BlueprintSerializer {
  const ServerpodBlueprintSerializer({required super.blueprint});

  List<String> get modelFields {
    List<String> items = [];

    for (final p in properties) {
      if (p.type == "user") {
        continue;
      }
      final isRelationship = !Constants.primitives.contains(p.type);
      items.add(
          "  ${camelCase(p.name)}: ${p.dartTypeAsString}${isRelationship ? 'DTO' : ''}${p.allowNull || isRelationship ? '?' : ''}${isRelationship ? ', relation' : ''}");
    }

    return items;
  }

  List<String> get additionalOrdering {
    List<String> items = [];

    for (final p in properties) {
      if (p.orderable) {
        items.add("case '${camelCase(p.name)}':\n\treturn t.${camelCase(p.name)};");
      }
    }
    return items;
  }

  String get endpointIncludes {
    final items = properties.where((p) => !Constants.primitives.contains(p.type) && p.type != 'user').toList();

    if (items.isEmpty) {
      return '';
    }

    String output = """
include: ${pascalCase(name)}DTO.include(
        ${items.map((p) => "${camelCase(p.name)}: ${pascalCase(p.name)}DTO.include(),").join("\n")}
      ),""";

    return output;
  }

  String get copyWithForRelationships {
    final items = properties.where((p) => !Constants.primitives.contains(p.type) && p.type != "user").toList();

    if (items.isEmpty) {
      return '';
    }

    return items.map((p) => "${camelCase(p.name)}: ${camelCase(name)}.${camelCase(p.name)}").join(", ");
  }

  String get endpointRelationshipParams {
    final List<String> params = [];
    for (final property in properties) {
      if (property.type == 'user') continue;
      if (!Constants.primitives.contains(property.type)) {
        params.add("String? ${camelCase(property.name)}Uid");
      }
    }

    return params.join(", ");
  }

  String get endpointRelationshipWhereClause {
    List<String> clauses = [];
    for (final property in properties) {
      if (property.type == 'user') continue;
      if (!Constants.primitives.contains(property.type)) {
        final str = """
if (${camelCase(property.name)}Uid != null) {
  return t.${camelCase(property.name)}.uid.equals(${camelCase(property.name)}Uid);
}
""";
        clauses.add(str);
      }
    }

    if (clauses.isNotEmpty) {
      return """
where: (t) {
  ${clauses.join('\n')}
  return t.id.notEquals(0); 
},
""";
    }
    return "";
  }

  @override
  Map<String, dynamic> serialize() {
    return {
      'name': name,
      'modelFields': modelFields,
      'additionalOrdering': additionalOrdering,
      'endpointIncludes': endpointIncludes,
      'copyWithForRelationships': copyWithForRelationships,
      'endpointRelationshipParams': endpointRelationshipParams,
      'endpointRelationshipWhereClause': endpointRelationshipWhereClause,
    };
  }
}

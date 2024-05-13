import 'package:houston_cli/constants.dart';
import 'package:houston_cli/serializers/blueprint_serializer.dart';
import 'package:houston_cli/utils/string_utils.dart';

class ServerpodBlueprintSerializer extends BlueprintSerializer {
  const ServerpodBlueprintSerializer({required super.blueprint});

  List<String> get modelFields {
    List<String> items = [];

    for (final p in properties) {
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
    final items = properties.where((p) => !Constants.primitives.contains(p.type)).toList();

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
    final items = properties.where((p) => !Constants.primitives.contains(p.type)).toList();

    if (items.isEmpty) {
      return '';
    }

    return items.map((p) => "${camelCase(p.name)}: ${camelCase(name)}.${camelCase(p.name)}").join(", ");
  }

  @override
  Map<String, dynamic> serialize() {
    return {
      'name': name,
      'modelFields': modelFields,
      'additionalOrdering': additionalOrdering,
      'endpointIncludes': endpointIncludes,
      'copyWithForRelationships': copyWithForRelationships,
    };
  }
}

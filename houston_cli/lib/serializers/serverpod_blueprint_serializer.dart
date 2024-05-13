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

  get additionalOrdering {
    List<String> items = [];

    for (final p in properties) {
      if (p.orderable) {
        items.add("case '${camelCase(p.name)}':\n\treturn t.${camelCase(p.name)};");
      }
    }
    return items;
  }

  @override
  Map<String, dynamic> serialize() {
    return {
      'name': name,
      'modelFields': modelFields,
      'additionalOrdering': additionalOrdering,
    };
  }
}

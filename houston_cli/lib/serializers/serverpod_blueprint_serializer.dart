import 'package:houston_cli/constants.dart';
import 'package:houston_cli/serializers/blueprint_serializer.dart';
import 'package:houston_cli/utils/string_utils.dart';
import 'package:collection/collection.dart';

class ServerpodBlueprintSerializer extends BlueprintSerializer {
  const ServerpodBlueprintSerializer({required super.blueprint});

  List<String> get modelFields {
    List<String> items = [];

    for (final p in properties) {
      items.add("  ${camelCase(p.name)}: ${p.dartTypeAsString}${p.allowNull ? '?' : ''}");
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

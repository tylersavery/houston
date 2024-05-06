import 'package:spriver_cli/constants.dart';
import 'package:spriver_cli/serializers/blueprint_serializer.dart';
import 'package:spriver_cli/utils/string_utils.dart';
import 'package:collection/collection.dart';

class ServerpodBlueprintSerializer extends BlueprintSerializer {
  const ServerpodBlueprintSerializer({required super.blueprint});

  List<String> get modelFields {
    List<String> items = [];

    for (final p in properties) {
      items.add("  ${camelCase(p.name)}: ${p.dartTypeAsString}");
    }

    return items;
  }

  @override
  Map<String, dynamic> serialize() {
    return {
      'name': name,
      'modelFields': modelFields,
    };
  }
}

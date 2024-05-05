import 'package:spriver_cli/constants.dart';
import 'package:spriver_cli/models/blueprint_property.dart';
import 'package:spriver_cli/utils/string_utils.dart';
import 'package:yaml/yaml.dart';

class Blueprint {
  final String name;
  final List<BlueprintProperty> properties;
  late String namePlural;
  late String label;
  late String labelPlural;

  Blueprint({
    required this.name,
    required this.properties,
    String? namePlural,
    String? label,
    String? labelPlural,
  }) {
    this.namePlural = namePlural ?? "${name}s";
    this.label = label ?? titleCase(name);
    this.labelPlural = labelPlural ?? "${titleCase(name)}s";
  }

  factory Blueprint.fromYaml(YamlMap data) {
    final properties = data['properties'].map<BlueprintProperty>((p) => BlueprintProperty.fromYaml(p)).toList();

    return Blueprint(
      name: data['name'],
      properties: properties,
    );
  }

  Map<String, dynamic> serializeServerpod() {
    return {
      'name': name,
    };
  }
}

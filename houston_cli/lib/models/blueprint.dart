import 'package:houston_cli/models/blueprint_property.dart';
import 'package:houston_cli/utils/string_utils.dart';
import 'package:yaml/yaml.dart';

class Blueprint {
  final String name;
  final List<BlueprintProperty> properties;
  final List<String>? children;
  late String namePlural;
  late String label;
  late String labelPlural;

  Blueprint({
    required this.name,
    required this.properties,
    this.children,
    String? namePlural,
    String? label,
    String? labelPlural,
  }) {
    this.namePlural = namePlural ?? "${name}s";
    this.label = label ?? titleCase(name);
    this.labelPlural = labelPlural ?? "${titleCase(name)}s";
  }

  factory Blueprint.fromYaml(YamlMap data) {
    //TODO: allow auto fields to be omitted (metadata)

    final List<BlueprintProperty> properties = [
      BlueprintProperty(
        name: "uid",
        type: 'string',
        allowBlank: false,
        allowNull: false,
      ),
    ];

    properties.addAll(data['properties'].map<BlueprintProperty>((p) => BlueprintProperty.fromYaml(p)).toList());

    properties.add(
      BlueprintProperty(
        name: "createdAt",
        type: 'datetime',
        allowBlank: false,
        allowNull: false,
      ),
    );

    print(data['children']);

    return Blueprint(
      name: data['name'],
      properties: properties,
      children: data['children'],
    );
  }

  Map<String, dynamic> serializeServerpod() {
    return {
      'name': name,
    };
  }
}

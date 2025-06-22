import 'dart:io';

import 'package:houston_cli/models/blueprint_property.dart';
import 'package:houston_cli/utils/file_utils.dart';
import 'package:houston_cli/utils/string_utils.dart';
import 'package:yaml/yaml.dart';

class Blueprint {
  final String name;
  final List<BlueprintProperty> properties;
  final List<String>? children;
  late String namePlural;
  late String label;
  late String labelPlural;
  late String module;

  Blueprint({
    required this.name,
    required this.properties,
    this.children,
    String? module,
    String? namePlural,
    String? label,
    String? labelPlural,
  }) {
    this.namePlural = namePlural ?? "${name}s";
    this.label = label ?? titleCase(name);
    this.labelPlural = labelPlural ?? "${titleCase(name)}s";
    this.module = module != null ? snakeCase(module) : "content";
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

    properties.addAll(data['properties']
        .map<BlueprintProperty>((p) => BlueprintProperty.fromYaml(p))
        .toList());

    properties.add(
      BlueprintProperty(
        name: "createdAt",
        type: 'datetime',
        allowBlank: false,
        allowNull: false,
      ),
    );

    properties.add(
      BlueprintProperty(
        name: "owner",
        type: 'user',
        djangoAppName: "access",
        allowBlank: false,
        allowNull: false,
      ),
    );

    // search other blueprints for relationships to this model
    final otherBlueprintFiles = Directory(FileUtils.blueprintsDir)
        .listSync()
        .where((entity) =>
            entity is File &&
            entity.path.endsWith('.yaml') &&
            !entity.path.endsWith("${camelCase(data['name'])}.yaml"))
        .toList();

    List<String> children = [];
    for (final f in otherBlueprintFiles) {
      final parsedYaml = FileUtils.parseYaml(f.path);
      final properties = parsedYaml['properties'];
      for (final p in properties) {
        if (snakeCase(p['type']) == snakeCase(data['name'])) {
          children.add(snakeCase(parsedYaml['name']));
        }
      }
    }

    return Blueprint(
      name: data['name'],
      properties: properties,
      module: data['module'],
      children: children.isNotEmpty ? children : null,
    );
  }
}

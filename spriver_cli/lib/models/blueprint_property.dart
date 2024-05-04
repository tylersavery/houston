import 'package:dcli/dcli.dart';
import 'package:yaml/yaml.dart';

class BlueprintProperty {
  final String name;
  final String type;
  final int? maxLength;
  final dynamic defaultValue;
  final bool allowBlank;
  final bool allowNull;
  final String module;
  final int? uiHeading;
  final bool isImage;

  const BlueprintProperty({
    required this.name,
    required this.type,
    required this.allowBlank,
    required this.allowNull,
    required this.module,
    required this.isImage,
    this.maxLength,
    this.defaultValue,
    this.uiHeading,
  });

  factory BlueprintProperty.fromYaml(YamlMap data) {
    String? type = data['type'];

    if (type == null) {
      throw Exception(red("type required"));
    }

    String module = 'root';

    if (type.contains('.')) {
      final parts = type.split('.');
      module = parts.first;
      type = type.split('.').last;
    }

    // if (!PROPERTY_TYPES.contains(data['type'])) {
    //   throw Exception(red("Invalid Property Type `$type`"));
    // }

    return BlueprintProperty(
      name: data['name'],
      type: type.toString().toLowerCase(),
      maxLength: data['max_length'],
      allowBlank: data['blank'] ?? false,
      allowNull: data['null'] ?? false,
      defaultValue: data['default'],
      module: module,
      uiHeading: data['ui_heading'],
      isImage: data['image'] ?? false,
    );
  }
}

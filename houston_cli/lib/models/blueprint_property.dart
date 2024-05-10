import 'package:dcli/dcli.dart';
import 'package:houston_cli/constants.dart';
import 'package:houston_cli/utils/string_utils.dart';
import 'package:yaml/yaml.dart';

class BlueprintProperty {
  final String name;
  final String type;
  final int? maxLength;
  final dynamic defaultValue;
  final bool allowBlank;
  final bool allowNull;
  final int? uiHeading;
  final bool uiDescription;
  final bool isImage;
  final bool orderable;

  const BlueprintProperty({
    required this.name,
    required this.type,
    required this.allowBlank,
    required this.allowNull,
    this.isImage = false,
    this.maxLength,
    this.defaultValue,
    this.uiHeading,
    this.uiDescription = false,
    this.orderable = false,
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
      maxLength: data['maxLength'],
      allowBlank: data['blank'] ?? false,
      allowNull: data['null'] ?? false,
      defaultValue: data['default'],
      uiHeading: data['uiHeading'],
      isImage: data['image'] ?? false,
      uiDescription: data['uiDescription'] == true,
      orderable: data['orderable'] == true,
    );
  }

  bool get isStringish {
    return ['char', 'string', 'url', 'text'].contains(type);
  }

  bool get isNumeric {
    return ['int', 'double'].contains(type);
  }

  String _modelAnnotationValueToString(Map<String, dynamic> kv) {
    final v = kv[kv.keys.first];
    if (v.toString().contains("ToJson")) {
      return '${kv.keys.first}: $v';
    }

    if (v.runtimeType == String) {
      return '${kv.keys.first}: "$v"';
    }
    return '${kv.keys.first}: $v';
  }

  List<Map<String, dynamic>> get _modelAnnotations {
    final List<Map<String, dynamic>> values = [];
    if (snakeCase(name) != camelCase(name)) {
      values.add({'name': snakeCase(name)});
    }

    if (defaultValue != null) {
      values.add({"defaultValue": defaultValue});
    }

    // if (!Constants.primitives.contains(type)) {
    //   values.add({"toJson": "${type}ToJson"});
    // }

    if (name == "createdAt" || name == 'uid') {
      values.add({"includeToJson": false});
    }

    return values;
  }

  String get _modelAnnotation {
    final values = _modelAnnotations;

    if (values.isNotEmpty) {
      return '@JsonKey(${values.map((item) => _modelAnnotationValueToString(item)).toList().join(", ")}) ';
    }

    return '';
  }

  String get modelField {
    final value =
        "$_modelAnnotation${allowNull == true && defaultValue == null ? '' : 'required '}$dartTypeAsString${allowNull ? '?' : ''} ${camelCase(name)},";
    return value;
  }

  String? get flutterEmptyParam {
    if (name == 'uid') {
      return '""';
    }

    if (name == 'createdAt' || name == "updatedAt") {
      return "DateTime.now()";
    }

    if (!allowNull) {
      final defaultValueString = defaultValue.toString();

      switch (type) {
        case "char":
        case "text":
        case "url":
        case "string":
          if (defaultValue != null) {
            return '"$defaultValueString"';
          } else {
            return '""';
          }
        case "bool":
          if (defaultValue != null) {
            return defaultValueString;
          } else {
            return 'false';
          }

        case "int":
        case "double":
          if (defaultValue != null) {
            return defaultValueString;
          } else {
            return '0';
          }
        case "datetime":
          return "DateTime.now()";
        case 'user':
          return 'emptyUser()';
        default:
          return '${pascalCase(type)}.empty()';
      }
    }
    return null;
  }

  String get dartTypeAsString {
    switch (type) {
      case "char":
      case "text":
      case "url":
      case "string":
        return 'String';
      case "bool":
        return 'bool';
      case "int":
        return 'int';
      case "double":
        return 'double';
      case "datetime":
        return 'DateTime';
      case 'user':
        return 'User';
      default:
        return "${pascalCase(type)}";
    }
  }

  Map<String, dynamic> serialize() {
    return {
      'name': name,
      'type': type,
      'maxLength': maxLength,
      'default': defaultValue,
      'allowBlank': allowBlank,
      'allowNull': allowNull,
      'modelField': modelField,
    };
  }
}

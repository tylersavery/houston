import 'package:dcli/dcli.dart';
import 'package:houston_cli/config.dart';
import 'package:houston_cli/constants.dart';
import 'package:houston_cli/models/kwarg.dart';
import 'package:houston_cli/utils/string_utils.dart';
import 'package:yaml/yaml.dart';

final config = HoustonConfig.getConfig();

class BlueprintProperty {
  final String name;
  final String djangoAppName;
  final String type;
  final int? maxLength;
  final dynamic defaultValue;
  final bool allowBlank;
  final bool allowNull;
  final int? uiHeading;
  final bool uiDescription;
  final bool imagePreview;
  final bool isImage;
  final bool orderable;

  const BlueprintProperty({
    required this.name,
    required this.type,
    required this.allowBlank,
    required this.allowNull,
    this.djangoAppName = "content",
    this.isImage = false,
    this.maxLength,
    this.defaultValue,
    this.uiHeading,
    this.uiDescription = false,
    this.imagePreview = false,
    this.orderable = false,
  });

  factory BlueprintProperty.fromYaml(YamlMap data) {
    String? type = data['type'];

    if (type == null) {
      throw Exception(red("type required"));
    }

    return BlueprintProperty(
      name: data['name'],
      type: type.toString().toLowerCase(),
      maxLength: data['maxLength'],
      allowBlank: data['allowBlank'] ?? false,
      allowNull:
          !Constants.primitives.contains(type.toString().toLowerCase()) ||
              (data['allowNull'] == true &&
                  data['allowBlank'] != true &&
                  data['default'] == null),
      defaultValue: data['default'],
      uiHeading: data['uiHeading'],
      isImage: data['image'] ?? false,
      uiDescription: data['uiDescription'] == true,
      imagePreview: data['imagePreview'] == true,
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
    if (config.backend == ServerBackendOption.serverpod) {
      return [];
    }

    final List<Map<String, dynamic>> values = [];
    if (snakeCase(name) != camelCase(name)) {
      values.add({'name': snakeCase(name)});
    }

    if (defaultValue != null) {
      values.add({"defaultValue": defaultValue});
    }

    if (!Constants.primitives.contains(type)) {
      values.add({"toJson": "${camelCase(type)}ToJson"});
    }

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
    if (type == 'user') return "";

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
        return pascalCase(type);
    }
  }

  String get _djangoVariableType {
    switch (type) {
      case "char":
        return 'models.CharField';
      case "text":
        return 'models.TextField';
      case "url":
      case "bitpack_image":
      case "bitpack_file":
        return 'models.URLField';
      case "boolean":
      case "bool":
        return 'models.BooleanField';
      case "int":
        return 'models.IntegerField';
      case "double":
        return 'models.DecimalField';
      case "datetime":
      case "date":
        return 'models.DateTimeField';
      default:
        return "models.ForeignKey";
    }
  }

  String get djangoModelEntry {
    if (['uuid', 'uid', 'created_at', 'updated_at', 'id']
        .contains(snakeCase(name))) {
      return "";
    }

    List<String> args = [];
    List<Kwarg> kwargs = [];

    if (Constants.primitives.contains(type)) {
      args.add('_("${titleCase(name)}")');
    } else {
      args.add('"${snakeCase(djangoAppName)}.${pascalCase(type)}"');
      kwargs.add(Kwarg('verbose_name', '_("${titleCase(name)}")'));
      kwargs.add(Kwarg('on_delete', 'models.CASCADE'));
    }

    if (type == "double" || type == "decimal") {
      kwargs.add(Kwarg('decimal_places', 2)); //TODO: get from blueprint
      kwargs.add(Kwarg('max_digits', 12)); //TODO: get from blueprint
    }

    if (type == 'char') {
      kwargs.add(Kwarg('max_length', maxLength ?? 255));
    }

    if (defaultValue != null) {
      final defaultValueString = defaultValue.toString();
      String? value;

      if (defaultValueString == "true") {
        value = "True";
      } else if (defaultValueString == "false") {
        value = "False";
      } else if (int.tryParse(defaultValueString) != null ||
          double.tryParse(defaultValueString) != null) {
        value = defaultValueString;
      } else {
        value = '"$defaultValueString"';
      }

      kwargs.add(Kwarg('default', value));
    }
    if (allowBlank) {
      kwargs.add(Kwarg("blank", "True"));
    }
    if (allowNull) {
      kwargs.add(Kwarg("null", "True"));
    }

    final kwargsString =
        kwargs.map((p) => "${p.key}=${p.value},").toList().join(' ');
    String params = args.join(", ");

    params = '$params, $kwargsString';

    if (Constants.primitives.contains(type)) {
      return '''${snakeCase(name)} = $_djangoVariableType($params)''';
    }

    if (type == "bool") {
      return '''${snakeCase(name)} = models.BooleanField($params)''';
    }

    return '''${snakeCase(name)} = models.ForeignKey($params)''';
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
      'djangoModelEntry': djangoModelEntry,
    };
  }
}

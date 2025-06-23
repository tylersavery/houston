import 'package:collection/collection.dart';
import 'package:houston_cli/constants.dart';
import 'package:houston_cli/models/blueprint_property.dart';
import 'package:houston_cli/serializers/blueprint_serializer.dart';
import 'package:houston_cli/utils/string_utils.dart';

class DjangoBlueprintSerializer extends BlueprintSerializer {
  final String appName;

  const DjangoBlueprintSerializer(
      {required super.blueprint, required this.appName});

  List<String> get modelImports {
    final List<String> importStrings = [];
    for (final p in properties) {
      if (!Constants.primitives.contains(p.type)) {
        if (p.type == "user") {
          importStrings.add("from django.contrib.auth import get_user_model");
        } else {
          importStrings.add(
              "from ${snakeCase(appName)}.models import ${pascalCase(p.type)}");
        }
      }
    }

    return importStrings;
  }

  bool get shouldRegisterUser {
    return properties.firstWhereOrNull(
            (p) => p.djangoAppName == 'access' && p.type == 'user') !=
        null;
  }

  List<Map<String, dynamic>> get propertiesForSerializer {
    final List<BlueprintProperty> results = [];
    for (final p in properties) {
      if (p.name == 'created_at') continue;
      if (p.type == 'user') continue;
      results.add(p);
    }

    return results.map<Map<String, dynamic>>((p) => p.serialize()).toList();
  }

  List<Map<String, dynamic>> get readOnlyPropertiesForSerializer {
    final List<BlueprintProperty> results = [];
    for (final p in properties) {
      if (p.type == "user") {
        results.add(p);
      }
    }

    return results.map<Map<String, dynamic>>((p) => p.serialize()).toList();
  }

  @override
  Map<String, dynamic> serialize() {
    return {
      'name': name,
      'namePlural': namePlural,
      'appName': appName,
      'properties':
          properties.map<Map<String, dynamic>>((p) => p.serialize()).toList(),
      'propertiesForSerializer': propertiesForSerializer,
      'readOnlyPropertiesForSerializer': readOnlyPropertiesForSerializer,
      'modelImports': modelImports.toSet().toList()..sort(),
      'shouldRegisterUser': shouldRegisterUser,
      'label': blueprint.label,
      'labelPlural': blueprint.labelPlural,
    };
  }
}

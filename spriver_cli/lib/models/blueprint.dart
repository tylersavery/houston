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

  Map<String, dynamic> serialize() {
    return {
      'name': name,
    };
    // return {
    //   'project': appName(),
    //   'name': name,
    //   'namePlural': namePlural,
    //   'label': label,
    //   'labelPlural': labelPlural,
    //   'properties': properties.map<Map<String, dynamic>>((p) => p.serialize()).toList(),
    //   'appModelImports': appModelImports,
    //   'appFormImports': appFormImports,
    //   'appFormProviderImports': appFormProviderImports,
    //   'appDbServiceImports': appDbServiceImports,
    //   'serviceModelImports': serviceModelImports.toSet().toList()..sort(),
    //   'shouldRegisterUser': shouldRegisterUser,
    //   'uiHeading1': properties.firstWhereOrNull((p) => p.uiHeading == 1)?.name ?? 'uuid',
    //   'uiHeading2': properties.firstWhereOrNull((p) => p.uiHeading == 2)?.name ?? 'uuid',
    //   'emptyFactoryParams': appEmptyFactoryParams,
    //   'appFormControllers': appFormControllers,
    //   'appFormControllerListeners': appFormControllerListeners,
    //   'appFormSetters': appFormSetters,
    //   'appCustomFormSetters': appCustomFormSetters,
    //   'appAdditionalFormValidation': appAdditionalFormValidation,
    //   'appFormValidators': appFormValidators,
    //   'appFormClearers': appFormClearers,
    //   'appFormInputs': appFormInputs,
    //   'appJoins': appJoins,
    //   'appHasJoins': appJoins.isNotEmpty,
    //   'appToJsonFunctions': toJsonFunctions,
    //   'emptyFormOverride': emptyFormOverride,
    //   'formProviderImportSession': includesProfile,
    //   'generatedSql': generatedSql
    // };
  }
}

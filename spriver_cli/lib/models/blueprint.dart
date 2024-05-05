import 'package:spriver_cli/constants.dart';
import 'package:spriver_cli/models/blueprint_property.dart';
import 'package:spriver_cli/utils/string_utils.dart';
import 'package:yaml/yaml.dart';
import 'package:collection/collection.dart';

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

  // Form State
  List<String> get flutterEmptyParams {
    final List<String> items = [];

    for (final property in properties) {
      final value = property.flutterEmptyParam;
      if (value != null) {
        items.add('${camelCase(property.name)}: $value');
      }
    }
    return items;
  }

  //Form Provider
  List<String> get flutterFormProviderImports {
    final List<String> importStrings = [];
    for (final p in properties) {
      if (!Constants.primitives.contains(p.type) && p.type.toLowerCase() != "profile") {
        importStrings.add("import '../../${snakeCase(p.type)}/models/${snakeCase(p.type)}.dart';");
      }
    }

    return importStrings;
  }

  List<String> get flutterFormControllers {
    final List<String> items = [];
    for (final property in properties) {
      if (Constants.formElementTypes.contains(property.type)) {
        items.add("final ${camelCase(property.name)}Controller = TextEditingController();");
      }
    }
    return items;
  }

  List<String> get flutterFormValidators {
    final List<String> items = [];

    for (final property in properties) {
      if (Constants.formElementTypes.contains(property.type)) {
        if (!property.allowNull) {
          items.add(
              'String? ${camelCase(property.name)}Validator(String? value) => ValidationUtils.formValidatorNotEmpty(value, "${titleCase(property.name)}");');
        }
      }
    }
    return items;
  }

  List<String> get flutterFormSetters {
    final List<String> items = [];

    for (final property in properties) {
      if (!Constants.formElementTypes.contains(property.type)) {
        if (property.name == 'createdAt' || property.name == 'updatedAt') {
          continue;
        }

        items.add("""
  void set${pascalCase(property.name)}(${property.dartTypeAsString} value) {
    state = state.update${pascalCase(name)}(
      state.${camelCase(name)}.copyWith(${camelCase(property.name)}: value),
    );
  }

""");
      }
    }
    return items;
  }

  List<String> get flutterFormControllerRefreshers {
    final List<String> items = [];
    for (final property in properties) {
      if (Constants.formElementTypes.contains(property.type)) {
        if (property.isStringish) {
          items.add("${camelCase(property.name)}Controller.text = state.${camelCase(name)}.${camelCase(property.name)};");
        } else if (property.isNumeric) {
          items.add("${camelCase(property.name)}Controller.text = state.${camelCase(name)}.${camelCase(property.name)}.toString();");
        }
      }
    }
    return items;
  }

  List<String> get flutterFormControllerSetters {
    final List<String> items = [];
    for (final property in properties) {
      if (Constants.formElementTypes.contains(property.type)) {
        if (property.isStringish) {
          items.add("${camelCase(property.name)}: ${camelCase(property.name)}Controller.text");
        } else if (property.type == 'int') {
          items.add("${camelCase(property.name)}: int.tryParse(${camelCase(property.name)}Controller.text) ?? 0");
        } else if (property.type == 'double') {
          items.add("${camelCase(property.name)}: double.tryParse(${camelCase(property.name)}Controller.text) ?? 0.0");
        }
      }
    }
    return items;
  }

  // Form Widget

  List<String> get flutterFormImports {
    final List<String> importStrings = [];
    bool includeButton = false;
    bool includeImageUploader = false;
    for (final p in properties) {
      if (!Constants.primitives.contains(p.type) && p.type.toLowerCase() != "profile") {
        importStrings.add("import '../../${snakeCase(p.type)}/models/${snakeCase(p.type)}.dart';");
        importStrings.add("import '../../${snakeCase(p.type)}/components/${snakeCase(p.type)}_list.dart';");
        includeButton = true;
      }
      if (p.isImage) {
        includeImageUploader = true;
      }
    }
    if (includeButton) {
      importStrings.insert(0, "import '../../../../core/theme/buttons.dart';");
    }

    if (includeImageUploader) {
      importStrings.insert(0, "import '../../../asset/presentation/widgets/upload_image_widget.dart';");
    }

    return importStrings;
  }

  List<String> get flutterFormInputs {
    final List<String> items = [];
    for (final property in properties) {
      if (Constants.formElementTypes.contains(property.type)) {
        final value = property.type == 'text'
            ? """
TextFormField(
                controller: provider.${camelCase(property.name)}Controller,
                validator: provider.${camelCase(property.name)}Validator,
                decoration: const InputDecoration(label: Text("${titleCase(property.name)}")),
                minLines: 3,
                maxLines: 3,
              ),
"""
            : """
TextFormField(
                controller: provider.${camelCase(property.name)}Controller,
                validator: provider.${camelCase(property.name)}Validator,
                decoration: const InputDecoration(label: Text("${titleCase(property.name)}")),
              ),
""";
        items.add(value);
      } else if (property.type.toLowerCase() == "datetime") {
        //TODO: handle if needed
      } else if (property.isImage) {
        final value = """
Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 16),
      child: UploadImageWidget(
        url: state.${camelCase(name)}.${property.name},
        label: "${titleCase(property.name)}",
        onComplete: (url) {
          provider.setImageUrl(url);
        },
      ),
    ),
""";
        items.add(value);
      } else if (property.type.toLowerCase() != "profile") {
        final uiHeading = properties.firstWhereOrNull((p) => p.uiHeading == 1)?.name ?? 'uuid';
        final value = """
ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text("${pascalCase(property.name)}"),
                subtitle: model.${camelCase(property.name)}.exists ? Text(model.${camelCase(property.name)}.$uiHeading) : const Text("-"),
                trailing: AppButton(
                  label: "Choose",
                  onPressed: () async {
                    final ${pascalCase(property.name)}? ${camelCase(property.name)} = await showModalBottomSheet(
                      context: context,
                      builder: (context){
                        return ${pascalCase(property.name)}List(
                          onPressed: (${camelCase(property.name)}) => Navigator.of(context).pop(${camelCase(property.name)}),
                        );
                      },
                    );
                    if(${camelCase(property.name)} != null) {
                      provider.set${pascalCase(property.name)}(${camelCase(property.name)});
                    }
                  },
                ),
              ),
""";
        items.add(value);
      }
    }
    return items;
  }

  Map<String, dynamic> serialize() {
    return {
      'name': name,
      //Form State
      'flutterEmptyParams': flutterEmptyParams,
      //Form Provider
      'flutterFormProviderImports': flutterFormProviderImports,
      'flutterFormControllers': flutterFormControllers,
      'flutterFormValidators': flutterFormValidators,
      'flutterFormControllerRefreshers': flutterFormControllerRefreshers,
      'flutterFormControllerSetters': flutterFormControllerSetters,
      'flutterFormSetters': flutterFormSetters,
      //Form Widget
      'flutterFormImports': flutterFormImports,
      'flutterFormInputs': flutterFormInputs
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

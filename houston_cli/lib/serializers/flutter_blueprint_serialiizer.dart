import 'package:houston_cli/constants.dart';
import 'package:houston_cli/models/blueprint_property.dart';
import 'package:houston_cli/serializers/blueprint_serializer.dart';
import 'package:houston_cli/utils/string_utils.dart';
import 'package:collection/collection.dart';

class FlutterBlueprintSerializer extends BlueprintSerializer {
  const FlutterBlueprintSerializer({required super.blueprint});

  // Form State
  List<String> get emptyParams {
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
  List<String> get formProviderImports {
    final List<String> importStrings = [];
    for (final p in properties) {
      if (Constants.hiddenFields.contains(p.name)) {
        continue;
      }

      if (!Constants.primitives.contains(p.type) && p.type.toLowerCase() != "profile") {
        importStrings.add("import '../../${snakeCase(p.type)}/models/${snakeCase(p.type)}.dart';");
      }
    }

    return importStrings;
  }

  List<String> get formControllers {
    final List<String> items = [];
    for (final property in properties) {
      if (Constants.hiddenFields.contains(property.name)) {
        continue;
      }
      if (Constants.formElementTypes.contains(property.type)) {
        items.add("final ${camelCase(property.name)}Controller = TextEditingController();");
      }
    }
    return items;
  }

  List<String> get formValidators {
    final List<String> items = [];

    for (final property in properties) {
      if (Constants.hiddenFields.contains(property.name)) {
        continue;
      }

      if (Constants.formElementTypes.contains(property.type)) {
        if (!property.allowNull) {
          items.add(
              'String? ${camelCase(property.name)}Validator(String? value) => ValidationUtils.formValidatorNotEmpty(value, "${titleCase(property.name)}");');
        }
      }
    }
    return items;
  }

  List<String> get formSetters {
    final List<String> items = [];

    for (final property in properties) {
      if (Constants.hiddenFields.contains(property.name)) {
        continue;
      }

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

  List<String> get formControllerRefreshers {
    final List<String> items = [];
    for (final property in properties) {
      if (Constants.hiddenFields.contains(property.name)) {
        continue;
      }
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

  List<String> get formControllerSetters {
    final List<String> items = [];
    for (final property in properties) {
      if (Constants.hiddenFields.contains(property.name)) {
        continue;
      }
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

  List<String> get formImports {
    final List<String> importStrings = [];
    bool includeButton = false;
    bool includeImageUploader = false;
    for (final p in properties) {
      if (Constants.hiddenFields.contains(p.name)) {
        continue;
      }

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

  List<String> get formInputs {
    final List<String> items = [];
    for (final property in properties) {
      if (Constants.hiddenFields.contains(property.name)) {
        continue;
      }

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

  // Quality of Life

  String _uiPropertyFormatted(BlueprintProperty property) {
    final name = camelCase(property.name);
    if (property.isStringish) {
      return name;
    }
    return '$name.toString()';
  }

  String? get uiHeading1 {
    final property = properties.firstWhereOrNull((p) => p.uiHeading == 1);

    if (property != null) {
      return _uiPropertyFormatted(property);
    }
    return null;
  }

  String? get uiHeading2 {
    final property = properties.firstWhereOrNull((p) => p.uiHeading == 2);

    if (property != null) {
      return _uiPropertyFormatted(property);
    }
    return null;
  }

  String? get uiDescription {
    final property = properties.firstWhereOrNull((p) => p.uiDescription);

    if (property != null) {
      return _uiPropertyFormatted(property);
    }
    return null;
  }

  @override
  Map<String, dynamic> serialize() {
    return {
      'name': name,
      'emptyParams': emptyParams,
      'formProviderImports': formProviderImports,
      'formControllers': formControllers,
      'formValidators': formValidators,
      'formControllerRefreshers': formControllerRefreshers,
      'formControllerSetters': formControllerSetters,
      'formSetters': formSetters,
      'formImports': formImports,
      'formInputs': formInputs,
      'uiHeading1': uiHeading1,
      'uiHeading2': uiHeading2,
      'uiDescription': uiDescription,
    };
  }
}

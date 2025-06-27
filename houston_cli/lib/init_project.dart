import 'dart:convert';
import 'dart:io' as io;

import 'package:dcli/dcli.dart';
import 'package:houston_cli/utils/file_utils.dart';
import 'package:houston_cli/utils/string_utils.dart';

String? getProjectName() {
  String value = ask("What is the name of your project?");

  value = snakeCase(value);
  if (value.isEmpty) {
    print(red("Invalid Project Name"));
    return null;
  }

  return value;
}

Future<void> initProject() async {
  String? projectName;

  while (projectName == null) {
    projectName = getProjectName();
  }

  final backendOptions = ["Django", "Serverpod", "Supabase", "Generate All"];

  final backendResult = menu("What backend option would you like to use",
      options: backendOptions);
  final backendIndex = backendOptions.indexOf(backendResult);

  final uiOptions = ["Material", "Cupertino", "Shadcn", "Forui"];

  final uiResult = menu("What UI library would you like to use?",
      options: uiOptions, defaultOption: uiOptions.first);
  final uiIndex = uiOptions.indexOf(uiResult);

  //Handle Init

  switch (uiIndex) {
    case 0: // "Material":
      break;
    case 1: // "Cupertino":
      break;
    case 2: // "Shadcn":
      break;
    case 3: // "Forui":
      break;
  }

  final configData = {
    'name': projectName,
    'backend': backendIndex,
    'ui': uiIndex,
  };

  final configFile = io.File('houston.config.json');
  await configFile.writeAsString(jsonEncode(configData));

  handleBackendOption(backendIndex);
}

Future<void> handleBackendOption(int backendIndex) async {
  late String datasourceProviderName;

  switch (backendIndex) {
    case 0: // "Django":
      datasourceProviderName = "flutter_datasource_provider_django.dart";
      break;
    case 1: // "Serverpod":
      datasourceProviderName = "flutter_datasource_provider_serverpod.dart";
      break;
    case 2: // "Supabase":
      datasourceProviderName = "flutter_datasource_provider_supabase.dart";
      break;
    case 3: // "Generate All":
      datasourceProviderName = "flutter_datasource_provider_all.dart";
      break;
  }

  FileUtils.moveFileOverwrite(
      "${FileUtils.bricksDir}/dynamic_bricks/$datasourceProviderName",
      "${FileUtils.bricksDir}/flutter_feature/__brick__/{{#snakeCase}}{{name}}{{/snakeCase}}/domain/providers/{{#snakeCase}}{{name}}{{/snakeCase}}_datasource_provider.dart");
}

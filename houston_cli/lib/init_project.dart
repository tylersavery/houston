import 'dart:convert';
import 'dart:io' as io;

import 'package:dcli/dcli.dart';
import 'package:houston_cli/config.dart';
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
  final config = HoustonConfig.getConfigOrNull();

  if (config != null) {
    print(red("Project already initialized"));
    final shouldContinue = confirm("Reinitialize anyways?");
    if (!shouldContinue) {
      return;
    }
  }

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

  await handleBackendOption(backendIndex);
}

Future<void> handleBackendOption(int backendIndex) async {
  final flutterFeatureBasePath =
      "${FileUtils.bricksDir}/flutter_feature/__brick__";

  late String datasourceProviderName;

  final List<String> filesToDelete = [];

  switch (backendIndex) {
    case 0: // "Django":
      datasourceProviderName = "flutter_datasource_provider_django.dart";
      filesToDelete.add(
          "$flutterFeatureBasePath/{{#snakeCase}}{{name}}{{/snakeCase}}/data/datasources/{{#snakeCase}}{{name}}{{/snakeCase}}_datasource_serverpod.dart");
      filesToDelete.add(
          "$flutterFeatureBasePath/{{#snakeCase}}{{name}}{{/snakeCase}}/data/datasources/{{#snakeCase}}{{name}}{{/snakeCase}}_datasource_supabase.dart");
      break;
    case 1: // "Serverpod":
      datasourceProviderName = "flutter_datasource_provider_serverpod.dart";
      filesToDelete.add(
          "$flutterFeatureBasePath/{{#snakeCase}}{{name}}{{/snakeCase}}/data/datasources/{{#snakeCase}}{{name}}{{/snakeCase}}_datasource_django.dart");
      filesToDelete.add(
          "$flutterFeatureBasePath/{{#snakeCase}}{{name}}{{/snakeCase}}/data/datasources/{{#snakeCase}}{{name}}{{/snakeCase}}_datasource_supabase.dart");
      break;
    case 2: // "Supabase":
      datasourceProviderName = "flutter_datasource_provider_supabase.dart";
      filesToDelete.add(
          "$flutterFeatureBasePath/{{#snakeCase}}{{name}}{{/snakeCase}}/data/datasources/{{#snakeCase}}{{name}}{{/snakeCase}}_datasource_serverpod.dart");
      filesToDelete.add(
          "$flutterFeatureBasePath/{{#snakeCase}}{{name}}{{/snakeCase}}/data/datasources/{{#snakeCase}}{{name}}{{/snakeCase}}_datasource_django.dart");
      break;
    case 3: // "Generate All":
      datasourceProviderName = "flutter_datasource_provider_all.dart";
      break;
  }

  await FileUtils.copyFileOverwrite(
      "${FileUtils.bricksDir}/dynamic_bricks/$datasourceProviderName",
      "$flutterFeatureBasePath/{{#snakeCase}}{{name}}{{/snakeCase}}/domain/providers/{{#snakeCase}}{{name}}{{/snakeCase}}_datasource_provider.dart");

  FileUtils.deleteFiles(filesToDelete);
}

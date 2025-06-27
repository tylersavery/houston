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

  final backendOptions = ServerBackendOption.values;

  final backendResult = menu<ServerBackendOption>(
      "What backend option would you like to use",
      options: backendOptions,
      format: (v) => v.label);

  final uiOptions = FrontendUiOption.values;

  final uiResult = menu<FrontendUiOption>(
      "What UI library would you like to use?",
      options: uiOptions,
      defaultOption: uiOptions.first,
      format: (v) => v.label);

  final configData = {
    'name': projectName,
    'backend': backendResult.value,
    'ui': uiResult.value,
  };

  final configFile = io.File('houston.config.json');
  await configFile.writeAsString(jsonEncode(configData));

  await handleBackendOption(backendResult);
}

Future<void> handleBackendOption(ServerBackendOption backendIndex) async {
  final flutterFeatureBasePath =
      "${FileUtils.bricksDir}/flutter_feature/__brick__";

  late String datasourceProviderName;
  late String assetDatasourceProviderName;
  late String authDatasourceProviderName;
  late String profileDatasourceProviderName;

  final List<String> filesToDelete = [];

  switch (backendIndex) {
    case ServerBackendOption.django: // "Django":
      datasourceProviderName = "flutter_datasource_provider_django.dart";
      assetDatasourceProviderName = "asset_datasource_provider_django.dart";
      authDatasourceProviderName = "auth_datasource_provider_django.dart";
      profileDatasourceProviderName = "profile_datasource_provider_django.dart";

      filesToDelete.add(
          "$flutterFeatureBasePath/{{#snakeCase}}{{name}}{{/snakeCase}}/data/datasources/{{#snakeCase}}{{name}}{{/snakeCase}}_datasource_serverpod.dart");
      filesToDelete.add(
          "$flutterFeatureBasePath/{{#snakeCase}}{{name}}{{/snakeCase}}/data/datasources/{{#snakeCase}}{{name}}{{/snakeCase}}_datasource_supabase.dart");

      for (final feature in ['auth', 'asset', 'profile']) {
        filesToDelete.add(
            "${FileUtils.flutterDir}/lib/features/$feature/data/datasources/${feature}_datasource_serverpod.dart");

        filesToDelete.add(
            "${FileUtils.flutterDir}/lib/features/$feature/data/datasources/${feature}_datasource_supabase.dart");
      }

      break;
    case ServerBackendOption.serverpod: // "Serverpod":
      datasourceProviderName = "flutter_datasource_provider_serverpod.dart";
      assetDatasourceProviderName = "asset_datasource_provider_serverpod.dart";
      authDatasourceProviderName = "auth_datasource_provider_serverpod.dart";
      profileDatasourceProviderName =
          "profile_datasource_provider_serverpod.dart";

      filesToDelete.add(
          "$flutterFeatureBasePath/{{#snakeCase}}{{name}}{{/snakeCase}}/data/datasources/{{#snakeCase}}{{name}}{{/snakeCase}}_datasource_django.dart");
      filesToDelete.add(
          "$flutterFeatureBasePath/{{#snakeCase}}{{name}}{{/snakeCase}}/data/datasources/{{#snakeCase}}{{name}}{{/snakeCase}}_datasource_supabase.dart");

      for (final feature in ['auth', 'asset', 'profile']) {
        filesToDelete.add(
            "${FileUtils.flutterDir}/lib/features/$feature/data/datasources/${feature}_datasource_django.dart");

        filesToDelete.add(
            "${FileUtils.flutterDir}/lib/features/$feature/data/datasources/${feature}_datasource_supabase.dart");
      }

      break;
    case ServerBackendOption.supabase: // "Supabase":
      datasourceProviderName = "flutter_datasource_provider_supabase.dart";
      assetDatasourceProviderName = "asset_datasource_provider_supabase.dart";
      authDatasourceProviderName = "auth_datasource_provider_supabase.dart";
      profileDatasourceProviderName =
          "profile_datasource_provider_supabase.dart";

      filesToDelete.add(
          "$flutterFeatureBasePath/{{#snakeCase}}{{name}}{{/snakeCase}}/data/datasources/{{#snakeCase}}{{name}}{{/snakeCase}}_datasource_serverpod.dart");
      filesToDelete.add(
          "$flutterFeatureBasePath/{{#snakeCase}}{{name}}{{/snakeCase}}/data/datasources/{{#snakeCase}}{{name}}{{/snakeCase}}_datasource_django.dart");

      for (final feature in ['auth', 'asset', 'profile']) {
        filesToDelete.add(
            "${FileUtils.flutterDir}/lib/features/$feature/data/datasources/${feature}_datasource_django.dart");

        filesToDelete.add(
            "${FileUtils.flutterDir}/lib/features/$feature/data/datasources/${feature}_datasource_serverpod.dart");
      }

      break;
    case ServerBackendOption.all: // "Generate All":
      datasourceProviderName = "flutter_datasource_provider_all.dart";
      assetDatasourceProviderName = "asset_datasource_provider_all.dart";
      authDatasourceProviderName = "auth_datasource_provider_all.dart";
      profileDatasourceProviderName = "profile_datasource_provider_all.dart";

      break;
  }

  await FileUtils.copyFileOverwrite(
      "${FileUtils.bricksDir}/dynamic_bricks/$datasourceProviderName",
      "$flutterFeatureBasePath/{{#snakeCase}}{{name}}{{/snakeCase}}/domain/providers/{{#snakeCase}}{{name}}{{/snakeCase}}_datasource_provider.dart");

  await FileUtils.copyFileOverwrite(
      "${FileUtils.cliDir}/flutter_files/asset/$assetDatasourceProviderName",
      "${FileUtils.flutterDir}/lib/features/asset/domain/providers/asset_datasource_provider.dart");

  await FileUtils.copyFileOverwrite(
      "${FileUtils.cliDir}/flutter_files/auth/$authDatasourceProviderName",
      "${FileUtils.flutterDir}/lib/features/auth/domain/providers/auth_datasource_provider.dart");

  await FileUtils.copyFileOverwrite(
      "${FileUtils.cliDir}/flutter_files/profile/$profileDatasourceProviderName",
      "${FileUtils.flutterDir}/lib/features/profile/domain/providers/profile_datasource_provider.dart");

  FileUtils.deleteFiles(filesToDelete);
}

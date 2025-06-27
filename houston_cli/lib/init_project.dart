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

Future<void> handleBackendOption(ServerBackendOption backendOption) async {
  final flutterFeatureBasePath =
      "${FileUtils.bricksDir}/flutter_feature/__brick__";

  late String datasourceProviderName;
  late String assetDatasourceProviderName;
  late String authDatasourceProviderName;
  late String profileDatasourceProviderName;

  final List<String> filesToDelete = [];
  final List<String> directoriesToDelete = [];
  final Map<String, List<String>> fileContentsToDelete = {};

  filesToDelete.add(
      "${FileUtils.flutterDir}/lib/core/providers/rest_client_provider.dart");
  filesToDelete.add(
      "${FileUtils.flutterDir}/lib/core/providers/rest_session_provider.dart");

  filesToDelete.add(
      "${FileUtils.flutterDir}/lib/core/providers/serverpod_client_provider.dart");
  filesToDelete.add(
      "${FileUtils.flutterDir}/lib/core/providers/session_manager_provider.dart");

  filesToDelete.add(
      "${FileUtils.flutterDir}/lib/core/providers/supabase_client_provider.dart");

  switch (backendOption) {
    case ServerBackendOption.django: // "Django":
      datasourceProviderName = "flutter_datasource_provider_django.dart";
      assetDatasourceProviderName = "asset_datasource_provider_django.dart";
      authDatasourceProviderName = "auth_datasource_provider_django.dart";
      profileDatasourceProviderName = "profile_datasource_provider_django.dart";

      filesToDelete.add(
          "$flutterFeatureBasePath/{{#snakeCase}}{{name}}{{/snakeCase}}/data/datasources/{{#snakeCase}}{{name}}{{/snakeCase}}_datasource_serverpod.dart");
      filesToDelete.add(
          "$flutterFeatureBasePath/{{#snakeCase}}{{name}}{{/snakeCase}}/data/datasources/{{#snakeCase}}{{name}}{{/snakeCase}}_datasource_supabase.dart");

      filesToDelete.remove(
          "${FileUtils.flutterDir}/lib/core/providers/rest_client_provider.dart");
      filesToDelete.remove(
          "${FileUtils.flutterDir}/lib/core/providers/rest_session_provider.dart");

      for (final feature in ['auth', 'asset', 'profile']) {
        filesToDelete.add(
            "${FileUtils.flutterDir}/lib/features/$feature/data/datasources/${feature}_datasource_serverpod.dart");

        filesToDelete.add(
            "${FileUtils.flutterDir}/lib/features/$feature/data/datasources/${feature}_datasource_supabase.dart");
        directoriesToDelete
            .add("${FileUtils.flutterDir}/lib/features/$feature/data/mappers");
      }

      directoriesToDelete.add("${FileUtils.houstonRoot}/houston_client/");
      directoriesToDelete.add("${FileUtils.houstonRoot}/houston_server/");
      directoriesToDelete.add("${FileUtils.houstonRoot}/houston_supabase/");

      directoriesToDelete.add(
          "${FileUtils.bricksDir}/flutter_feature/__brick__/{{#snakeCase}}{{name}}{{/snakeCase}}/data/mappers");

      fileContentsToDelete[
          '${FileUtils.flutterDir}/lib/features/auth/presentation/auth_provider.dart'] = [
        """import '../../../../core/providers/session_manager_provider.dart';""",
        """await ref.read(serverpodSessionManagerProvider).initialize();"""
      ];

      fileContentsToDelete['${FileUtils.flutterDir}/pubspec.yaml'] = [
        """houston_client:
    path: ../houston_client""",
        """serverpod_flutter: 2.8.0""",
        """serverpod_auth_shared_flutter: 2.8.0""",
        """supabase_flutter: ^2.5.2"""
      ];

      fileContentsToDelete['${FileUtils.flutterDir}/lib/main.dart'] = [
        """await Supabase.initialize(
    url: "https://\${Env.supabaseProject}.supabase.co",
    anonKey: Env.supabaseAnonKey,
    debug: Env.debug,
  );""",
        "import 'package:supabase_flutter/supabase_flutter.dart';"
      ];

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

      filesToDelete.remove(
          "${FileUtils.flutterDir}/lib/core/providers/serverpod_client_provider.dart");
      filesToDelete.remove(
          "${FileUtils.flutterDir}/lib/core/providers/session_manager_provider.dart");

      for (final feature in ['auth', 'asset', 'profile']) {
        filesToDelete.add(
            "${FileUtils.flutterDir}/lib/features/$feature/data/datasources/${feature}_datasource_django.dart");

        filesToDelete.add(
            "${FileUtils.flutterDir}/lib/features/$feature/data/datasources/${feature}_datasource_supabase.dart");
      }

      directoriesToDelete.add("${FileUtils.houstonRoot}/houston_django/");
      directoriesToDelete.add("${FileUtils.houstonRoot}/houston_supabase/");

      fileContentsToDelete[
          '${FileUtils.flutterDir}/lib/features/auth/presentation/auth_provider.dart'] = [
        """import 'package:houston_flutter/core/providers/rest_session_provider.dart';""",
        """await ref.read(restSessionProvider.notifier).initialize();"""
      ];

      fileContentsToDelete['${FileUtils.flutterDir}/pubspec.yaml'] = [
        """supabase_flutter: ^2.5.2"""
      ];

      fileContentsToDelete['${FileUtils.flutterDir}/lib/main.dart'] = [
        """await Supabase.initialize(
    url: "https://\${Env.supabaseProject}.supabase.co",
    anonKey: Env.supabaseAnonKey,
    debug: Env.debug,
  );""",
        "import 'package:supabase_flutter/supabase_flutter.dart';"
      ];

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

      filesToDelete.remove(
          "${FileUtils.flutterDir}/lib/core/providers/supabase_client_provider.dart");

      for (final feature in ['auth', 'asset', 'profile']) {
        filesToDelete.add(
            "${FileUtils.flutterDir}/lib/features/$feature/data/datasources/${feature}_datasource_django.dart");

        filesToDelete.add(
            "${FileUtils.flutterDir}/lib/features/$feature/data/datasources/${feature}_datasource_serverpod.dart");

        directoriesToDelete
            .add("${FileUtils.flutterDir}/lib/features/$feature/data/mappers");
      }

      directoriesToDelete.add("${FileUtils.houstonRoot}/houston_client/");
      directoriesToDelete.add("${FileUtils.houstonRoot}/houston_server/");
      directoriesToDelete.add("${FileUtils.houstonRoot}/houston_django/");
      directoriesToDelete.add(
          "${FileUtils.bricksDir}/flutter_feature/__brick__/{{#snakeCase}}{{name}}{{/snakeCase}}/data/mappers");

      fileContentsToDelete[
          '${FileUtils.flutterDir}/lib/features/auth/presentation/auth_provider.dart'] = [
        """import '../../../../core/providers/session_manager_provider.dart';""",
        """import '../../../../core/providers/session_manager_provider.dart';""",
        """await ref.read(serverpodSessionManagerProvider).initialize();""",
        """await ref.read(restSessionProvider.notifier).initialize();"""
      ];

      fileContentsToDelete['${FileUtils.flutterDir}/pubspec.yaml'] = [
        """houston_client:
    path: ../houston_client""",
        """serverpod_flutter: 2.8.0""",
        """serverpod_auth_shared_flutter: 2.8.0""",
      ];

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

  for (final dir in directoriesToDelete) {
    FileUtils.deleteDirectory(dir);
  }

  for (final entry in fileContentsToDelete.entries) {
    final filePath = entry.key;
    final targets = entry.value;

    final file = io.File(filePath);
    if (!await file.exists()) {
      continue;
    }

    String content = await file.readAsString();

    for (final target in targets) {
      content = content.replaceAll(target, '');
    }

    await file.writeAsString(content);
  }
}

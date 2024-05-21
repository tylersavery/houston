import 'dart:convert';
import 'dart:io';

import 'package:dcli/dcli.dart';
import 'package:houston_cli/constants.dart';
import 'package:houston_cli/serializers/django_blueprint_serializer.dart';
import 'package:houston_cli/serializers/flutter_blueprint_serializer.dart';
import 'package:houston_cli/serializers/serverpod_blueprint_serializer.dart';
import 'package:houston_cli/serializers/supabase_blueprint_serializer.dart';
import 'package:houston_cli/utils/file_utils.dart';
import 'package:houston_cli/utils/string_utils.dart';
import 'package:mason/mason.dart' as mason;

Future<void> scaffoldFeature({
  String? name,
  bool? generateServer,
  bool? generateMigrations,
  bool? runMigrations,
  bool? generateFlutter,
  bool? runPostGenerator,
  bool? runPostFormatter,
  bool? updateRoutes,
  bool? updateNavigation,
}) async {
  name ??= ask("Feature Name:", required: true);
  generateServer ??= confirm("Generate Server Code?", defaultValue: true);

  if (Constants.serverBackend == ServerBackendOption.serverpod || Constants.serverBackend == ServerBackendOption.django) {
    generateMigrations ??= confirm("Generate DB Migrations", defaultValue: true);
    runMigrations ??= confirm("Run DB Migrations", defaultValue: true);
  } else {
    generateMigrations = false;
    runMigrations = false;
  }

  generateFlutter ??= confirm("Generate Flutter Code?", defaultValue: true);
  updateRoutes ??= confirm("Update Routes?", defaultValue: true);
  updateNavigation ??= confirm("Update Navigation?", defaultValue: true);
  runPostGenerator ??= confirm("Run Post Generator?", defaultValue: true);

  name = snakeCase(name);

  if (['auth', 'profile', 'asset', 'core'].contains(name)) {
    return print(red('Feature $name is a reserved houston feature name.'));
  }

  final dir = FileUtils.blueprintsDir;
  final path = "$dir/$name.yaml";

  if (!File(path).existsSync()) {
    return print(red('Feature $name not found. Try creating it first at `$path`'));
  }
  final blueprint = FileUtils.parseBlueprint(path);

  if (generateServer == true) {
    // switch (Constants.serverBackend) {

    // case (ServerBackendOption.serverpod):
    print(white("Scaffolding Serverpod Feature [${pascalCase(name)}]..."));

    final serverpodParentDir = "${FileUtils.serverpodDir}/lib/src";

    final serverpodFeatureBrick = mason.Brick.path("${FileUtils.bricksDir}/serverpod_feature");
    final serverpodFeatureGenerator = await mason.MasonGenerator.fromBrick(serverpodFeatureBrick);
    final serverpodFeatureTarget = mason.DirectoryGeneratorTarget(Directory(serverpodParentDir));

    final serializer = ServerpodBlueprintSerializer(blueprint: blueprint);

    await serverpodFeatureGenerator.generate(
      serverpodFeatureTarget,
      vars: serializer.serialize(),
    );

    print(green("Serverpod Code Scaffolded."));

    print(white("Running Serverpod Client Generator..."));

    final args = "generate".split(" ");
    final process = await Process.start("serverpod", args, workingDirectory: FileUtils.serverpodDir);
    await process.stdout.transform(utf8.decoder).forEach((line) => print(yellow(line)));
    print(green("Client Code Generated."));

    if (generateMigrations == true) {
      print(white("Generating Serverpod Migrations..."));

      final args = "create-migration".split(" ");
      final process = await Process.start("serverpod", args, workingDirectory: FileUtils.serverpodDir);
      await process.stdout.transform(utf8.decoder).forEach((line) => print(yellow(line)));
      print(green("Migration Generated."));
    }

    if (runMigrations == true) {
      print(white("Running Serverpod Migrations..."));

      final args = "bin/main.dart --role maintenance --apply-migrations".split(" ");
      final process = await Process.start("dart", args, workingDirectory: FileUtils.serverpodDir);
      await process.stdout.transform(utf8.decoder).forEach((line) => print(yellow(line)));
      print(green("Migration Complete."));
    }

    if (runPostFormatter == true) {
      final filePrefix = snakeCase(name);

      print(white("Formatting Serverpod Files..."));
      final filePaths = [
        "$serverpodParentDir/endpoints/${filePrefix}_endpoint.dart",
      ];

      for (final filePath in filePaths) {
        await Process.start("dart", ["format", filePath]);
      }
      print(green("Files Formatted."));
    }
    // break;
    // case ServerBackendOption.supabase:

    print(white("Scaffolding Supabase Feature [${pascalCase(name)}]..."));

    final supabaseParentDir = FileUtils.supabaseDir;
    final supabaseFeatureBrick = mason.Brick.path("${FileUtils.bricksDir}/supabase_feature");
    final supabaseFeatureGenerator = await mason.MasonGenerator.fromBrick(supabaseFeatureBrick);
    final supabaseFeatureTarget = mason.DirectoryGeneratorTarget(Directory(supabaseParentDir));

    final serverpodSerializer = SupabaseBlueprintSerializer(blueprint: blueprint);
    await supabaseFeatureGenerator.generate(
      supabaseFeatureTarget,
      vars: serverpodSerializer.serialize(),
    );

    final module = blueprint.module;

    final modulePath = FileUtils.djangoModuleDirectory(module);

    if (!await FileUtils.directoryExists(modulePath)) {
      print(white("Scaffolding Django Module [${pascalCase(module)}]..."));

      final djangoModuleBrick = mason.Brick.path("${FileUtils.bricksDir}/django/module");
      final djangoModuleGenerator = await mason.MasonGenerator.fromBrick(djangoModuleBrick);
      final djangoModuleTarget = mason.DirectoryGeneratorTarget(Directory(modulePath));

      final djangoModuleeSerializer = DjangoBlueprintSerializer(blueprint: blueprint, appName: snakeCase(module));

      await djangoModuleGenerator.generate(
        djangoModuleTarget,
        vars: djangoModuleeSerializer.serialize(),
      );

      print(white("Registering new app in project/settings.apps.py"));

      await FileUtils.insertTextInFileAtToken(
        path: "${FileUtils.djangoRootDir}/project/settings/apps.py",
        token: "#::HOUSTON-INSERT-MODULE::",
        value: '"${snakeCase(module)}.apps.${pascalCase(module)}Config",',
      );
    }

    print(white("Scaffolding Django Feature [${pascalCase(name)}]..."));
    final djangoAppDir = FileUtils.djangoModuleDirectory(blueprint.module);
    final djangoFeatureBrick = mason.Brick.path("${FileUtils.bricksDir}/django/feature");
    final djangoFeatureGenerator = await mason.MasonGenerator.fromBrick(djangoFeatureBrick);
    final djangoFeatureTarget = mason.DirectoryGeneratorTarget(Directory(djangoAppDir));

    final djangoFeatureSerializer = DjangoBlueprintSerializer(blueprint: blueprint, appName: snakeCase(blueprint.module));

    await djangoFeatureGenerator.generate(
      djangoFeatureTarget,
      vars: djangoFeatureSerializer.serialize(),
    );

    print(white("Registering model in app's models/__init__.py"));
    await FileUtils.insertTextInFile(path: "$djangoAppDir/models/__init__.py", value: "from .${snakeCase(name)} import *");

    print(white("Registering admin in app's admin/__init__.py"));
    await FileUtils.insertTextInFile(path: "$djangoAppDir/admin/__init__.py", value: "from .${snakeCase(name)} import *");

    print(white("Registering namespace in api/urls.py"));
    final urlInsert = 'path("$name/", include("api.$name.urls")),';
    await FileUtils.insertTextInFileAtToken(
      path: "${FileUtils.djangoApiDirectory}/urls.py",
      value: urlInsert,
      token: "#::HOUSTON-INSERT-FEATURE::",
    );

    print(white("Scaffolding Django API Feature [${pascalCase(name)}]..."));

    final djangoApiAppDir = FileUtils.djangoApiDirectory;
    final djangoApiFeatureBrick = mason.Brick.path("${FileUtils.bricksDir}/django/api");
    final djangoApiFeatureGenerator = await mason.MasonGenerator.fromBrick(djangoApiFeatureBrick);
    final djangoApiFeatureTarget = mason.DirectoryGeneratorTarget(Directory(djangoApiAppDir));

    final djangoApiSerializer = DjangoBlueprintSerializer(blueprint: blueprint, appName: snakeCase(blueprint.module));

    await djangoApiFeatureGenerator.generate(
      djangoApiFeatureTarget,
      vars: djangoApiSerializer.serialize(),
    );

    if (generateMigrations == true) {
      print(white("Generating Django Migrations"));
      final args = "manage.py makemigrations".split(" ");
      final result = await Process.run("./venv/bin/python", args, workingDirectory: FileUtils.djangoRootDir);

      print(yellow(result.stdout));
      if (result.stderr != null && result.stderr != "") {
        print(red(result.stderr));
      } else {
        print(green("Migrations Generated."));
      }
    }

    if (runMigrations == true) {
      print(white("Running Django Migrations"));
      final args = "manage.py migrate".split(" ");
      final result = await Process.run("./venv/bin/python", args, workingDirectory: FileUtils.djangoRootDir);
      print(yellow(result.stdout));
      if (result.stderr != null && result.stderr != "") {
        print(red(result.stderr));
      } else {
        print(green("Migrations Ran."));
      }
    }
  }

  if (generateFlutter == true) {
    print(white("Scaffolding Flutter Feature Code [${pascalCase(name)}]..."));

    final flutterParentDir = "${FileUtils.flutterDir}/lib/features";
    final flutterGeneratedPath = "$flutterParentDir/$name";

    final flutterFeatureBrick = mason.Brick.path("${FileUtils.bricksDir}/flutter_feature");

    final flutterFeatureGenerator = await mason.MasonGenerator.fromBrick(flutterFeatureBrick);

    final flutterFeatureTarget = mason.DirectoryGeneratorTarget(Directory(flutterParentDir));

    final serializer = FlutterBlueprintSerializer(blueprint: blueprint);

    await flutterFeatureGenerator.generate(
      flutterFeatureTarget,
      vars: serializer.serialize(),
    );

    final routerPath = "${FileUtils.flutterDir}/lib/core/router/app_router.dart";

    if (updateRoutes == true && camelCase(name) != "profile") {
      print(white("Updating routes..."));
      await FileUtils.insertTextInFile(
        path: routerPath,
        value: "import 'package:${Constants.appName}_flutter/features/${snakeCase(name)}/presentation/${snakeCase(name)}_routes.dart';",
        prepend: true,
      );

      await FileUtils.insertTextInFileAtToken(
        path: routerPath,
        token: Constants.routerRouteInsertToken,
        value: "${pascalCase(name)}Routes.branch,",
      );
      print(green("Routes Updated."));
    }

    final dashboardPath = "${FileUtils.flutterDir}/lib/core/widgets/navigation/dashboard.dart";

    if (updateNavigation == true && camelCase(name) != "profile") {
      print(white("Updating Navigation..."));

      await FileUtils.insertTextInFileAtToken(
        path: dashboardPath,
        token: Constants.dashboardTabInsertToken,
        value: 'NavigationDestination(label: "${pascalCase(name)}", icon: Icon(Icons.star),),',
        duplicateLookup: 'NavigationDestination(label: "${pascalCase(name)}"',
      );

      await FileUtils.insertTextInFileAtToken(
        path: dashboardPath,
        token: Constants.dashboardNavInsertToken,
        value: 'NavigationRailDestination(label: Text("${pascalCase(name)}"), icon: Icon(Icons.star),),',
        duplicateLookup: 'NavigationRailDestination(label: Text("${pascalCase(name)}")',
      );
      print(green("Navigation Updated."));
    }

    print(green("Flutter Code Scaffolded."));

    if (runPostFormatter == true) {
      final filePrefix = snakeCase(name);

      print(white("Formatting Flutter Files..."));
      final filePaths = [
        "$flutterGeneratedPath/data/datasources/${filePrefix}_datasource_supabase.dart",
        "$flutterGeneratedPath/data/datasources/${filePrefix}_datasource_serverpod.dart",
        "$flutterGeneratedPath/data/repositories/${filePrefix}_repository.dart",
        "$flutterGeneratedPath/domain/extensions/${filePrefix}_extension.dart",
        "$flutterGeneratedPath/domain/extensions/${filePrefix}_list_extension.dart",
        "$flutterGeneratedPath/domain/providers/${filePrefix}_datasource_provider.dart",
        "$flutterGeneratedPath/domain/providers/${filePrefix}_repository_provider.dart",
        "$flutterGeneratedPath/domain/repositories/${filePrefix}_repository.dart",
        "$flutterGeneratedPath/presentation/providers/${filePrefix}_detail_provider.dart",
        "$flutterGeneratedPath/presentation/providers/${filePrefix}_form_provider.dart",
        "$flutterGeneratedPath/presentation/providers/${filePrefix}_infinite_list_provider.dart",
        "$flutterGeneratedPath/presentation/providers/${filePrefix}_paginated_list_provider.dart",
        "$flutterGeneratedPath/presentation/screens/${filePrefix}_detail_screen.dart",
        "$flutterGeneratedPath/presentation/screens/${filePrefix}_edit_screen.dart",
        "$flutterGeneratedPath/presentation/screens/${filePrefix}_list_screen.dart",
        "$flutterGeneratedPath/presentation/state/${filePrefix}_form_state.dart",
        "$flutterGeneratedPath/presentation/state/${filePrefix}_paginated_list_state.dart",
        "$flutterGeneratedPath/presentation/widgets/${filePrefix}_detail_widget.dart",
        "$flutterGeneratedPath/presentation/widgets/${filePrefix}_form_widget.dart",
        "$flutterGeneratedPath/presentation/widgets/${filePrefix}_infinite_list_widget.dart",
        "$flutterGeneratedPath/presentation/widgets/${filePrefix}_list_tile_widget.dart",
        "$flutterGeneratedPath/presentation/widgets/${filePrefix}_paginated_list_widget.dart",
        "$flutterGeneratedPath/presentation/${filePrefix}_routes.dart",
        routerPath,
        dashboardPath,
      ];

      for (final filePath in filePaths) {
        await Process.start("dart", ["format", filePath]);
      }
      print(green("Files Formatted."));
    }

    if (runPostGenerator == true) {
      print(white("Running generate function in flutter project..."));

      final args = "packages pub run build_runner build --delete-conflicting-outputs".split(" ");
      final process = await Process.start("flutter", args, workingDirectory: FileUtils.flutterDir);
      await process.stdout.transform(utf8.decoder).forEach((line) => print(yellow(line)));
      print(green("Generation Complete"));
    }
  }

  print("");
  print(cyan("------------------------------------"));
  print(cyan("---- Houston Feature Generated! ----"));
  print(cyan("------------------------------------"));
  print("");
}

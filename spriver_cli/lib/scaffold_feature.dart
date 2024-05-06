import 'dart:convert';
import 'dart:io';

import 'package:dcli/dcli.dart';
import 'package:spriver_cli/constants.dart';
import 'package:spriver_cli/serializers/flutter_blueprint_serialiizer.dart';
import 'package:spriver_cli/serializers/serverpod_blueprint_serializer.dart';
import 'package:spriver_cli/utils/file_utils.dart';
import 'package:spriver_cli/utils/string_utils.dart';
import 'package:mason/mason.dart' as mason;

Future<void> scaffoldFeature({
  String? name,
  bool? generateServerpod,
  bool? generateMigrations,
  bool? runMigrations,
  bool? generateFlutter,
  bool? runPostGenerator,
  bool? runPostFormatter,
  bool? updateRoutes,
  bool? updateNavigation,
}) async {
  name ??= ask("Feature Name:", required: true);
  generateServerpod ??= confirm("Generate Serverpod Code?", defaultValue: true);
  generateMigrations ??= confirm("Generate Serverpod DB Migrations", defaultValue: true);
  runMigrations ??= confirm("Run Serverpod DB Migrations", defaultValue: true);
  generateFlutter ??= confirm("Generate Flutter Code?", defaultValue: true);
  updateRoutes ??= confirm("Update Routes?", defaultValue: true);
  updateNavigation ??= confirm("Update Navigation?", defaultValue: true);
  runPostGenerator ??= confirm("Run Post Generator?", defaultValue: true);

  name = snakeCase(name);

  final dir = FileUtils.blueprintsDir;
  final path = "$dir/$name.yaml";

  if (!File(path).existsSync()) {
    return print(red('Feature $name not found. Try creating it first at `$path`'));
  }
  final blueprint = FileUtils.parseBlueprint(path);

  if (generateServerpod == true) {
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

    if (updateRoutes == true) {
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

    if (updateNavigation == true) {
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
        "$flutterGeneratedPath/data/datasources/${filePrefix}_datasource.dart",
        "$flutterGeneratedPath/data/repositories/${filePrefix}_repository.dart",
        "$flutterGeneratedPath/domain/extensions/${filePrefix}_extension.dart",
        "$flutterGeneratedPath/domain/extensions/${filePrefix}_list_extension.dart",
        "$flutterGeneratedPath/domain/providers/${filePrefix}_datasource_provider.dart",
        "$flutterGeneratedPath/domain/providers/${filePrefix}_repository_provider.dart",
        "$flutterGeneratedPath/domain/repositories/${filePrefix}_repository.dart",
        "$flutterGeneratedPath/domain/usecases/${filePrefix}_delete_usecase.dart",
        "$flutterGeneratedPath/domain/usecases/${filePrefix}_list_usecase.dart",
        "$flutterGeneratedPath/domain/usecases/${filePrefix}_retrieve_usecase.dart",
        "$flutterGeneratedPath/domain/usecases/${filePrefix}_save_usecase.dart",
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

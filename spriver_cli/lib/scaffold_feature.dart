import 'dart:convert';
import 'dart:io';

import 'package:dcli/dcli.dart';
import 'package:spriver_cli/constants.dart';
import 'package:spriver_cli/utils/file_utils.dart';
import 'package:spriver_cli/utils/string_utils.dart';
import 'package:mason/mason.dart' as mason;

Future<void> scaffoldFeature({
  String? name,
  bool runPostGenerator = true,
  bool updateRoutes = true,
  bool updateNavigation = true,
}) async {
  name ??= ask(
    "Feature Name:",
    required: true,
  );

  name = snakeCase(name);

  final dir = FileUtils.blueprintsDir;
  final path = "$dir/$name.yaml";

  if (!File(path).existsSync()) {
    return print(red('Feature $name not found. Try creating it first at `$path`'));
  }
  final blueprint = FileUtils.parseBlueprint(path);

  print(white("Generating Flutter Feature"));

  final flutterParentDir = "${FileUtils.flutterDir}/lib/features";
  final flutterGeneratedPath = "$flutterParentDir/$name";

  final flutterFeatureBrick = mason.Brick.path("${FileUtils.bricksDir}/feature");

  final flutterFeatureGenerator = await mason.MasonGenerator.fromBrick(flutterFeatureBrick);

  final flutterFeatureTarget = mason.DirectoryGeneratorTarget(Directory(flutterParentDir));

  await flutterFeatureGenerator.generate(
    flutterFeatureTarget,
    vars: blueprint.serialize(),
  );

  final routerPath = "${FileUtils.flutterDir}/lib/core/router/app_router.dart";

  if (updateRoutes) {
    await FileUtils.insertTextInFile(
      path: routerPath,
      value: "import 'package:${Constants.appName}_flutter/features/${snakeCase(name)}/routes.dart';",
      prepend: true,
    );

    await FileUtils.insertTextInFileAtToken(
      path: routerPath,
      token: Constants.routerRouteInsertToken,
      value: "${pascalCase(name)}Routes.branch,",
    );
  }

  final dashboardPath = "${FileUtils.flutterDir}/core/widgets/navigation/dashboard.dart";

  if (updateNavigation) {
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
  }

  //   print("Formatting files");
  // final filePaths = [
  //   "$appGeneratedPath/components/${name}_card.dart",
  //   "$appGeneratedPath/components/${name}_form.dart",
  //   "$appGeneratedPath/components/${name}_list_tile.dart",
  //   "$appGeneratedPath/components/${name}_list.dart",
  //   "$appGeneratedPath/models/$name.dart",
  //   "$appGeneratedPath/providers/${name}_detail_provider.dart",
  //   "$appGeneratedPath/providers/${name}_form_provider.dart",
  //   "$appGeneratedPath/providers/${name}_list_provider.dart",
  //   "$appGeneratedPath/screens/${name}_list_screen.dart",
  //   "$appGeneratedPath/screens/${name}_detail_screen.dart",
  //   "$appGeneratedPath/services/${name}_rest_service.dart",
  //   "$appGeneratedPath/services/${name}_db_service.dart",
  //   "$appGeneratedPath/routes.dart",
  //   routerPath,
  //   dashboardPath,
  // ];

  // for (final filePath in filePaths) {
  //   print(filePath);
  //   await Process.start("dart", ["format", filePath]);
  // }

  print(green("$name app generated at `$flutterGeneratedPath`"));

  if (runPostGenerator) {
    print(white("Running generate function in flutter project..."));

    final args = "packages pub run build_runner build --delete-conflicting-outputs".split(" ");
    final process = await Process.start("flutter", args, workingDirectory: FileUtils.flutterDir);
    await process.stdout.transform(utf8.decoder).forEach((line) => print(yellow(line)));
  }
}

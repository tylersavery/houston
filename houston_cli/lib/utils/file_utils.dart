import 'dart:io';

import 'package:dcli/dcli.dart';
import 'package:houston_cli/constants.dart';
import 'package:houston_cli/models/blueprint.dart';
import 'package:houston_cli/utils/string_utils.dart';
import 'package:yaml/yaml.dart';

const isCompiled = String.fromEnvironment('COMPILED') == 'true';

class FileUtils {
  static String get appName {
    return Constants.appName;
  }

  static String get flutterDir {
    return Directory("$houstonRoot/${appName}_flutter").path;
  }

  static String get serverpodDir {
    return Directory("$houstonRoot/${appName}_server").path;
  }

  static String get supabaseDir {
    return Directory("$houstonRoot/${appName}_supabase").path;
  }

  static String get djangoRootDir {
    return Directory("$houstonRoot/${appName}_django").path;
  }

  static String djangoModuleDirectory(String appName) {
    return "$djangoRootDir/${snakeCase(appName)}";
  }

  static String get djangoApiDirectory {
    return "$djangoRootDir/api";
  }

  static String get cliDir {
    return Directory("$houstonRoot/${appName}_cli").path;
  }

  static String get houstonRoot {
    if (isCompiled) {
      return pwd;
    }

    return (Directory(pwd).parent).path;
  }

  static String get blueprintsDir {
    return Directory("$cliDir/blueprints").path;
  }

  static String get bricksDir {
    return Directory("$cliDir/bricks").path;
  }

  static YamlMap parseYaml(String path) {
    File file = File(path);
    String yamlString = file.readAsStringSync();
    final yaml = loadYaml(yamlString);
    return yaml;
  }

  static Blueprint parseBlueprint(String path) {
    final yaml = parseYaml(path);
    return Blueprint.fromYaml(yaml);
  }

  static bool _textExists(String fileContents, String lookup) {
    fileContents = fileContents.replaceAll("\n", "").replaceAll(" ", "");
    lookup = lookup.replaceAll("\n", "").replaceAll(" ", "");
    return fileContents.contains(lookup);
  }

  static Future<void> setTextInFile({
    required String path,
    required String value,
  }) async {
    final f = File(path);
    await f.writeAsString(value);
  }

  static Future<void> insertTextInFile({
    required String path,
    required String value,
    String spacer = "\n",
    bool preventDuplicates = true,
    String? duplicateLookup,
    bool prepend = false,
  }) async {
    final f = File(path);
    final text = await f.readAsString();
    if (text.isEmpty) {
      spacer = "";
    }

    if (preventDuplicates && _textExists(text, duplicateLookup ?? value)) {
      return;
    }

    if (prepend) {
      await f.writeAsString("$value$spacer$text");
    } else {
      await f.writeAsString("$text$spacer$value");
    }
  }

  static Future<void> insertTextInFileAtToken({
    required String path,
    required String token,
    required String value,
    bool preventDuplicates = true,
    String? duplicateLookup,
  }) async {
    final f = File(path);
    String text = await f.readAsString();

    if (preventDuplicates && _textExists(text, duplicateLookup ?? value)) {
      print(grey("String already exists in file. Skipping."));
      return;
    }

    final newLine = '''$value
    $token''';

    text = text.replaceAll(token, newLine);
    await f.writeAsString(text);
  }

  static Future<int> countSpecificStringInFile(
      {required String path, required String search}) async {
    final f = File(path);
    String text = await f.readAsString();

    return _countOccurrences(text, search);
  }

  static int _countOccurrences(String text, String search) {
    int count = 0;
    int index = 0;

    while (true) {
      index = text.indexOf(search, index);
      if (index == -1) {
        break;
      }
      count++;
      index += search.length;
    }

    return count;
  }

  static Future<bool> directoryExists(String path) async {
    return Directory(path).exists();
  }

  static Future<void> moveDirectory(
      Directory source, Directory destination) async {
    if (!await destination.exists()) {
      await destination.create(recursive: true);
    }

    await for (final entity in source.list(recursive: false)) {
      final newPath = '${destination.path}/${entity.uri.pathSegments.last}';
      if (entity is File) {
        await entity.copy(newPath);
        await entity.delete();
      } else if (entity is Directory) {
        await moveDirectory(entity, Directory(newPath));
      }
    }

    await source.delete();
  }

  static Future<void> copyFileOverwrite(
      String sourcePath, String destinationPath) async {
    final sourceFile = File(sourcePath);
    final destinationFile = File(destinationPath);

    if (!await sourceFile.exists()) {
      throw Exception('Source file does not exist: $sourcePath');
    }

    if (await destinationFile.exists()) {
      await destinationFile.delete();
    }

    await sourceFile.copy(destinationPath);
  }

  static void deleteFile(String sourcePath) {
    final file = File(sourcePath);
    if (file.existsSync()) {
      file.deleteSync();
    }
  }

  static void deleteFiles(List<String> sourcePaths) {
    for (final sourcePath in sourcePaths) {
      deleteFile(sourcePath);
    }
  }

  static void deleteDirectory(String sourcePath) {
    final directory = Directory(sourcePath);
    if (directory.existsSync()) {
      directory.deleteSync(recursive: true);
    }
  }
}

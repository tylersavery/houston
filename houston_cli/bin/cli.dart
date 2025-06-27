import 'dart:convert';
import 'dart:io' as io;
import 'package:dcli/dcli.dart';
import 'package:houston_cli/config.dart';
import 'package:houston_cli/init_project.dart';
import 'package:houston_cli/scaffold_feature.dart';
import 'package:houston_cli/utils/string_utils.dart';

Future<void> main(List<String> args) async {
  final config = HoustonConfig.getConfigOrNull();

  // scaffoldFeature(
  //   name: "food",
  //   generateServer: false,
  //   generateFlutter: true,
  //   generateMigrations: false,
  //   runMigrations: false,
  //   updateRoutes: false,
  //   updateNavigation: false,
  //   runPostGenerator: false,
  //   runPostFormatter: false,
  // );

  // return;

  print(blue("Welcome to Houston! Type help to see the list of commands."));
  for (;;) {
    final line = ask('${green('houston')}${blue('::')}');
    if (line.isNotEmpty) {
      await evaluate(line);
    }
  }
}

Future<void> evaluate(String command) async {
  final parts = command.split(' ');
  switch (parts[0]) {
    case 'help':
      await showHelp();
      break;
    case 'init':
      await initProject();
      break;
    case 'scaffold':
      await scaffoldFeature();
      break;

    case 'exit':
      print(white("Chat soon!"));
      io.exit(0);
    default:
      if (which(parts[0]).found) {
        command.start(nothrow: true, progress: Progress.print());
      } else {
        print(red('Unknown command: ${parts[0]}'));
      }
      break;
  }
}

Future<void> showHelp() async {
  print(white("Houston Help"));
  print(white("------------"));
  print("help\t\tShow this help text");
  print("new\t\tGenerate the blueprint file for a new feature");
  print("scaffold\tScaffold out the code for an existing blueprint");
  print("exit\t\tClose the Houston CLI");
}

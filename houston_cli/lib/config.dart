import 'dart:convert';
import 'dart:io';

import 'package:houston_cli/utils/file_utils.dart';

enum ServerBackendOption {
  serverpod(0),
  supabase(1),
  django(2),
  all(3),
  ;

  final int value;
  const ServerBackendOption(this.value);
}

enum FrontendUiOption {
  material(0),
  cupertino(1),
  shadcn(2),
  forui(3),
  ;

  final int value;
  const FrontendUiOption(this.value);
}

class HoustonConfig {
  final String projectName;
  final ServerBackendOption backend;
  final FrontendUiOption frontendUi;

  HoustonConfig(
      {required this.projectName,
      required this.backend,
      required this.frontendUi});

  static HoustonConfig fromJson(Map<String, dynamic> json) {
    return HoustonConfig(
      projectName: json['name'],
      backend: ServerBackendOption.values[json['backend']],
      frontendUi: FrontendUiOption.values[json['ui']],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': projectName,
      'backend': backend.value,
      'ui': frontendUi.value,
    };
  }

  static HoustonConfig getConfig() {
    final configFile = File("${FileUtils.cliDir}/houston.config.json");
    final configExists = configFile.existsSync();

    if (!configExists) {
      throw (Exception(
          "Config file not found. Has this project been initialized yet?"));
    }

    final configFileContent = configFile.readAsStringSync();
    final configData = jsonDecode(configFileContent);

    return HoustonConfig.fromJson(configData);
  }

  static HoustonConfig? getConfigOrNull() {
    try {
      return getConfig();
    } catch (e) {
      return null;
    }
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:houston_cli/utils/file_utils.dart';

enum ServerBackendOption {
  serverpod(0, "Serverpod"),
  supabase(1, "Supabase"),
  django(2, "Django"),
  all(3, "All"),
  ;

  final int value;
  final String label;
  const ServerBackendOption(this.value, this.label);
}

enum FrontendUiOption {
  material(0, "Material"),
  cupertino(1, "Cupertino"),
  shadcn(2, "Shadcn"),
  forui(3, "Forui"),
  ;

  final int value;
  final String label;

  const FrontendUiOption(this.value, this.label);
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

import 'package:spriver_cli/models/blueprint.dart';
import 'package:spriver_cli/models/blueprint_property.dart';

abstract class BlueprintSerializer {
  final Blueprint blueprint;

  const BlueprintSerializer({required this.blueprint});

  String get name {
    return blueprint.name;
  }

  List<BlueprintProperty> get properties {
    return blueprint.properties;
  }

  Map<String, dynamic> serialize() => throw UnimplementedError();
}

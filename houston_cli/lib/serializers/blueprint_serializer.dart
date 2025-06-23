import 'package:houston_cli/models/blueprint.dart';
import 'package:houston_cli/models/blueprint_property.dart';

abstract class BlueprintSerializer {
  final Blueprint blueprint;

  const BlueprintSerializer({required this.blueprint});

  String get name {
    return blueprint.name;
  }

  String get namePlural {
    return blueprint.namePlural;
  }

  List<BlueprintProperty> get properties {
    return blueprint.properties;
  }

  Map<String, dynamic> serialize() => throw UnimplementedError();
}

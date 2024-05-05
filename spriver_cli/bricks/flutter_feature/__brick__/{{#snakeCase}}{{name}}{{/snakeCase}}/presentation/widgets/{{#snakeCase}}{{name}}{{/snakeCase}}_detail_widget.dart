import 'package:flutter/material.dart';
import 'package:spriver_client/spriver_client.dart';
import '../../domain/extensions/{{#snakeCase}}{{name}}{{/snakeCase}}_extension.dart';


class {{#pascalCase}}{{name}}{{/pascalCase}}DetailWidget extends StatelessWidget {
  final {{#pascalCase}}{{name}}{{/pascalCase}} {{#camelCase}}{{name}}{{/camelCase}};
  const {{#pascalCase}}{{name}}{{/pascalCase}}DetailWidget({
    super.key,
    required this.{{#camelCase}}{{name}}{{/camelCase}},
  });

  @override
  Widget build(BuildContext context) {
    return Text({{#camelCase}}{{name}}{{/camelCase}}.label);
  }
}

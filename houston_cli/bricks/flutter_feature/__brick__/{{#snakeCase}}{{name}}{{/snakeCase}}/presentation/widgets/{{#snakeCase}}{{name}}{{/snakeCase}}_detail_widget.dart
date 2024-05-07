import 'package:flutter/material.dart';
import '../../domain/models/{{#snakeCase}}{{name}}{{/snakeCase}}_model.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}DetailWidget extends StatelessWidget {
  final {{#pascalCase}}{{name}}{{/pascalCase}} {{#camelCase}}{{name}}{{/camelCase}};
  const {{#pascalCase}}{{name}}{{/pascalCase}}DetailWidget({
    super.key,
    required this.{{#camelCase}}{{name}}{{/camelCase}},
  });

  @override
  Widget build(BuildContext context) {
    {{^uiHeading2}}
    return Text({{#camelCase}}{{name}}{{/camelCase}}.label);
    {{/uiHeading2}}
    {{#uiHeading2}}
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text({{#camelCase}}{{name}}{{/camelCase}}.label),
        Text({{#camelCase}}{{name}}{{/camelCase}}.{{.}}),
        {{#uiDescription}}Text({{#camelCase}}{{name}}{{/camelCase}}.{{.}}),{{/uiDescription}}
      ],
    );
    {{/uiHeading2}}

  }
}

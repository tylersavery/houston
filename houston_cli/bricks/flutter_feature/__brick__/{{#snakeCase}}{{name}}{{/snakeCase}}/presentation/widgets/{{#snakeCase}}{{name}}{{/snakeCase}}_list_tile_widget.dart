import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:houston_client/houston_client.dart';
import '../screens/{{#snakeCase}}{{name}}{{/snakeCase}}_detail_screen.dart';
 {{^uiHeading1}}
import '../../domain/extensions/{{#snakeCase}}{{name}}{{/snakeCase}}_extension.dart';
{{/uiHeading1}}

class {{#pascalCase}}{{name}}{{/pascalCase}}ListTileWidget extends StatelessWidget {
  final {{#pascalCase}}{{name}}{{/pascalCase}} {{#camelCase}}{{name}}{{/camelCase}};

  const {{#pascalCase}}{{name}}{{/pascalCase}}ListTileWidget({
    super.key,
    required this.{{#camelCase}}{{name}}{{/camelCase}},
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        {{#uiHeading1}}title: Text({{#camelCase}}{{name}}{{/camelCase}}.{{.}}),{{/uiHeading1}}
        {{^uiHeading1}}title: Text({{#camelCase}}{{name}}{{/camelCase}}.label),{{/uiHeading1}}
        {{#uiHeading2}}subtitle: Text({{#camelCase}}{{name}}{{/camelCase}}.{{.}}),{{/uiHeading2}}
        onTap: () {
          context.push({{#pascalCase}}{{name}}{{/pascalCase}}DetailScreen.route({{#camelCase}}{{name}}{{/camelCase}}.id));
        },
      ),
    );
  }
}

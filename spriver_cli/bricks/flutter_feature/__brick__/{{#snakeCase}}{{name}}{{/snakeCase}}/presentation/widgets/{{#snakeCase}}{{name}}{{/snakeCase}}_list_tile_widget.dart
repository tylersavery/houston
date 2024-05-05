import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spriver_client/spriver_client.dart';
import '../screens/{{#snakeCase}}{{name}}{{/snakeCase}}_detail_screen.dart';
import '../../domain/extensions/{{#snakeCase}}{{name}}{{/snakeCase}}_extension.dart';

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
        title: Text({{#camelCase}}{{name}}{{/camelCase}}.label),
        onTap: () {
          context.push({{#pascalCase}}{{name}}{{/pascalCase}}DetailScreen.route({{#camelCase}}{{name}}{{/camelCase}}.id));
        },
      ),
    );
  }
}

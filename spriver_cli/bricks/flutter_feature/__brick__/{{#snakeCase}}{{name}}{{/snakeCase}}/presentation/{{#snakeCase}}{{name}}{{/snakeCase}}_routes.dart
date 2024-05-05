import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/{{#snakeCase}}{{name}}{{/snakeCase}}_detail_screen.dart';
import 'screens/{{#snakeCase}}{{name}}{{/snakeCase}}_edit_screen.dart';
import 'screens/{{#snakeCase}}{{name}}{{/snakeCase}}_list_screen.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}Routes {
  static const String namespace = "/{{#paramCase}}{{name}}{{/paramCase}}";
  static final shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: "{{#pascalCase}}{{name}}{{/pascalCase}} Shell");

  static StatefulShellBranch branch = StatefulShellBranch(
    navigatorKey: shellNavigatorKey,
    routes: [
      GoRoute(
        path: {{#pascalCase}}{{name}}{{/pascalCase}}ListScreen.route(),
        builder: (context, state) => const {{#pascalCase}}{{name}}{{/pascalCase}}ListScreen(),
      ),
      GoRoute(
        path: {{#pascalCase}}{{name}}{{/pascalCase}}EditScreen.routeNew(),
        builder: (context, _) => const {{#pascalCase}}{{name}}{{/pascalCase}}EditScreen(),
      ),
      GoRoute(
        path: {{#pascalCase}}{{name}}{{/pascalCase}}EditScreen.route(),
        builder: (context, state) => {{#pascalCase}}{{name}}{{/pascalCase}}EditScreen(
          {{#camelCase}}{{name}}{{/camelCase}}Id: int.parse(state.pathParameters['id'] ?? '0'),
        ),
      ),
      GoRoute(
        path: {{#pascalCase}}{{name}}{{/pascalCase}}DetailScreen.route(),
        builder: (context, state) => {{#pascalCase}}{{name}}{{/pascalCase}}DetailScreen(
          {{#camelCase}}{{name}}{{/camelCase}}Id: int.parse(state.pathParameters['id'] ?? '0'),
        ),
      ),
    ],
  );
}

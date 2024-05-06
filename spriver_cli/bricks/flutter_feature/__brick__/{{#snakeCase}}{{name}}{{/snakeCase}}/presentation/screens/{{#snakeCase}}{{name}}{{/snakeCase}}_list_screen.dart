import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spriver_flutter/features/{{#snakeCase}}{{name}}{{/snakeCase}}/presentation/widgets/{{#snakeCase}}{{name}}{{/snakeCase}}_infinite_list_widget.dart';
import '../../../../core/widgets/base_screen.dart';
import '{{#snakeCase}}{{name}}{{/snakeCase}}_edit_screen.dart';
import '../providers/{{#snakeCase}}{{name}}{{/snakeCase}}_form_provider.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}ListScreen extends BaseScreen {
  static String route() => "/{{#paramCase}}{{name}}{{/paramCase}}";

  const {{#pascalCase}}{{name}}{{/pascalCase}}ListScreen({super.key, super.includeMainDrawer = true});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("My {{#titleCase}}{{name}}{{/titleCase}}s"),
      actions: [
        IconButton(
          onPressed: () {
            ref.read({{#camelCase}}{{name}}{{/camelCase}}FormProvider.notifier).reset();
            context.push({{#pascalCase}}{{name}}{{/pascalCase}}EditScreen.routeNew());
          },
          icon: const Icon(Icons.add),
        )
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const {{#pascalCase}}{{name}}{{/pascalCase}}InfiniteListWidget();
  }
}

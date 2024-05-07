import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/base_screen.dart';
import '../../../../core/widgets/loader.dart';
import '{{#snakeCase}}{{name}}{{/snakeCase}}_edit_screen.dart';
import '{{#snakeCase}}{{name}}{{/snakeCase}}_list_screen.dart';
import '../providers/{{#snakeCase}}{{name}}{{/snakeCase}}_detail_provider.dart';
import '../providers/{{#snakeCase}}{{name}}{{/snakeCase}}_form_provider.dart';
import '../widgets/{{#snakeCase}}{{name}}{{/snakeCase}}_detail_widget.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}DetailScreen extends BaseScreen {
  final int {{#camelCase}}{{name}}{{/camelCase}}Id;
  {{=<% %>=}}
  static String route([int? <% #camelCase %><%name%><% /camelCase%>Id]) => "${<% #pascalCase%><%name%><% /pascalCase %>ListScreen.route()}/${<% #camelCase%> <%name%><% /camelCase %>Id ?? ':id'}";
  <%={{ }}=%>
  const {{#pascalCase}}{{name}}{{/pascalCase}}DetailScreen({super.key, required this.{{#camelCase}}{{name}}{{/camelCase}}Id});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final data = ref.watch({{#camelCase}}{{name}}{{/camelCase}}DetailProvider({{#camelCase}}{{name}}{{/camelCase}}Id));

    return data.when(
      loading: () => AppBar(),
      error: (error, __) => AppBar(
        title: const Text("Error"),
      ),
      data: ({{#camelCase}}{{name}}{{/camelCase}}) {
        return AppBar(
          title: Text({{#camelCase}}{{name}}{{/camelCase}}.label),
          actions: [
            IconButton(
              onPressed: () async {
                await ref.read({{#camelCase}}{{name}}{{/camelCase}}FormProvider.notifier).load({{#camelCase}}{{name}}{{/camelCase}}Id);
                if (context.mounted) {
                  context.push({{#pascalCase}}{{name}}{{/pascalCase}}EditScreen.route({{#camelCase}}{{name}}{{/camelCase}}Id));
                }
              },
              icon: const Icon(Icons.edit),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final data = ref.watch({{#camelCase}}{{name}}{{/camelCase}}DetailProvider({{#camelCase}}{{name}}{{/camelCase}}Id));

    return data.when(
      loading: () => const Loader(),
      error: (error, __) => Center(
        child: Text(error.toString()),
      ),
      data: ({{#camelCase}}{{name}}{{/camelCase}}) {
        return Center(
          child: {{#pascalCase}}{{name}}{{/pascalCase}}DetailWidget(
            {{#camelCase}}{{name}}{{/camelCase}}: {{#camelCase}}{{name}}{{/camelCase}},
          ),
        );
      },
    );
  }
}

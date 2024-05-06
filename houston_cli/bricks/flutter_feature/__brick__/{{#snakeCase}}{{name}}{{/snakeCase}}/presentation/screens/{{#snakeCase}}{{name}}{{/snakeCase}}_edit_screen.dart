import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/toast_utils.dart';
import '../../../../core/widgets/base_screen.dart';
import '../providers/{{#snakeCase}}{{name}}{{/snakeCase}}_form_provider.dart';
import '../widgets/{{#snakeCase}}{{name}}{{/snakeCase}}_form_widget.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}EditScreen extends BaseScreen {
  final int? {{#camelCase}}{{name}}{{/camelCase}}Id;
  {{=<% %>=}}
  static String route([int? <% #camelCase %><%name%><% /camelCase %>Id]) => "/<% #paramCase %><%name%><% /paramCase %>/edit/${<% #camelCase %><%name%><% /camelCase %>Id ?? ':id'}";
  <%={{ }}=%>
  static String routeNew() => "/{{#paramCase}}{{name}}{{/paramCase}}/new";

  const {{#pascalCase}}{{name}}{{/pascalCase}}EditScreen({
    super.key,
    this.{{#camelCase}}{{name}}{{/camelCase}}Id,
  });

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final provider = ref.read({{#camelCase}}{{name}}{{/camelCase}}FormProvider.notifier);
    final state = ref.watch({{#camelCase}}{{name}}{{/camelCase}}FormProvider);

    final isEditing = state.{{#camelCase}}{{name}}{{/camelCase}}.id != null;

    return AppBar(
      title: Text(isEditing ? "Edit {{#titleCase}}{{name}}{{/titleCase}}" : "Create {{#titleCase}}{{name}}{{/titleCase}}"),
      actions: [
        IconButton(
          onPressed: () async {
            final success = await provider.submit();
            if (success) {
              if (context.mounted) {
                Toast.message(context, "{{#titleCase}}{{name}}{{/titleCase}} Saved!");
                context.pop();
              }
            }
          },
          icon: const Icon(Icons.done),
        ),
      ],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: {{#pascalCase}}{{name}}{{/pascalCase}}FormWidget(),
      ),
    );
  }
}

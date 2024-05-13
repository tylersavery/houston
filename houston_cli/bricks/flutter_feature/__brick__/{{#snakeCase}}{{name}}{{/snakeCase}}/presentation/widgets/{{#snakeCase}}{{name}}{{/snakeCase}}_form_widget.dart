import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
{{#formImports}}{{{.}}}
{{/formImports}}
import '../providers/{{#snakeCase}}{{name}}{{/snakeCase}}_form_provider.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}FormWidget extends ConsumerWidget {
  final int? {{#camelCase}}{{name}}{{/camelCase}}Id;
  const {{#pascalCase}}{{name}}{{/pascalCase}}FormWidget({super.key, this.{{#camelCase}}{{name}}{{/camelCase}}Id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read({{#camelCase}}{{name}}{{/camelCase}}FormProvider.notifier);
    final state = ref.watch({{#camelCase}}{{name}}{{/camelCase}}FormProvider);
    final isEditing = state.{{#camelCase}}{{name}}{{/camelCase}}.id != null;

    return Form(
      key: provider.formKey,
      child: Column(
        children: [
          if (state.error != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(state.error!),
            ),
            {{#formInputs}}{{{.}}}{{/formInputs}}
          if (isEditing)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  final success = await provider.delete();
                  if (success) {
                    if (context.mounted) {
                      context.pop();
                      context.pop();
                    }
                  }
                },
                child: const Text("Delete {{#titleCase}}{{name}}{{/titleCase}}"),
              ),
            ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../domain/models/{{#snakeCase}}{{name}}{{/snakeCase}}_model.dart';
{{#relationshipChildren}}
import '../../../{{#snakeCase}}{{.}}{{/snakeCase}}/domain/models/{{#snakeCase}}{{.}}{{/snakeCase}}_list_variant.dart';
import '../../../{{#snakeCase}}{{.}}{{/snakeCase}}/presentation/widgets/{{#snakeCase}}{{.}}{{/snakeCase}}_infinite_list_widget.dart';
{{/relationshipChildren}}

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
        {{#imagePreview}}if ({{#camelCase}}{{name}}{{/camelCase}}.{{.}}.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Image.network({{#camelCase}}{{name}}{{/camelCase}}.{{.}}, height: 200),
          ),{{/imagePreview}}
        Text({{#camelCase}}{{name}}{{/camelCase}}.{{.}}),
        {{#uiDescription}}Text({{#camelCase}}{{name}}{{/camelCase}}.{{.}}),{{/uiDescription}}
        {{#relationshipChildren}}
        Expanded(
          child: {{#pascalCase}}{{.}}{{/pascalCase}}InfiniteListWidget(
            variant: {{#pascalCase}}{{.}}{{/pascalCase}}ListVariant.{{#camelCase}}{{name}}{{/camelCase}},
            variantArg: {{#camelCase}}{{name}}{{/camelCase}}.uid,
          ),
        ),
        {{/relationshipChildren}}
      ],
    );
    {{/uiHeading2}}

  }
}

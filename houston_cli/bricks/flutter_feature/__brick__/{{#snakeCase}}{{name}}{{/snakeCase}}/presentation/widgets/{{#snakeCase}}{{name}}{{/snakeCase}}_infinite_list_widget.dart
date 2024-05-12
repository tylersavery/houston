import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widgets/base_component.dart';
import '../../../../core/widgets/infinite_list_widget.dart';
import '../../domain/models/{{#snakeCase}}{{name}}{{/snakeCase}}_list_variant.dart';
import '../../domain/models/{{#snakeCase}}{{name}}{{/snakeCase}}_model.dart';
import '../providers/{{#snakeCase}}{{name}}{{/snakeCase}}_infinite_list_provider.dart';
import '{{#snakeCase}}{{name}}{{/snakeCase}}_list_tile_widget.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}InfiniteListWidget extends BaseComponent {
  final Function({{#pascalCase}}{{name}}{{/pascalCase}})? onPressed;
  final {{#pascalCase}}{{name}}{{/pascalCase}}ListVariant variant;
  final String? variantArg;

  const {{#pascalCase}}{{name}}{{/pascalCase}}InfiniteListWidget({
    super.key,
    this.variant = {{#pascalCase}}{{name}}{{/pascalCase}}ListVariant.all,
    this.variantArg,
    this.onPressed,
  });

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read({{#camelCase}}{{name}}{{/camelCase}}InfiniteListProvider(variant, variantArg).notifier);

    return InfiniteListWidget<{{#pascalCase}}{{name}}{{/pascalCase}}>(
      pagingController: provider.pagingController,
      itemBuilder: (context, {{#camelCase}}{{name}}{{/camelCase}}, index) {
        return {{#pascalCase}}{{name}}{{/pascalCase}}ListTileWidget({{#camelCase}}{{name}}{{/camelCase}}: {{#camelCase}}{{name}}{{/camelCase}}, onPressed: onPressed);
      },
      emptyText: "No {{#titleCase}}{{name}}{{/titleCase}}s",
      onRefresh: provider.refresh,
    );
  }
}

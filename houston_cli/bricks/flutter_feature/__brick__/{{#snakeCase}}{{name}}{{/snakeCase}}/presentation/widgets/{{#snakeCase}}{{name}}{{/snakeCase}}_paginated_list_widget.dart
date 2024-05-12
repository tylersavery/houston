import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/buttons.dart';
import '../../../../core/widgets/base_component.dart';
import '../../../../core/widgets/loader.dart';
import '../../domain/models/{{#snakeCase}}{{name}}{{/snakeCase}}_list_variant.dart';
import '../providers/{{#snakeCase}}{{name}}{{/snakeCase}}_paginated_list_provider.dart';
import '../state/{{#snakeCase}}{{name}}{{/snakeCase}}_paginated_list_state.dart';
import '{{#snakeCase}}{{name}}{{/snakeCase}}_list_tile_widget.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}PaginatedListWidget extends BaseComponent {
  final {{#pascalCase}}{{name}}{{/pascalCase}}ListVariant variant;
  final String? variantArg;

  const {{#pascalCase}}{{name}}{{/pascalCase}}PaginatedListWidget({
    super.key,
    this.variant = {{#pascalCase}}{{name}}{{/pascalCase}}ListVariant.all,
    this.variantArg,
  });

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read({{#camelCase}}{{name}}{{/camelCase}}PaginatedListProvider(variant, variantArg).notifier);
    final state = ref.watch({{#camelCase}}{{name}}{{/camelCase}}PaginatedListProvider(variant, variantArg));

    switch (state) {
      case {{#pascalCase}}{{name}}{{/pascalCase}}PaginatedListStateLoading():
        return const Loader();
      case {{#pascalCase}}{{name}}{{/pascalCase}}PaginatedListStateSuccess():
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: state.data.results.length,
                itemBuilder: (context, index) {
                  final {{#camelCase}}{{name}}{{/camelCase}} = state.data.results[index];
                  return {{#pascalCase}}{{name}}{{/pascalCase}}ListTileWidget({{#camelCase}}{{name}}{{/camelCase}}: {{#camelCase}}{{name}}{{/camelCase}});
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppButton(
                  label: "Previous",
                  icon: Icons.chevron_left,
                  type: AppButtonType.Text,
                  onPressed: state.data.page > 1
                      ? () {
                          provider.load(page: state.data.page - 1, limit: state.data.limit);
                        }
                      : null,
                ),
                AppButton(
                  label: "Next",
                  type: AppButtonType.Text,
                  icon: Icons.chevron_right,
                  iconTrails: true,
                  onPressed: state.data.canLoadMore
                      ? () {
                          provider.load(page: state.data.page + 1, limit: state.data.limit);
                        }
                      : null,
                ),
              ],
            ),
          ],
        );
      case {{#pascalCase}}{{name}}{{/pascalCase}}PaginatedListStateFailure():
        return Center(
          child: Text(state.error),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}

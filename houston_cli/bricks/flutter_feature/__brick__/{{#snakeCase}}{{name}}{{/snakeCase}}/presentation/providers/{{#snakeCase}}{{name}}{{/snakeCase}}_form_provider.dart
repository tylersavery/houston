import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/utils/validation_utils.dart';
import '../../domain/providers/{{#camelCase}}{{name}}{{/camelCase}}_repository_provider.dart';
import '{{#snakeCase}}{{name}}{{/snakeCase}}_detail_provider.dart';
import '../state/{{#snakeCase}}{{name}}{{/snakeCase}}_form_state.dart';
import '{{#snakeCase}}{{name}}{{/snakeCase}}_infinite_list_provider.dart';
{{#formProviderImports}}{{{.}}}{{/formProviderImports}}

part '{{#snakeCase}}{{name}}{{/snakeCase}}_form_provider.g.dart';

@Riverpod(keepAlive: true)
class {{#pascalCase}}{{name}}{{/pascalCase}}Form extends _${{#pascalCase}}{{name}}{{/pascalCase}}Form {
  @override
  {{#pascalCase}}{{name}}{{/pascalCase}}FormState build() {
    return {{#pascalCase}}{{name}}{{/pascalCase}}FormState.initial();
  }

  final formKey = GlobalKey<FormState>();
  {{#formControllers}}{{{.}}}
  {{/formControllers}}

  {{#formValidators}}{{{.}}}
  {{/formValidators}}

  Future<void> load(int {{#camelCase}}{{name}}{{/camelCase}}Id) async {
    final result = await ref.read({{#camelCase}}{{name}}{{/camelCase}}RepositoryProvider).retrieve({{#camelCase}}{{name}}{{/camelCase}}Id);

    result.fold(
      (failure) {
        state = state.failure(failure.message);
      },
      ({{#camelCase}}{{name}}{{/camelCase}}) {
        state = state.success({{#camelCase}}{{name}}{{/camelCase}});
        _refreshControllers();
      },
    );
  }

  void _refreshControllers() {
    {{#formControllerRefreshers}}{{{.}}}
    {{/formControllerRefreshers}}
  }

  void reset() {
    state = {{#pascalCase}}{{name}}{{/pascalCase}}FormState.initial();
    _refreshControllers();
  }

  {{#formSetters}}{{{.}}}
  {{/formSetters}}

  Future<bool> submit() async {
    if (!formKey.currentState!.validate()) {
      state = state.failure("Invalid Details");
      return false;
    }

    final {{#camelCase}}{{name}}{{/camelCase}} = state.{{#camelCase}}{{name}}{{/camelCase}}.copyWith(
      {{#formControllerSetters}}{{{.}}},
      {{/formControllerSetters}}
    );

    state = state.loading();

    final result = await ref.read({{#camelCase}}{{name}}{{/camelCase}}RepositoryProvider).save({{#camelCase}}{{name}}{{/camelCase}});

    return result.fold(
      (failure) {
        state = state.failure(failure.message);
        return false;
      },
      ({{#camelCase}}{{name}}{{/camelCase}}) {
        state = state.success({{#camelCase}}{{name}}{{/camelCase}});
        reset();
        ref.read({{#camelCase}}{{name}}{{/camelCase}}InfiniteListProvider).refresh();
        if ({{#camelCase}}{{name}}{{/camelCase}}.id != null) {
          ref.invalidate({{#camelCase}}{{name}}{{/camelCase}}DetailProvider({{#camelCase}}{{name}}{{/camelCase}}.id!));
        }
        return true;
      },
    );
  }

  Future<bool> delete() async {
    if (state.{{#camelCase}}{{name}}{{/camelCase}}.id != null) {
      final result = await ref.read({{#camelCase}}{{name}}{{/camelCase}}RepositoryProvider).delete(state.{{#camelCase}}{{name}}{{/camelCase}}.id!);
    
      return result.fold((failure) {
        state = state.failure(failure.message);
        return false;
      }, (_) {
        reset();
        ref.invalidate({{#camelCase}}{{name}}{{/camelCase}}InfiniteListProvider);
        return true;
      });
    }

    return false;
  }
}

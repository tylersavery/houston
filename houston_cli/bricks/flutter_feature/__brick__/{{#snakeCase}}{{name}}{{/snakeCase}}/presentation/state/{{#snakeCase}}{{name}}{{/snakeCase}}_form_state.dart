import '../../domain/models/{{#snakeCase}}{{name}}{{/snakeCase}}_model.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}FormState {
  final {{#pascalCase}}{{name}}{{/pascalCase}} {{#camelCase}}{{name}}{{/camelCase}};
  final bool isLoading;
  final String? error;

  {{#pascalCase}}{{name}}{{/pascalCase}}FormState({
    required this.{{#camelCase}}{{name}}{{/camelCase}},
    required this.isLoading,
    this.error,
  });

  static {{#pascalCase}}{{name}}{{/pascalCase}} get initial{{#pascalCase}}{{name}}{{/pascalCase}} {
    return {{#pascalCase}}{{name}}{{/pascalCase}}(
      id: null,
      {{#emptyParams}}{{{.}}},
      {{/emptyParams}});
  }

  factory {{#pascalCase}}{{name}}{{/pascalCase}}FormState.initial() {
    return {{#pascalCase}}{{name}}{{/pascalCase}}FormState(
      isLoading: false,
      {{#camelCase}}{{name}}{{/camelCase}}: initial{{#pascalCase}}{{name}}{{/pascalCase}},
    );
  }

  {{#pascalCase}}{{name}}{{/pascalCase}}FormState loading() {
    return {{#pascalCase}}{{name}}{{/pascalCase}}FormState(
      {{#camelCase}}{{name}}{{/camelCase}}: {{#camelCase}}{{name}}{{/camelCase}},
      isLoading: true,
      error: null,
    );
  }

  {{#pascalCase}}{{name}}{{/pascalCase}}FormState success({{#pascalCase}}{{name}}{{/pascalCase}} {{#camelCase}}{{name}}{{/camelCase}}) {
    return {{#pascalCase}}{{name}}{{/pascalCase}}FormState(
      {{#camelCase}}{{name}}{{/camelCase}}: {{#camelCase}}{{name}}{{/camelCase}},
      isLoading: false,
      error: null,
    );
  }

  {{#pascalCase}}{{name}}{{/pascalCase}}FormState failure(String error) {
    return {{#pascalCase}}{{name}}{{/pascalCase}}FormState(
      {{#camelCase}}{{name}}{{/camelCase}}: initial{{#pascalCase}}{{name}}{{/pascalCase}},
      isLoading: false,
      error: error,
    );
  }

  {{#pascalCase}}{{name}}{{/pascalCase}}FormState update{{#pascalCase}}{{name}}{{/pascalCase}}({{#pascalCase}}{{name}}{{/pascalCase}} {{#camelCase}}{{name}}{{/camelCase}}) {
    return {{#pascalCase}}{{name}}{{/pascalCase}}FormState(
      {{#camelCase}}{{name}}{{/camelCase}}: {{#camelCase}}{{name}}{{/camelCase}},
      isLoading: isLoading,
      error: error,
    );
  }

  {{#pascalCase}}{{name}}{{/pascalCase}}FormState clean() {
    return {{#pascalCase}}{{name}}{{/pascalCase}}FormState(
      {{#camelCase}}{{name}}{{/camelCase}}: {{#camelCase}}{{name}}{{/camelCase}},
      isLoading: false,
      error: null,
    );
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';

part '{{#snakeCase}}{{name}}{{/snakeCase}}_model.freezed.dart';
part '{{#snakeCase}}{{name}}{{/snakeCase}}_model.g.dart';

{{#toJsonFunctions}}{{{.}}}
{{/toJsonFunctions}}

@freezed
class {{#pascalCase}}{{name}}{{/pascalCase}} with _${{#pascalCase}}{{name}}{{/pascalCase}} {
  const {{#pascalCase}}{{name}}{{/pascalCase}}._();

  factory {{#pascalCase}}{{name}}{{/pascalCase}}({
    int? id,
    {{#properties}}{{{modelField}}}
    {{/properties}}
  }) = _{{#pascalCase}}{{name}}{{/pascalCase}};

  factory {{#pascalCase}}{{name}}{{/pascalCase}}.fromJson(Map<String, dynamic> json) => _${{#pascalCase}}{{name}}{{/pascalCase}}FromJson(json);

  String get label {
    {{#uiHeading1}}return {{{.}}};{{/uiHeading1}}
    {{^uiHeading1}}return "$id";{{/uiHeading1}}
  }
}
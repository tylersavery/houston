import 'package:houston_client/houston_client.dart';
import 'package:houston_flutter/features/{{#snakeCase}}{{name}}{{/snakeCase}}/domain/models/{{#camelCase}}{{name}}{{/camelCase}}_model.dart';

class {{#pascalCase}}{{name}}{{/pascalCase}}Mapper {
  static {{#pascalCase}}{{name}}{{/pascalCase}} toModel({{#pascalCase}}{{name}}{{/pascalCase}}DTO {{#camelCase}}{{name}}{{/camelCase}}DTO) {
    return {{#pascalCase}}{{name}}{{/pascalCase}}(
      id: {{#camelCase}}{{name}}{{/camelCase}}DTO.id,
      {{#dtoToModelFields}}{{{.}}}
      {{/dtoToModelFields}}
    );
  }

  static {{#pascalCase}}{{name}}{{/pascalCase}}DTO toDto({{#pascalCase}}{{name}}{{/pascalCase}} {{#camelCase}}{{name}}{{/camelCase}}) {
    return {{#pascalCase}}{{name}}{{/pascalCase}}DTO(
      id: {{#camelCase}}{{name}}{{/camelCase}}.id,
      {{#modelToDtoFields}}{{{.}}}
      {{/modelToDtoFields}}
    );
  }

  static List<{{#pascalCase}}{{name}}{{/pascalCase}}> listToModel(List<{{#pascalCase}}{{name}}{{/pascalCase}}DTO> {{#camelCase}}{{name}}{{/camelCase}}s) {
    return {{#camelCase}}{{name}}{{/camelCase}}s.map(({{#camelCase}}{{name}}{{/camelCase}}) => toModel({{#camelCase}}{{name}}{{/camelCase}})).toList();
  }

  static List<{{#pascalCase}}{{name}}{{/pascalCase}}DTO> listToDto(List<{{#pascalCase}}{{name}}{{/pascalCase}}> {{#camelCase}}{{name}}{{/camelCase}}s) {
    return {{#camelCase}}{{name}}{{/camelCase}}s.map(({{#camelCase}}{{name}}{{/camelCase}}) => toDto({{#camelCase}}{{name}}{{/camelCase}})).toList();
  }
}
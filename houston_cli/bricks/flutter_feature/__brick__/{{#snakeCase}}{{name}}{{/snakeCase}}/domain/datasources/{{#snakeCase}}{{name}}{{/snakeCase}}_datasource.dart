import 'package:houston_flutter/core/models/paginated_response.dart';
import '../models/{{#snakeCase}}{{name}}{{/snakeCase}}_model.dart';

abstract interface class {{#pascalCase}}{{name}}{{/pascalCase}}DataSource {
  Future<PaginatedResponse<{{#pascalCase}}{{name}}{{/pascalCase}}>> list({required int page, required int limit});
  Future<{{#pascalCase}}{{name}}{{/pascalCase}}> retrieve(int id);
  Future<{{#pascalCase}}{{name}}{{/pascalCase}}> save({{#pascalCase}}{{name}}{{/pascalCase}} {{#camelCase}}{{name}}{{/camelCase}});
  Future<void> delete(int id);
}
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/{{#snakeCase}}{{name}}{{/snakeCase}}_repository_impl.dart';
import '{{#snakeCase}}{{name}}{{/snakeCase}}_datasource_provider.dart';
import '../repositories/{{#snakeCase}}{{name}}{{/snakeCase}}_repository.dart';

final {{#camelCase}}{{name}}{{/camelCase}}RepositoryProvider = Provider<{{#pascalCase}}{{name}}{{/pascalCase}}Repository>(
  (ref) {
    return {{#pascalCase}}{{name}}{{/pascalCase}}RespositoryImpl(ref.read({{#camelCase}}{{name}}{{/camelCase}}DataSourceProvider));
  },
);

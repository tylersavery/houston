{{#serverBackendIsServerpod}}
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/{{#snakeCase}}{{name}}{{/snakeCase}}_repository_impl_serverpod.dart';
import '{{#snakeCase}}{{name}}{{/snakeCase}}_datasource_provider.dart';
import '../repositories/{{#snakeCase}}{{name}}{{/snakeCase}}_repository.dart';

final {{#camelCase}}{{name}}{{/camelCase}}RepositoryProvider = Provider<{{#pascalCase}}{{name}}{{/pascalCase}}Repository>(
  (ref) {
    return {{#pascalCase}}{{name}}{{/pascalCase}}RespositoryImpl(ref.read({{#camelCase}}{{name}}{{/camelCase}}DataSourceProvider));
  },
);
{{/serverBackendIsServerpod}}
{{#serverBackendIsSupabase}}
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/{{#snakeCase}}{{name}}{{/snakeCase}}_repository_impl_supabase.dart';
import '{{#snakeCase}}{{name}}{{/snakeCase}}_datasource_provider.dart';
import '../repositories/{{#snakeCase}}{{name}}{{/snakeCase}}_repository.dart';

final {{#camelCase}}{{name}}{{/camelCase}}RepositoryProvider = Provider<{{#pascalCase}}{{name}}{{/pascalCase}}Repository>(
  (ref) {
    return {{#pascalCase}}{{name}}{{/pascalCase}}RespositoryImplSupabase(ref.read({{#camelCase}}{{name}}{{/camelCase}}DataSourceProvider));
  },
);
{{/serverBackendIsSupabase}}
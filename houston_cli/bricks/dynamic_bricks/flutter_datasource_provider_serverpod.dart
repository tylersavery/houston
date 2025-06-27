import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:houston_flutter/core/providers/serverpod_client_provider.dart';
import '../../data/datasources/{{#snakeCase}}{{name}}{{/snakeCase}}_datasource_serverpod.dart';

import '../../domain/datasources/{{#snakeCase}}{{name}}{{/snakeCase}}_datasource.dart';

final {{#camelCase}}{{name}}{{/camelCase}}DataSourceProvider = Provider<{{#pascalCase}}{{name}}{{/pascalCase}}DataSource>(
  (ref) {
    return {{#pascalCase}}{{name}}{{/pascalCase}}DataSourceServerpodImpl(ref.read(serverpodClientProvider));
  },
);

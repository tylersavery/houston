import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/providers/client_provider.dart';
import '../../../../core/providers/session_manager_provider.dart';
import '../../data/datasources/{{#snakeCase}}{{name}}{{/snakeCase}}_datasource.dart';

final {{#camelCase}}{{name}}{{/camelCase}}DataSourceProvider = Provider<{{#pascalCase}}{{name}}{{/pascalCase}}DataSource>(
  (ref) {
    return {{#pascalCase}}{{name}}{{/pascalCase}}DataSourceImpl(ref.read(clientProvider), ref.read(sessionManagerProvider));
  },
);

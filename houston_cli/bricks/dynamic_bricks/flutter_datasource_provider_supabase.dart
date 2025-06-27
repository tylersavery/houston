import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:houston_flutter/core/providers/supabase_client_provider.dart';
import '../../data/datasources/{{#snakeCase}}{{name}}{{/snakeCase}}_datasource_supabase.dart';

import '../../domain/datasources/{{#snakeCase}}{{name}}{{/snakeCase}}_datasource.dart';

final {{#camelCase}}{{name}}{{/camelCase}}DataSourceProvider = Provider<{{#pascalCase}}{{name}}{{/pascalCase}}DataSource>(
  (ref) {
    return {{#pascalCase}}{{name}}{{/pascalCase}}DataSourceSupabaseImpl(ref.read(supabaseClientProvider));
  },
);

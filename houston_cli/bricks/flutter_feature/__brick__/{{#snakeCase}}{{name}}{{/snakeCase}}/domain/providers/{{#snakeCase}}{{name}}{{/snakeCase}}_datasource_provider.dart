{{#serverBackendIsServerpod}}
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/providers/client_provider.dart';
import '../../../../core/providers/session_manager_provider.dart';
import '../../data/datasources/{{#snakeCase}}{{name}}{{/snakeCase}}_datasource_serverpod.dart';

final {{#camelCase}}{{name}}{{/camelCase}}DataSourceProvider = Provider<{{#pascalCase}}{{name}}{{/pascalCase}}DataSource>(
  (ref) {
    return {{#pascalCase}}{{name}}{{/pascalCase}}DataSourceImpl(ref.read(clientProvider), ref.read(sessionManagerProvider));
  },
);
{{/serverBackendIsServerpod}}
{{#serverBackendIsSupabase}}
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/providers/supabase_client_provider.dart';
import '../../data/datasources/{{#snakeCase}}{{name}}{{/snakeCase}}_datasource_supabase.dart';

final {{#camelCase}}{{name}}{{/camelCase}}DataSourceProvider = Provider<{{#pascalCase}}{{name}}{{/pascalCase}}DataSourceSupabase>(
  (ref) {
    return {{#pascalCase}}{{name}}{{/pascalCase}}DataSourceSupabaseImpl(ref.read(supabaseClientProvider));
  },
);
{{/serverBackendIsSupabase}}




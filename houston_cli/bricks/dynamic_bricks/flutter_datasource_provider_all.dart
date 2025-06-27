import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:houston_flutter/core/providers/rest_client_provider.dart';
import 'package:houston_flutter/core/providers/rest_session_provider.dart';
import 'package:houston_flutter/config/constants.dart';
import 'package:houston_flutter/core/providers/serverpod_client_provider.dart';
import 'package:houston_flutter/core/providers/supabase_client_provider.dart';
import '../../data/datasources/{{#snakeCase}}{{name}}{{/snakeCase}}_datasource_serverpod.dart';
import '../../data/datasources/{{#snakeCase}}{{name}}{{/snakeCase}}_datasource_supabase.dart';
import '../../data/datasources/{{#snakeCase}}{{name}}{{/snakeCase}}_datasource_django.dart';

import '../../domain/datasources/{{#snakeCase}}{{name}}{{/snakeCase}}_datasource.dart';

final {{#camelCase}}{{name}}{{/camelCase}}DataSourceProvider = Provider<{{#pascalCase}}{{name}}{{/pascalCase}}DataSource>(
  (ref) {
    switch (Constants.serverBackend) {
      case ServerBackendOption.supabase:
        return {{#pascalCase}}{{name}}{{/pascalCase}}DataSourceSupabaseImpl(ref.read(supabaseClientProvider));
      case ServerBackendOption.serverpod:
        return {{#pascalCase}}{{name}}{{/pascalCase}}DataSourceServerpodImpl(ref.read(serverpodClientProvider));
      case ServerBackendOption.django:
        return {{#pascalCase}}{{name}}{{/pascalCase}}DataSourceDjangoImpl(ref.read(restClientProvider), ref.read(restSessionProvider.notifier));
    }
  },
);

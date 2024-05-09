import 'package:houston_flutter/config/constants.dart';
import 'package:houston_flutter/core/providers/serverpod_client_provider.dart';
import 'package:houston_flutter/core/providers/session_manager_provider.dart';
import 'package:houston_flutter/core/providers/supabase_client_provider.dart';
import 'package:houston_flutter/features/auth/data/datasources/auth_datasource_serverpod.dart';
import 'package:houston_flutter/features/auth/data/datasources/auth_datasource_supabase.dart';
import 'package:houston_flutter/features/auth/domain/datasources/auth_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final authDataSourceProvider = Provider<AuthDataSource>(
  (ref) {
    switch (Constants.serverBackend) {
      case ServerBackendOption.supabase:
        return AuthDataSourceSupabaseImpl(ref.read(supabaseClientProvider));
      case ServerBackendOption.serverpod:
        return AuthDataSourceServerpodImpl(ref.read(serverpodClientProvider), ref.read(serverpodSessionManagerProvider));
    }
  },
);

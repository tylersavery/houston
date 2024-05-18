import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:houston_flutter/config/constants.dart';
import 'package:houston_flutter/core/providers/serverpod_client_provider.dart';
import 'package:houston_flutter/core/providers/supabase_client_provider.dart';
import '../../data/datasources/game_system_datasource_serverpod.dart';
import '../../data/datasources/game_system_datasource_supabase.dart';
import '../../domain/datasources/game_system_datasource.dart';

final gameSystemDataSourceProvider = Provider<GameSystemDataSource>(
  (ref) {
    switch (Constants.serverBackend) {
      case ServerBackendOption.supabase:
        return GameSystemDataSourceSupabaseImpl(
            ref.read(supabaseClientProvider));
      case ServerBackendOption.serverpod:
        return GameSystemDataSourceServerpodImpl(
            ref.read(serverpodClientProvider));
    }
  },
);

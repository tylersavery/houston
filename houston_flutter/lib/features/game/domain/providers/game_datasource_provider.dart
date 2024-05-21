import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:houston_flutter/core/providers/rest_client_provider.dart';
import 'package:houston_flutter/core/providers/rest_session_provider.dart';
import 'package:houston_flutter/config/constants.dart';
import 'package:houston_flutter/core/providers/serverpod_client_provider.dart';
import 'package:houston_flutter/core/providers/supabase_client_provider.dart';
import '../../data/datasources/game_datasource_serverpod.dart';
import '../../data/datasources/game_datasource_supabase.dart';
import '../../data/datasources/game_datasource_django.dart';

import '../../domain/datasources/game_datasource.dart';

final gameDataSourceProvider = Provider<GameDataSource>(
  (ref) {
    switch (Constants.serverBackend) {
      case ServerBackendOption.supabase:
        return GameDataSourceSupabaseImpl(ref.read(supabaseClientProvider));
      case ServerBackendOption.serverpod:
        return GameDataSourceServerpodImpl(ref.read(serverpodClientProvider));
      case ServerBackendOption.django:
        return GameDataSourceDjangoImpl(ref.read(restClientProvider), ref.read(restSessionProvider.notifier));
    }
  },
);

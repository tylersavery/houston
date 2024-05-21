import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:houston_flutter/config/constants.dart';
import 'package:houston_flutter/core/providers/serverpod_client_provider.dart';
import 'package:houston_flutter/core/providers/supabase_client_provider.dart';
import '../../data/datasources/movie_datasource_serverpod.dart';
import '../../data/datasources/movie_datasource_supabase.dart';
import '../../domain/datasources/movie_datasource.dart';

final movieDataSourceProvider = Provider<MovieDataSource>(
  (ref) {
    switch (Constants.serverBackend) {
      case ServerBackendOption.supabase:
        return MovieDataSourceSupabaseImpl(ref.read(supabaseClientProvider));
      case ServerBackendOption.serverpod:
        return MovieDataSourceServerpodImpl(ref.read(serverpodClientProvider));
    }
  },
);

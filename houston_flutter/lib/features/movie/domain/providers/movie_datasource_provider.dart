import 'package:houston_flutter/config/constants.dart';
import 'package:houston_flutter/core/providers/serverpod_client_provider.dart';
import 'package:houston_flutter/core/providers/supabase_client_provider.dart';
import 'package:houston_flutter/features/movie/data/datasources/movie_datasource_serverpod.dart';
import 'package:houston_flutter/features/movie/data/datasources/movie_datasource_supabase.dart';
import 'package:houston_flutter/features/movie/domain/datasources/movie_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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

import 'package:houston_flutter/core/providers/supabase_client_provider.dart';
import 'package:houston_flutter/features/movie/data/datasources/movie_datasource_supabase.dart';
import 'package:houston_flutter/features/movie/domain/datasources/movie_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final movieDataSourceProvider = Provider<MovieDataSource>(
  (ref) {
    return MovieDataSourceSupabaseImpl(ref.read(supabaseClientProvider));
  },
);

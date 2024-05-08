import 'package:houston_flutter/core/providers/supbase_client_provider.dart';
import 'package:houston_flutter/features/movie/data/datasources/movie_datasource_supabase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final movieDataSourceProvider = Provider<MovieDataSourceSupabase>(
  (ref) {
    return MovieDataSourceSupabaseImpl(ref.read(supabaseClientProvider));
  },
);

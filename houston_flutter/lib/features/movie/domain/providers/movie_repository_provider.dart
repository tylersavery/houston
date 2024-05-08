import 'package:houston_flutter/features/movie/data/repositories/movie_respository_impl_supabase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'movie_datasource_provider.dart';
import '../repositories/movie_repository.dart';

final movieRepositoryProvider = Provider<MovieRepository>(
  (ref) {
    return MovieRespositoryImplSupabase(ref.read(movieDataSourceProvider));
  },
);

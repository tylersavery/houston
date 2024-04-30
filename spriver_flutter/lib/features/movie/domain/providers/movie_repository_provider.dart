import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spriver_flutter/features/movie/data/repositories/movie_repository_impl.dart';
import 'package:spriver_flutter/features/movie/domain/providers/movie_datasource_provider.dart';
import 'package:spriver_flutter/features/movie/domain/repositories/movie_repository.dart';

final movieRepositoryProvider = Provider<MovieRepository>(
  (ref) {
    return MovieRespositoryImpl(ref.read(movieDataSourceProvider));
  },
);

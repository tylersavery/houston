import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'movie_datasource_provider.dart';
import '../repositories/movie_repository.dart';
import '../../data/repositories/movie_repository_impl.dart';

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  return MovieRespositoryImpl(ref.read(movieDataSourceProvider));
});

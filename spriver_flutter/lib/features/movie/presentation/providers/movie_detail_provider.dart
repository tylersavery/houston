import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spriver_client/spriver_client.dart';
import '../../domain/providers/movie_repository_provider.dart';

part 'movie_detail_provider.g.dart';

@riverpod
Future<Movie> movieDetail(MovieDetailRef ref, int id) async {
  final result = await ref.read(movieRepositoryProvider).retrieve(id);

  return result.fold((failure) => throw Exception(failure), (movie) => movie);
}

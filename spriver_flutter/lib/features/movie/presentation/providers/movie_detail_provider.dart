import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spriver_client/spriver_client.dart';
import 'package:spriver_flutter/features/movie/domain/usecases/movie_retrieve_usecase.dart';

part 'movie_detail_provider.g.dart';

@riverpod
Future<Movie> movieDetail(MovieDetailRef ref, int id) async {
  final result = await ref.read(movieRetrieveUseCaseProvider)(RetrieveMovieParams(id: id));
  return result.fold((failure) => throw Exception(failure), (movie) => movie);
}

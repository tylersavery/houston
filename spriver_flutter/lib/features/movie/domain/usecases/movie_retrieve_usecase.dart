import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spriver_client/spriver_client.dart';
import 'package:spriver_flutter/core/error/failures.dart';
import 'package:spriver_flutter/core/usecase/usecase.dart';
import 'package:spriver_flutter/features/movie/domain/providers/movie_repository_provider.dart';
import 'package:spriver_flutter/features/movie/domain/repositories/movie_repository.dart';

class MovieRetrieveUseCase implements UseCase<Movie, RetrieveMovieParams> {
  final MovieRepository movieRepository;

  const MovieRetrieveUseCase(this.movieRepository);

  @override
  Future<Either<Failure, Movie>> call(RetrieveMovieParams params) async {
    return await movieRepository.retrieve(params.id);
  }
}

class RetrieveMovieParams {
  final int id;
  const RetrieveMovieParams({required this.id});
}

final movieRetrieveUseCaseProvider = Provider<MovieRetrieveUseCase>(
  (ref) {
    return MovieRetrieveUseCase(ref.read(movieRepositoryProvider));
  },
);

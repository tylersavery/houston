import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spriver_client/spriver_client.dart';
import 'package:spriver_flutter/core/error/failures.dart';
import 'package:spriver_flutter/core/usecase/usecase.dart';
import 'package:spriver_flutter/features/movie/domain/providers/movie_repository_provider.dart';
import 'package:spriver_flutter/features/movie/domain/repositories/movie_repository.dart';

class MovieListUseCase implements UseCase<List<Movie>, NoParams> {
  final MovieRepository movieRepository;

  const MovieListUseCase(this.movieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParams _) async {
    return await movieRepository.list();
  }
}

final movieListUseCaseProvider = Provider<MovieListUseCase>(
  (ref) {
    return MovieListUseCase(ref.read(movieRepositoryProvider));
  },
);

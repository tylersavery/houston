import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spriver_client/spriver_client.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../providers/movie_repository_provider.dart';
import '../repositories/movie_repository.dart';

class MovieSaveUseCase implements UseCase<Movie, SaveMovieParams> {
  final MovieRepository movieRepository;

  const MovieSaveUseCase(this.movieRepository);

  @override
  Future<Either<Failure, Movie>> call(SaveMovieParams params) async {
    return await movieRepository.save(params.movie);
  }
}

class SaveMovieParams {
  final Movie movie;
  const SaveMovieParams({required this.movie});
}

final movieSaveUseCaseProvider = Provider<MovieSaveUseCase>(
  (ref) {
    return MovieSaveUseCase(ref.read(movieRepositoryProvider));
  },
);

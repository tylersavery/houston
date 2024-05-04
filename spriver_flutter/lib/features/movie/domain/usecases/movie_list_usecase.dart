import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spriver_client/spriver_client.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../providers/movie_repository_provider.dart';
import '../repositories/movie_repository.dart';

class MovieListUseCase implements UseCase<MovieList, MovieListParams> {
  final MovieRepository movieRepository;

  const MovieListUseCase(this.movieRepository);

  @override
  Future<Either<Failure, MovieList>> call(MovieListParams params) async {
    return await movieRepository.list(page: params.page, limit: params.limit);
  }
}

class MovieListParams {
  final int page;
  final int limit;

  MovieListParams({required this.page, required this.limit});
}

final movieListUseCaseProvider = Provider<MovieListUseCase>(
  (ref) {
    return MovieListUseCase(ref.read(movieRepositoryProvider));
  },
);

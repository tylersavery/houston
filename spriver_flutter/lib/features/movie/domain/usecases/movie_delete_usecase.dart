import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../providers/movie_repository_provider.dart';
import '../repositories/movie_repository.dart';

class MovieDeleteUseCase implements UseCase<void, DeleteMovieParams> {
  final MovieRepository movieRepository;

  const MovieDeleteUseCase(this.movieRepository);

  @override
  Future<Either<Failure, void>> call(DeleteMovieParams params) async {
    return await movieRepository.delete(params.id);
  }
}

class DeleteMovieParams {
  final int id;
  const DeleteMovieParams({required this.id});
}

final movieDeleteUseCaseProvider = Provider<MovieDeleteUseCase>(
  (ref) {
    return MovieDeleteUseCase(ref.read(movieRepositoryProvider));
  },
);

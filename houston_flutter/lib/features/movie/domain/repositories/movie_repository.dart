import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import 'package:houston_flutter/core/models/paginated_response.dart';
import '../models/movie_model.dart';

abstract interface class MovieRepository {
  Future<Either<Failure, PaginatedResponse<Movie>>> list({
    required int page,
    required int limit,
  });
  Future<Either<Failure, Movie>> retrieve(int id);
  Future<Either<Failure, Movie>> save(Movie movie);
  Future<Either<Failure, void>> delete(int id);
}

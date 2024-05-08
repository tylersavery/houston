import 'package:fpdart/fpdart.dart';
import 'package:houston_flutter/core/models/paginated_response.dart';
import 'package:houston_flutter/features/movie/data/datasources/movie_datasource_supabase.dart';
import 'package:houston_flutter/features/movie/domain/models/movie_model.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/movie_repository.dart';

class MovieRespositoryImplSupabase implements MovieRepository {
  final MovieDataSourceSupabase dataSource;

  const MovieRespositoryImplSupabase(this.dataSource);

  @override
  Future<Either<Failure, PaginatedResponse<Movie>>> list({
    required int page,
    required int limit,
  }) async {
    try {
      final result = await dataSource.list(page: page, limit: limit);

      return right(
        PaginatedResponse<Movie>(
          status: 200,
          page: result.page,
          count: result.count,
          numPages: result.numPages,
          limit: result.limit,
          results: result.results,
        ),
      );
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Movie>> retrieve(int id) async {
    try {
      return right(await dataSource.retrieve(id));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Movie>> save(Movie movie) async {
    try {
      return right(await dataSource.save(movie));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> delete(int id) async {
    try {
      return right(await dataSource.delete(id));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}

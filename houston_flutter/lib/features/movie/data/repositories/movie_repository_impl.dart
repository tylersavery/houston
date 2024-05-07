import 'package:fpdart/fpdart.dart';
import 'package:houston_flutter/core/models/paginated_response.dart';
import 'package:houston_flutter/features/movie/data/mappers/movie_mapper.dart';
import 'package:houston_flutter/features/movie/domain/models/movie_model.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../datasources/movie_datasource.dart';
import '../../domain/repositories/movie_repository.dart';

class MovieRespositoryImpl implements MovieRepository {
  final MovieDataSource dataSource;

  const MovieRespositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, PaginatedResponse<Movie>>> list({
    required int page,
    required int limit,
  }) async {
    try {
      final movieDtoList = await dataSource.list(page: page, limit: limit);

      return right(
        PaginatedResponse<Movie>(
          page: movieDtoList.page,
          count: movieDtoList.count,
          numPages: movieDtoList.numPages,
          limit: movieDtoList.limit,
          results: MovieMapper.listToModel(movieDtoList.results),
        ),
      );
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Movie>> retrieve(int id) async {
    try {
      final movieDto = await dataSource.retrieve(id);
      return right(MovieMapper.toModel(movieDto));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Movie>> save(Movie movie) async {
    try {
      final movieDto = await dataSource.save(MovieMapper.toDto(movie));
      return right(MovieMapper.toModel(movieDto));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> delete(int id) async {
    try {
      await dataSource.delete(id);
      return right(null);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}

import 'package:fpdart/fpdart.dart';
import 'package:houston_client/houston_client.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../datasources/movie_datasource.dart';
import '../../domain/repositories/movie_repository.dart';

class MovieRespositoryImpl implements MovieRepository {
  final MovieDataSource dataSource;

  const MovieRespositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, MovieList>> list({required int page, required int limit}) async {
    try {
      return right(await dataSource.list(page: page, limit: limit));
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

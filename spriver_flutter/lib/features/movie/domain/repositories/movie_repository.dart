import 'package:fpdart/fpdart.dart';
import 'package:spriver_client/spriver_client.dart';
import 'package:spriver_flutter/core/error/failures.dart';

abstract interface class MovieRepository {
  Future<Either<Failure, MovieList>> list({required int page, required int limit});
  Future<Either<Failure, Movie>> retrieve(int id);
  Future<Either<Failure, Movie>> save(Movie movie);
  Future<Either<Failure, void>> delete(int id);
}

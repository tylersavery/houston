import 'package:fpdart/fpdart.dart';
import 'package:spriver_client/spriver_client.dart';
import 'package:spriver_flutter/core/error/failures.dart';

abstract interface class MovieRepository {
  Future<Either<Failure, List<Movie>>> list();
  Future<Either<Failure, Movie>> retrieve(int id);
  Future<Either<Failure, Movie>> save(Movie movie);
  Future<Either<Failure, void>> delete(int id);
}

import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:spriver_client/spriver_client.dart';
import 'package:spriver_flutter/core/error/exceptions.dart';

abstract interface class MovieDataSource {
  Future<List<Movie>> list();
  Future<Movie> retrieve(int id);
  Future<Movie> save(Movie movie);
  Future<void> delete(int id);
}

class MovieDataSourceImpl implements MovieDataSource {
  final Client client;
  final SessionManager sessionManager;

  MovieDataSourceImpl(this.client, this.sessionManager);

  @override
  Future<List<Movie>> list() async {
    try {
      return await client.movie.list();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Movie> retrieve(int id) async {
    final result = await client.movie.retrieve(id);
    if (result == null) {
      throw const ServerException("Not Found");
    }
    return result;
  }

  @override
  Future<Movie> save(Movie movie) async {
    try {
      return await client.movie.save(movie);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      await client.movie.delete(id);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}

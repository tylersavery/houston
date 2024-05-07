import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:houston_client/houston_client.dart';

import '../../../../core/error/exceptions.dart';

abstract interface class MovieDataSource {
  Future<MovieDTOList> list({required int page, required int limit});
  Future<MovieDTO> retrieve(int id);
  Future<MovieDTO> save(MovieDTO movie);
  Future<void> delete(int id);
}

class MovieDataSourceImpl implements MovieDataSource {
  final Client client;
  final SessionManager sessionManager;

  MovieDataSourceImpl(this.client, this.sessionManager);

  @override
  Future<MovieDTOList> list({required int page, required int limit}) async {
    try {
      return await client.movie.list(page: page, limit: limit, orderBy: 'id');
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<MovieDTO> retrieve(int id) async {
    final result = await client.movie.retrieve(id);
    if (result == null) {
      throw const ServerException("Not Found");
    }
    return result;
  }

  @override
  Future<MovieDTO> save(MovieDTO movie) async {
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

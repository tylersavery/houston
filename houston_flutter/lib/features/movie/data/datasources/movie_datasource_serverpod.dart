import 'package:houston_client/houston_client.dart';
import 'package:houston_flutter/core/models/paginated_response.dart';
import '../../../../core/error/exceptions.dart';
import '../mappers/movie_mapper.dart';
import '../../domain/datasources/movie_datasource.dart';
import '../../domain/models/movie_model.dart';

class MovieDataSourceServerpodImpl implements MovieDataSource {
  final Client client;

  const MovieDataSourceServerpodImpl(this.client);

  @override
  Future<PaginatedResponse<Movie>> list({
    required int page,
    required int limit,
  }) async {
    try {
      final response = await client.movie.list(
        page: page,
        limit: limit,
        orderBy: 'id',
      );
      return PaginatedResponse<Movie>(
        status: 200,
        page: response.page,
        count: response.count,
        numPages: response.numPages,
        limit: response.limit,
        results: MovieMapper.listToModel(response.results),
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Movie> retrieve(int id) async {
    try {
      final result = await client.movie.retrieve(id);
      if (result == null) {
        throw const ServerException("Not Found");
      }
      return MovieMapper.toModel(result);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Movie> save(Movie movie) async {
    try {
      final result = await client.movie.save(MovieMapper.toDto(movie));
      return MovieMapper.toModel(result);
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

import 'package:houston_flutter/core/error/exceptions.dart';
import 'package:houston_flutter/core/models/paginated_response.dart';
import 'package:houston_flutter/core/providers/rest_session_provider.dart';
import 'package:houston_flutter/core/rest_client/rest_client.dart';
import '../../domain/datasources/movie_datasource.dart';
import '../../domain/models/movie_model.dart';

class MovieDataSourceDjangoImpl implements MovieDataSource {
  final RestClient client;
  final RestSession session;

  MovieDataSourceDjangoImpl(this.client, this.session);

  @override
  Future<PaginatedResponse<Movie>> list({
    required int page,
    required int limit,
  }) async {
    try {
      final data = await client.get("/movie/");
      final results = data['results'].map<Movie>((json) => Movie.fromJson(json)).toList();

      return PaginatedResponse<Movie>(
        status: 200,
        page: data['page'],
        count: data['count'],
        numPages: data['num_pages'],
        limit: data['limit'],
        results: results,
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Movie> retrieve(int id) async {
    try {
      final data = await client.get("/movie/$id/");
      return Movie.fromJson(data);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Movie> save(Movie movie) async {
    try {
      if (movie.exists) {
        return Movie.fromJson(await client.patch('/movie/${movie.id}/', data: movie.toJson()));
      } else {
        return Movie.fromJson(await client.post('/movie/', data: movie.toJson()));
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      await client.delete("/movie/$id/");
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}

import 'package:houston_flutter/core/models/paginated_response.dart';
import 'package:houston_flutter/core/providers/rest_session_provider.dart';
import 'package:houston_flutter/core/rest_client/rest_client.dart';
import 'package:houston_flutter/features/movie/domain/datasources/movie_datasource.dart';
import 'package:houston_flutter/features/movie/domain/models/movie_model.dart';

class MovieDataSourceDjangoImpl implements MovieDataSource {
  final RestClient client;
  final RestSession session;

  MovieDataSourceDjangoImpl(this.client, this.session);

  @override
  Future<void> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<PaginatedResponse<Movie>> list({required int page, required int limit}) {
    // TODO: implement list
    throw UnimplementedError();
  }

  @override
  Future<Movie> retrieve(int id) {
    // TODO: implement retrieve
    throw UnimplementedError();
  }

  @override
  Future<Movie> save(Movie movie) {
    // TODO: implement save
    throw UnimplementedError();
  }
}

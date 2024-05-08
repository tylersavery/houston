import 'package:houston_flutter/core/models/paginated_response.dart';
import 'package:houston_flutter/features/movie/domain/models/movie_model.dart';

abstract interface class MovieDataSource {
  Future<PaginatedResponse<Movie>> list({required int page, required int limit});
  Future<Movie> retrieve(int id);
  Future<Movie> save(Movie movie);
  Future<void> delete(int id);
}

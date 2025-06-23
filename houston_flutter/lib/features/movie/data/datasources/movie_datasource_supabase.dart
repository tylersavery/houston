import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:houston_flutter/core/error/exceptions.dart';
import 'package:houston_flutter/core/models/paginated_response.dart';
import '../../domain/datasources/movie_datasource.dart';
import '../../domain/models/movie_model.dart';

class MovieDataSourceSupabaseImpl implements MovieDataSource {
  final SupabaseClient client;

  const MovieDataSourceSupabaseImpl(this.client);

  static String defaultSelect = "*";

  @override
  Future<PaginatedResponse<Movie>> list({
    required int page,
    required int limit,
  }) async {
    try {
      final result = await client
          .from("movie")
          .select(defaultSelect)
          .range((page - 1) * limit, limit * page)
          .count(CountOption.exact);

      return PaginatedResponse<Movie>(
        results:
            result.data.map<Movie>((item) => Movie.fromJson(item)).toList(),
        status: 200,
        count: result.count,
        page: page,
        limit: limit,
        numPages: (result.count / limit).ceil(),
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Movie> retrieve(int id) async {
    try {
      final result =
          await client
              .from("movie")
              .select(defaultSelect)
              .eq('id', id)
              .single();
      return Movie.fromJson(result);
    } catch (e) {
      throw const ServerException("Not Found");
    }
  }

  @override
  Future<Movie> save(Movie movie) async {
    try {
      if (movie.id == null) {
        final result =
            await client
                .from("movie")
                .insert(movie.toJson())
                .select(defaultSelect)
                .single();
        return Movie.fromJson(result);
      } else {
        final result =
            await client
                .from("movie")
                .update(movie.toJson())
                .match({"id": movie.id!})
                .select(defaultSelect)
                .single();
        return Movie.fromJson(result);
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      await client.from("movie").delete().match({"id": id});
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}

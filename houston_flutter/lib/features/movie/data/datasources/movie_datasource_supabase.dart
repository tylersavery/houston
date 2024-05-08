import 'package:houston_flutter/core/error/exceptions.dart';
import 'package:houston_flutter/core/models/paginated_response.dart';
import 'package:houston_flutter/features/movie/domain/models/movie_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class MovieDataSourceSupabase {
  Future<PaginatedResponse<Movie>> list({required int page, required int limit});
  Future<Movie> retrieve(int id);
  Future<Movie> save(Movie movie);
  Future<void> delete(int id);
}

class MovieDataSourceSupabaseImpl implements MovieDataSourceSupabase {
  final SupabaseClient client;

  MovieDataSourceSupabaseImpl(this.client);

  @override
  Future<PaginatedResponse<Movie>> list({required int page, required int limit}) async {
    try {
      final result = await client
          .from("movie")
          .select(
            "*",
          )
          .range((page - 1) * limit, limit * page)
          .count(CountOption.exact);

      return PaginatedResponse<Movie>(
        results: result.data.map<Movie>((item) => Movie.fromJson(item)).toList(),
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
      final result = await client.from("movie").select("*").eq('id', id).single();
      return Movie.fromJson(result);
    } catch (e) {
      throw const ServerException("Not Found");
    }
  }

  @override
  Future<Movie> save(Movie movie) async {
    try {
      if (movie.id == null) {
        final result = await client.from("movie").insert(movie.toJson()).select("*").single();
        return Movie.fromJson(result);
      } else {
        final result = await client.from("movie").update(movie.toJson()).match({"id": movie.id}).select("*").single();
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

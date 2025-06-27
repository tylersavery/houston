import 'package:houston_flutter/core/error/exceptions.dart';
import 'package:houston_flutter/core/models/paginated_response.dart';
import 'package:houston_flutter/core/providers/rest_session_provider.dart';
import 'package:houston_flutter/core/rest_client/rest_client.dart';
import '../../domain/datasources/profile_datasource.dart';
import '../../domain/models/profile_model.dart';

class MovieDataSourceDjangoImpl implements ProfileDataSource {
  final RestClient client;
  final RestSession session;

  MovieDataSourceDjangoImpl(this.client, this.session);

  @override
  Future<PaginatedResponse<Profile>> list({
    required int page,
    required int limit,
  }) async {
    try {
      final Map<String, dynamic> params = {};

      final response = await client.get(
        "/profile/",
        orderBy: 'id',
        data: params,
      );
      final results =
          response['results']
              .map<Profile>((json) => Profile.fromJson(json))
              .toList();

      return PaginatedResponse<Profile>(
        status: 200,
        page: response['page'],
        count: response['count'],
        numPages: response['num_pages'],
        limit: response['limit'],
        results: results,
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Profile> retrieve(int id) async {
    try {
      final response = await client.get("/profile/$id/");
      return Profile.fromJson(response);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Profile> save(Profile profile) async {
    try {
      if (profile.exists) {
        return Profile.fromJson(
          await client.patch('/movie/${profile.id}/', data: profile.toJson()),
        );
      } else {
        return Profile.fromJson(
          await client.post('/movie/', data: profile.toJson()),
        );
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

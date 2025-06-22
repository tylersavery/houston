import 'package:houston_flutter/core/error/exceptions.dart';
import 'package:houston_flutter/core/models/paginated_response.dart';
import 'package:houston_flutter/core/providers/rest_session_provider.dart';
import 'package:houston_flutter/core/rest_client/rest_client.dart';
import '../../domain/datasources/game_datasource.dart';
import '../../domain/models/game_model.dart';

class GameDataSourceDjangoImpl implements GameDataSource {
  final RestClient client;
  final RestSession session;

  GameDataSourceDjangoImpl(this.client, this.session);

  @override
  Future<PaginatedResponse<Game>> list({
    required int page,
    required int limit,
    String? gameSystemUid,
  }) async {
    try {
      final Map<String, dynamic> params = {'game_system': gameSystemUid};

      final response = await client.get("/game/", orderBy: 'id', data: params);
      final results =
          response['results'].map<Game>((json) => Game.fromJson(json)).toList();

      return PaginatedResponse<Game>(
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
  Future<Game> retrieve(int id) async {
    try {
      final response = await client.get("/game/$id/");
      return Game.fromJson(response);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Game> save(Game game) async {
    try {
      if (game.exists) {
        return Game.fromJson(
          await client.patch('/game/${game.id}/', data: game.toJson()),
        );
      } else {
        return Game.fromJson(await client.post('/game/', data: game.toJson()));
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      await client.delete("/game/$id/");
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}

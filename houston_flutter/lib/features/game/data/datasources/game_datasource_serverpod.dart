import 'package:houston_client/houston_client.dart';
import 'package:houston_flutter/core/models/paginated_response.dart';
import '../../../../core/error/exceptions.dart';
import '../mappers/game_mapper.dart';
import '../../domain/datasources/game_datasource.dart';
import '../../domain/models/game_model.dart';

class GameDataSourceServerpodImpl implements GameDataSource {
  final Client client;

  const GameDataSourceServerpodImpl(this.client);

  @override
  Future<PaginatedResponse<Game>> list({required int page, required int limit, String? gameSystemUid}) async {
    try {
      final response = await client.game.list(page: page, limit: limit, orderBy: 'id', gameSystemUid: gameSystemUid);
      return PaginatedResponse<Game>(
        status: 200,
        page: response.page,
        count: response.count,
        numPages: response.numPages,
        limit: response.limit,
        results: GameMapper.listToModel(response.results),
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Game> retrieve(int id) async {
    try {
      final result = await client.game.retrieve(id);
      if (result == null) {
        throw const ServerException("Not Found");
      }
      return GameMapper.toModel(result);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Game> save(Game game) async {
    try {
      final result = await client.game.save(GameMapper.toDto(game));
      return GameMapper.toModel(result);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      await client.game.delete(id);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}

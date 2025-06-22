import 'package:houston_client/houston_client.dart';
import 'package:houston_flutter/core/models/paginated_response.dart';
import '../../../../core/error/exceptions.dart';
import '../mappers/game_system_mapper.dart';
import '../../domain/datasources/game_system_datasource.dart';
import '../../domain/models/game_system_model.dart';

class GameSystemDataSourceServerpodImpl implements GameSystemDataSource {
  final Client client;

  const GameSystemDataSourceServerpodImpl(this.client);

  @override
  Future<PaginatedResponse<GameSystem>> list({
    required int page,
    required int limit,
  }) async {
    try {
      final response = await client.gameSystem.list(
        page: page,
        limit: limit,
        orderBy: 'id',
      );
      return PaginatedResponse<GameSystem>(
        status: 200,
        page: response.page,
        count: response.count,
        numPages: response.numPages,
        limit: response.limit,
        results: GameSystemMapper.listToModel(response.results),
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<GameSystem> retrieve(int id) async {
    try {
      final result = await client.gameSystem.retrieve(id);
      if (result == null) {
        throw const ServerException("Not Found");
      }
      return GameSystemMapper.toModel(result);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<GameSystem> save(GameSystem gameSystem) async {
    try {
      final result = await client.gameSystem.save(
        GameSystemMapper.toDto(gameSystem),
      );
      return GameSystemMapper.toModel(result);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      await client.gameSystem.delete(id);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}

import 'package:houston_flutter/core/models/paginated_response.dart';
import '../models/game_system_model.dart';

abstract interface class GameSystemDataSource {
  Future<PaginatedResponse<GameSystem>> list({required int page, required int limit, });
  Future<GameSystem> retrieve(int id);
  Future<GameSystem> save(GameSystem gameSystem);
  Future<void> delete(int id);
}
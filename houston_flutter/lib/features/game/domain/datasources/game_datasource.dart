import 'package:houston_flutter/core/models/paginated_response.dart';
import '../models/game_model.dart';

abstract interface class GameDataSource {
  Future<PaginatedResponse<Game>> list({required int page, required int limit, String? gameSystemUid});
  Future<Game> retrieve(int id);
  Future<Game> save(Game game);
  Future<void> delete(int id);
}
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:houston_flutter/core/error/exceptions.dart';
import 'package:houston_flutter/core/models/paginated_response.dart';
import '../../domain/datasources/game_system_datasource.dart';
import '../../domain/models/game_system_model.dart';

class GameSystemDataSourceSupabaseImpl implements GameSystemDataSource {
  final SupabaseClient client;

  const GameSystemDataSourceSupabaseImpl(this.client);

  static String defaultSelect = "*";

  @override
  Future<PaginatedResponse<GameSystem>> list({
    required int page,
    required int limit,
  }) async {
    try {
      final result = await client
          .from("game_system")
          .select(defaultSelect)
          .range((page - 1) * limit, limit * page)
          .count(CountOption.exact);

      return PaginatedResponse<GameSystem>(
        results:
            result.data
                .map<GameSystem>((item) => GameSystem.fromJson(item))
                .toList(),
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
  Future<GameSystem> retrieve(int id) async {
    try {
      final result =
          await client
              .from("game_system")
              .select(defaultSelect)
              .eq('id', id)
              .single();
      return GameSystem.fromJson(result);
    } catch (e) {
      throw const ServerException("Not Found");
    }
  }

  @override
  Future<GameSystem> save(GameSystem gameSystem) async {
    try {
      if (gameSystem.id == null) {
        final result =
            await client
                .from("game_system")
                .insert(gameSystem.toJson())
                .select(defaultSelect)
                .single();
        return GameSystem.fromJson(result);
      } else {
        final result =
            await client
                .from("game_system")
                .update(gameSystem.toJson())
                .match({"id": gameSystem.id})
                .select(defaultSelect)
                .single();
        return GameSystem.fromJson(result);
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      await client.from("game_system").delete().match({"id": id});
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}

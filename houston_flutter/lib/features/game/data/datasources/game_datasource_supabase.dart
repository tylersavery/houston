import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:houston_flutter/core/error/exceptions.dart';
import 'package:houston_flutter/core/models/paginated_response.dart';
import '../../domain/datasources/game_datasource.dart';
import '../../domain/models/game_model.dart';
import '../../../game_system/data/datasources/game_system_datasource_supabase.dart';

class GameDataSourceSupabaseImpl implements GameDataSource {
  final SupabaseClient client;

  const GameDataSourceSupabaseImpl(this.client);

  static String defaultSelect =
      "*,game_system(${GameSystemDataSourceSupabaseImpl.defaultSelect})";

  @override
  Future<PaginatedResponse<Game>> list(
      {required int page, required int limit, String? gameSystemUid}) async {
    try {
      late final PostgrestResponse<List<Map<String, dynamic>>> result;

      if (gameSystemUid != null) {
        result = await client
            .from("game")
            .select(defaultSelect)
            .filter('game_system.uid', 'eq', gameSystemUid)
            .range((page - 1) * limit, limit * page)
            .count(CountOption.exact);
      } else {
        result = await client
            .from("game")
            .select(defaultSelect)
            .range((page - 1) * limit, limit * page)
            .count(CountOption.exact);
      }

      return PaginatedResponse<Game>(
        results: result.data.map<Game>((item) => Game.fromJson(item)).toList(),
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
  Future<Game> retrieve(int id) async {
    try {
      final result =
          await client.from("game").select(defaultSelect).eq('id', id).single();
      return Game.fromJson(result);
    } catch (e) {
      throw const ServerException("Not Found");
    }
  }

  @override
  Future<Game> save(Game game) async {
    try {
      if (game.id == null) {
        final result = await client
            .from("game")
            .insert(game.toJson())
            .select(defaultSelect)
            .single();
        return Game.fromJson(result);
      } else {
        final result = await client
            .from("game")
            .update(game.toJson())
            .match({"id": game.id})
            .select(defaultSelect)
            .single();
        return Game.fromJson(result);
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      await client.from("game").delete().match({"id": id});
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}

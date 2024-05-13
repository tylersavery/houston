import 'package:serverpod/serverpod.dart';
import 'package:houston_server/src/generated/protocol.dart';
import 'package:houston_server/src/utils/strings.dart';

class GameEndpoint extends Endpoint {
  Future<GameDTOList> list(
    Session session, {
    required int page,
    required int limit,
    String? orderBy,
    String? gameSystemUid,
  }) async {
    final count = await GameDTO.db.count(session);

    final results = await GameDTO.db.find(
      session,
      limit: limit,
      offset: (page * limit) - limit,
      where: (t) {
        if (gameSystemUid != null) {
          return t.gameSystem.uid.equals(gameSystemUid);
        }
        return t.id.notEquals(0);
      },
      orderBy: orderBy != null
          ? (t) {
              switch (orderBy.replaceAll("-", "")) {
                case 'createdAt':
                  return t.createdAt;
                case 'price':
                  return t.price;
                case 'players':
                  return t.players;

                default:
                  return t.id;
              }
            }
          : null,
      orderDescending: orderBy != null ? orderBy.contains('-') : false,
      include: GameDTO.include(
        gameSystem: GameSystemDTO.include(),
      ),
    );

    return GameDTOList(
      count: count,
      numPages: (count / limit).ceil(),
      page: page,
      results: results,
      limit: limit,
    );
  }

  Future<GameDTO?> retrieve(Session session, int id) async {
    return await GameDTO.db.findById(
      session,
      id,
      include: GameDTO.include(
        gameSystem: GameSystemDTO.include(),
      ),
    );
  }

  Future<GameDTO> save(Session session, GameDTO game) async {
    if (game.id != null) {
      final existingGame = await GameDTO.db.findById(
        session,
        game.id!,
        include: GameDTO.include(
          gameSystem: GameSystemDTO.include(),
        ),
      );

      if (existingGame != null) {
        return await GameDTO.db.updateRow(
          session,
          game.copyWith(
            uid: existingGame.uid,
            createdAt: existingGame.createdAt,
          ),
        );
      }
    }

    final uid = await _uniqueUid(session);
    final newGame = await GameDTO.db.insertRow(
      session,
      game.copyWith(uid: uid, createdAt: DateTime.now()),
    );

    return newGame.copyWith(gameSystem: game.gameSystem);
  }

  Future<void> delete(Session session, int id) async {
    await GameDTO.db.deleteWhere(session, where: (row) => row.id.equals(id));
  }

  Future<String> _uniqueUid(Session session) async {
    late String uid;

    while (true) {
      uid = generateRandomString(8);
      final unique = (await GameDTO.db.findFirstRow(session, where: (row) => row.uid.equals(uid))) == null;
      if (unique) {
        return uid;
      }
    }
  }
}

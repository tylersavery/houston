import 'package:serverpod/serverpod.dart';
import 'package:houston_server/src/generated/protocol.dart';
import 'package:houston_server/src/utils/strings.dart';

class GameSystemEndpoint extends Endpoint {
  Future<GameSystemDTOList> list(
    Session session, {
    required int page,
    required int limit,
    String? orderBy,
  }) async {
    final count = await GameSystemDTO.db.count(session);

    final results = await GameSystemDTO.db.find(
      session,
      limit: limit,
      offset: (page * limit) - limit,
      orderBy: orderBy != null
          ? (t) {
              switch (orderBy.replaceAll("-", "")) {
                case 'createdAt':
                  return t.createdAt;
                case 'price':
	return t.price;
                
                default:
                  return t.id;
              }
            }
          : null,
      orderDescending: orderBy != null ? orderBy.contains('-') : false,
    );

    return GameSystemDTOList(
      count: count,
      numPages: (count / limit).ceil(),
      page: page,
      results: results,
      limit: limit,
    );
  }

  Future<GameSystemDTO?> retrieve(Session session, int id) async {
    return await GameSystemDTO.db.findById(session, id);
  }

  Future<GameSystemDTO> save(Session session, GameSystemDTO gameSystem) async {
    if (gameSystem.id != null) {
      final existingGameSystem = await GameSystemDTO.db.findById(session, gameSystem.id!);

      if (existingGameSystem != null) {
        return await GameSystemDTO.db.updateRow(
          session,
          gameSystem.copyWith(
            uid: existingGameSystem.uid,
            createdAt: existingGameSystem.createdAt,
          ),
        );
      }
    }

    final uid = await _uniqueUid(session);
    return await GameSystemDTO.db.insertRow(
      session,
      gameSystem.copyWith(uid: uid, createdAt: DateTime.now()),
    );
  }

  Future<void> delete(Session session, int id) async {
    await GameSystemDTO.db.deleteWhere(session, where: (row) => row.id.equals(id));
  }

  Future<String> _uniqueUid(Session session) async {
    late String uid;

    while (true) {
      uid = generateRandomString(8);
      final unique = (await GameSystemDTO.db.findFirstRow(session, where: (row) => row.uid.equals(uid))) == null;
      if (unique) {
        return uid;
      }
    }
  }
}

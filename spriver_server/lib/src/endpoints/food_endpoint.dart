import 'package:serverpod/serverpod.dart';
import 'package:spriver_server/src/generated/protocol.dart';
import 'package:spriver_server/src/utils/strings.dart';

class FoodEndpoint extends Endpoint {
  Future<FoodList> list(
    Session session, {
    required int page,
    required int limit,
    String? orderBy,
  }) async {
    final count = await Food.db.count(session);

    final results = await Food.db.find(
      session,
      limit: limit,
      offset: (page * limit) - limit,
      orderBy: orderBy != null
          ? (t) {
              switch (orderBy.replaceAll("-", "")) {
                case 'createdAt':
                  return t.createdAt;
                case 'updatedAt':
                  return t.updatedAt;
                default:
                  return t.id;
              }
            }
          : null,
      orderDescending: orderBy != null ? orderBy.contains('-') : false,
    );

    return FoodList(
      count: count,
      numPages: (count / limit).ceil(),
      page: page,
      results: results,
      limit: limit,
    );
  }

  Future<Food?> retrieve(Session session, int id) async {
    return await Food.db.findById(session, id);
  }

  Future<Food> save(Session session, Food food) async {
    if (food.id != null) {
      final existingFood = await Food.db.findById(session, food.id!);

      if (existingFood != null) {
        return await Food.db.updateRow(
          session,
          food.copyWith(
            uid: existingFood.uid,
            createdAt: existingFood.createdAt,
            updatedAt: DateTime.now(),
          ),
        );
      }
    }

    final uid = await _uniqueUid(session);
    return await Food.db.insertRow(
      session,
      food.copyWith(uid: uid, createdAt: DateTime.now(), updatedAt: DateTime.now()),
    );
  }

  Future<void> delete(Session session, int id) async {
    await Food.db.deleteWhere(session, where: (row) => row.id.equals(id));
  }

  Future<String> _uniqueUid(Session session) async {
    late String uid;

    while (true) {
      uid = generateRandomString(8);
      final unique = (await Food.db.findFirstRow(session, where: (row) => row.uid.equals(uid))) == null;
      if (unique) {
        return uid;
      }
    }
  }
}

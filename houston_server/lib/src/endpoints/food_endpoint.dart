import 'package:serverpod/serverpod.dart';
import 'package:houston_server/src/generated/protocol.dart';
import 'package:houston_server/src/utils/strings.dart';

class FoodEndpoint extends Endpoint {
  Future<FoodDTOList> list(
    Session session, {
    required int page,
    required int limit,
    String? orderBy,
  }) async {
    final count = await FoodDTO.db.count(session);

    final results = await FoodDTO.db.find(
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
                case 'price':
                  return t.price;
                case 'calories':
                  return t.calories;

                default:
                  return t.id;
              }
            }
          : null,
      orderDescending: orderBy != null ? orderBy.contains('-') : false,
    );

    return FoodDTOList(
      count: count,
      numPages: (count / limit).ceil(),
      page: page,
      results: results,
      limit: limit,
    );
  }

  Future<FoodDTO?> retrieve(Session session, int id) async {
    return await FoodDTO.db.findById(session, id);
  }

  Future<FoodDTO> save(Session session, FoodDTO food) async {
    if (food.id != null) {
      final existingFood = await FoodDTO.db.findById(session, food.id!);

      if (existingFood != null) {
        return await FoodDTO.db.updateRow(
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
    return await FoodDTO.db.insertRow(
      session,
      food.copyWith(
          uid: uid, createdAt: DateTime.now(), updatedAt: DateTime.now()),
    );
  }

  Future<void> delete(Session session, int id) async {
    await FoodDTO.db.deleteWhere(session, where: (row) => row.id.equals(id));
  }

  Future<String> _uniqueUid(Session session) async {
    late String uid;

    while (true) {
      uid = generateRandomString(8);
      final unique = (await FoodDTO.db
              .findFirstRow(session, where: (row) => row.uid.equals(uid))) ==
          null;
      if (unique) {
        return uid;
      }
    }
  }
}

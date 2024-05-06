import 'package:serverpod/serverpod.dart';
import 'package:spriver_server/src/generated/protocol.dart';

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
                case 'id':
                  return t.id;
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
    return await (food.id != null ? Food.db.updateRow(session, food) : Food.db.insertRow(session, food));
  }

  Future<void> delete(Session session, int id) async {
    await Food.db.deleteWhere(session, where: (row) => row.id.equals(id));
  }
}

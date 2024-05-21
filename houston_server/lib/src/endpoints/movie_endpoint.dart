import 'package:serverpod/serverpod.dart';
import 'package:houston_server/src/generated/protocol.dart';
import 'package:houston_server/src/utils/strings.dart';

class MovieEndpoint extends Endpoint {
  Future<MovieDTOList> list(
    Session session, {
    required int page,
    required int limit,
    String? orderBy,
  }) async {
    final count = await MovieDTO.db.count(session);

    final results = await MovieDTO.db.find(
      session,
      limit: limit,
      offset: (page * limit) - limit,
      orderBy: orderBy != null
          ? (t) {
              switch (orderBy.replaceAll("-", "")) {
                case 'createdAt':
                  return t.createdAt;

                default:
                  return t.id;
              }
            }
          : null,
      orderDescending: orderBy != null ? orderBy.contains('-') : false,
    );

    return MovieDTOList(
      count: count,
      numPages: (count / limit).ceil(),
      page: page,
      results: results,
      limit: limit,
    );
  }

  Future<MovieDTO?> retrieve(Session session, int id) async {
    return await MovieDTO.db.findById(
      session,
      id,
    );
  }

  Future<MovieDTO> save(Session session, MovieDTO movie) async {
    if (movie.id != null) {
      final existingMovie = await MovieDTO.db.findById(
        session,
        movie.id!,
      );

      if (existingMovie != null) {
        return await MovieDTO.db.updateRow(
          session,
          movie.copyWith(
            uid: existingMovie.uid,
            createdAt: existingMovie.createdAt,
          ),
        );
      }
    }

    final uid = await _uniqueUid(session);
    final newMovie = await MovieDTO.db.insertRow(
      session,
      movie.copyWith(uid: uid, createdAt: DateTime.now()),
    );

    return newMovie.copyWith();
  }

  Future<void> delete(Session session, int id) async {
    await MovieDTO.db.deleteWhere(session, where: (row) => row.id.equals(id));
  }

  Future<String> _uniqueUid(Session session) async {
    late String uid;

    while (true) {
      uid = generateRandomString(8);
      final unique = (await MovieDTO.db
              .findFirstRow(session, where: (row) => row.uid.equals(uid))) ==
          null;
      if (unique) {
        return uid;
      }
    }
  }
}

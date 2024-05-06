import 'package:serverpod/serverpod.dart';
import 'package:spriver_server/src/generated/protocol.dart';
import 'package:spriver_server/src/utils/strings.dart';

class MovieEndpoint extends Endpoint {
  Future<MovieList> list(
    Session session, {
    required int page,
    required int limit,
    String? orderBy,
  }) async {
    final count = await Movie.db.count(session);

    final results = await Movie.db.find(
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

    return MovieList(
      count: count,
      numPages: (count / limit).ceil(),
      page: page,
      results: results,
      limit: limit,
    );
  }

  Future<Movie?> retrieve(Session session, int id) async {
    return await Movie.db.findById(session, id);
  }

  Future<Movie> save(Session session, Movie movie) async {
    if (movie.id != null) {
      final existingMovie = await Movie.db.findById(session, movie.id!);

      if (existingMovie != null) {
        return await Movie.db.updateRow(
          session,
          movie.copyWith(
            uid: existingMovie.uid,
            createdAt: existingMovie.createdAt,
            updatedAt: DateTime.now(),
          ),
        );
      }
    }

    final uid = await _uniqueUid(session);
    return await Movie.db.insertRow(
      session,
      movie.copyWith(uid: uid, createdAt: DateTime.now(), updatedAt: DateTime.now()),
    );
  }

  Future<void> delete(Session session, int id) async {
    await Movie.db.deleteWhere(session, where: (row) => row.id.equals(id));
  }

  Future<String> _uniqueUid(Session session) async {
    late String uid;

    while (true) {
      uid = generateRandomString(8);
      final unique = (await Movie.db.findFirstRow(session, where: (row) => row.uid.equals(uid))) == null;
      if (unique) {
        return uid;
      }
    }
  }
}

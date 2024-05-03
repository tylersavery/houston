import 'package:serverpod/serverpod.dart';
import 'package:spriver_server/src/generated/protocol.dart';

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
                case 'title':
                  return t.title;
                case 'year':
                  return t.year;
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
    return await (movie.id != null ? Movie.db.updateRow(session, movie) : Movie.db.insertRow(session, movie));
  }

  Future<void> delete(Session session, int id) async {
    await Movie.db.deleteWhere(session, where: (row) => row.id.equals(id));
  }
}

import 'package:serverpod/serverpod.dart';
import 'package:houston_server/src/generated/protocol.dart';

class ProfileEndpoint extends Endpoint {
  Future<ProfileDTOList> list(
    Session session, {
    required int page,
    required int limit,
    String? orderBy,
  }) async {
    final count = await ProfileDTO.db.count(session);

    final results = await ProfileDTO.db.find(
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

    return ProfileDTOList(
      count: count,
      numPages: (count / limit).ceil(),
      page: page,
      results: results,
      limit: limit,
    );
  }

  Future<ProfileDTO?> retrieve(Session session, int id) async {
    return await ProfileDTO.db.findById(session, id);
  }

  Future<ProfileDTO?> retrieveByUserId(Session session, int userId) async {
    return await ProfileDTO.db
        .findFirstRow(session, where: (row) => row.userId.equals(userId));
  }

  Future<ProfileDTO> save(Session session, ProfileDTO profile) async {
    //TODO auth check
    if (profile.id == null) {
      throw Exception("Profile id is null");
    }

    final existingProfile = await ProfileDTO.db.findById(session, profile.id!);
    if (existingProfile == null) {
      throw Exception("Profile doesn't exist");
    }

    return await ProfileDTO.db.updateRow(
      session,
      profile.copyWith(
        uid: existingProfile.uid,
        createdAt: existingProfile.createdAt,
      ),
    );
  }

  Future<void> delete(Session session, int id) async {
    await ProfileDTO.db.deleteWhere(session, where: (row) => row.id.equals(id));
  }
}

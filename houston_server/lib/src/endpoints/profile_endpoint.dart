import 'package:serverpod/serverpod.dart';
import 'package:houston_server/src/generated/protocol.dart';
import 'package:houston_server/src/utils/strings.dart';
import 'package:serverpod_auth_server/module.dart';

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
    return await ProfileDTO.db.findFirstRow(session, where: (row) => row.userId.equals(userId));
  }

  Future<ProfileDTO> createFromUser(Session session, UserInfo userInfo) async {
    if (userInfo.id == null) {
      throw Exception("User ID is null");
    }

    final existingProfile = await ProfileDTO.db.findFirstRow(session, where: (row) => row.userId.equals(userInfo.id!));

    if (existingProfile != null) {
      return existingProfile;
    }

    final uid = await _uniqueUid(session);

    final profile = await ProfileDTO.db.insertRow(
      session,
      ProfileDTO(
        userId: userInfo.id!,
        uid: uid,
        username: userInfo.userName,
        firstName: '',
        lastName: '',
        avatar: userInfo.imageUrl ?? '',
        createdAt: DateTime.now(),
      ),
    );

    return profile;
  }

  Future<ProfileDTO> save(Session session, ProfileDTO profile) async {
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

  Future<String> _uniqueUid(Session session) async {
    late String uid;

    while (true) {
      uid = generateRandomString(8);
      final unique = (await ProfileDTO.db.findFirstRow(session, where: (row) => row.uid.equals(uid))) == null;
      if (unique) {
        return uid;
      }
    }
  }
}

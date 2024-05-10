/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class ProfileDTO extends _i1.SerializableEntity {
  ProfileDTO._({
    this.id,
    required this.uid,
    required this.userId,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    this.bio,
    required this.createdAt,
  });

  factory ProfileDTO({
    int? id,
    required String uid,
    required int userId,
    required String username,
    required String firstName,
    required String lastName,
    required String avatar,
    String? bio,
    required DateTime createdAt,
  }) = _ProfileDTOImpl;

  factory ProfileDTO.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return ProfileDTO(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      uid: serializationManager.deserialize<String>(jsonSerialization['uid']),
      userId:
          serializationManager.deserialize<int>(jsonSerialization['userId']),
      username: serializationManager
          .deserialize<String>(jsonSerialization['username']),
      firstName: serializationManager
          .deserialize<String>(jsonSerialization['firstName']),
      lastName: serializationManager
          .deserialize<String>(jsonSerialization['lastName']),
      avatar:
          serializationManager.deserialize<String>(jsonSerialization['avatar']),
      bio: serializationManager.deserialize<String?>(jsonSerialization['bio']),
      createdAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String uid;

  int userId;

  String username;

  String firstName;

  String lastName;

  String avatar;

  String? bio;

  DateTime createdAt;

  ProfileDTO copyWith({
    int? id,
    String? uid,
    int? userId,
    String? username,
    String? firstName,
    String? lastName,
    String? avatar,
    String? bio,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'uid': uid,
      'userId': userId,
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'avatar': avatar,
      if (bio != null) 'bio': bio,
      'createdAt': createdAt.toJson(),
    };
  }
}

class _Undefined {}

class _ProfileDTOImpl extends ProfileDTO {
  _ProfileDTOImpl({
    int? id,
    required String uid,
    required int userId,
    required String username,
    required String firstName,
    required String lastName,
    required String avatar,
    String? bio,
    required DateTime createdAt,
  }) : super._(
          id: id,
          uid: uid,
          userId: userId,
          username: username,
          firstName: firstName,
          lastName: lastName,
          avatar: avatar,
          bio: bio,
          createdAt: createdAt,
        );

  @override
  ProfileDTO copyWith({
    Object? id = _Undefined,
    String? uid,
    int? userId,
    String? username,
    String? firstName,
    String? lastName,
    String? avatar,
    Object? bio = _Undefined,
    DateTime? createdAt,
  }) {
    return ProfileDTO(
      id: id is int? ? id : this.id,
      uid: uid ?? this.uid,
      userId: userId ?? this.userId,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      avatar: avatar ?? this.avatar,
      bio: bio is String? ? bio : this.bio,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

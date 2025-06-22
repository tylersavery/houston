/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class ProfileDTO implements _i1.SerializableModel {
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

  factory ProfileDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return ProfileDTO(
      id: jsonSerialization['id'] as int?,
      uid: jsonSerialization['uid'] as String,
      userId: jsonSerialization['userId'] as int,
      username: jsonSerialization['username'] as String,
      firstName: jsonSerialization['firstName'] as String,
      lastName: jsonSerialization['lastName'] as String,
      avatar: jsonSerialization['avatar'] as String,
      bio: jsonSerialization['bio'] as String?,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
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

  /// Returns a shallow copy of this [ProfileDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
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

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
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

  /// Returns a shallow copy of this [ProfileDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
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

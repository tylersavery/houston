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

abstract class MovieDTO implements _i1.SerializableModel {
  MovieDTO._({
    this.id,
    required this.uid,
    required this.title,
    required this.year,
    required this.imageUrl,
    required this.createdAt,
  });

  factory MovieDTO({
    int? id,
    required String uid,
    required String title,
    required int year,
    required String imageUrl,
    required DateTime createdAt,
  }) = _MovieDTOImpl;

  factory MovieDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return MovieDTO(
      id: jsonSerialization['id'] as int?,
      uid: jsonSerialization['uid'] as String,
      title: jsonSerialization['title'] as String,
      year: jsonSerialization['year'] as int,
      imageUrl: jsonSerialization['imageUrl'] as String,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String uid;

  String title;

  int year;

  String imageUrl;

  DateTime createdAt;

  /// Returns a shallow copy of this [MovieDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  MovieDTO copyWith({
    int? id,
    String? uid,
    String? title,
    int? year,
    String? imageUrl,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'uid': uid,
      'title': title,
      'year': year,
      'imageUrl': imageUrl,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MovieDTOImpl extends MovieDTO {
  _MovieDTOImpl({
    int? id,
    required String uid,
    required String title,
    required int year,
    required String imageUrl,
    required DateTime createdAt,
  }) : super._(
          id: id,
          uid: uid,
          title: title,
          year: year,
          imageUrl: imageUrl,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [MovieDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  MovieDTO copyWith({
    Object? id = _Undefined,
    String? uid,
    String? title,
    int? year,
    String? imageUrl,
    DateTime? createdAt,
  }) {
    return MovieDTO(
      id: id is int? ? id : this.id,
      uid: uid ?? this.uid,
      title: title ?? this.title,
      year: year ?? this.year,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

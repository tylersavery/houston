/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class Movie extends _i1.SerializableEntity {
  Movie._({
    this.id,
    required this.uid,
    required this.title,
    required this.year,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Movie({
    int? id,
    required String uid,
    required String title,
    required int year,
    required String imageUrl,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _MovieImpl;

  factory Movie.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Movie(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      uid: serializationManager.deserialize<String>(jsonSerialization['uid']),
      title:
          serializationManager.deserialize<String>(jsonSerialization['title']),
      year: serializationManager.deserialize<int>(jsonSerialization['year']),
      imageUrl: serializationManager
          .deserialize<String>(jsonSerialization['imageUrl']),
      createdAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['createdAt']),
      updatedAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['updatedAt']),
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

  DateTime updatedAt;

  Movie copyWith({
    int? id,
    String? uid,
    String? title,
    int? year,
    String? imageUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
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
      'updatedAt': updatedAt.toJson(),
    };
  }
}

class _Undefined {}

class _MovieImpl extends Movie {
  _MovieImpl({
    int? id,
    required String uid,
    required String title,
    required int year,
    required String imageUrl,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super._(
          id: id,
          uid: uid,
          title: title,
          year: year,
          imageUrl: imageUrl,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  @override
  Movie copyWith({
    Object? id = _Undefined,
    String? uid,
    String? title,
    int? year,
    String? imageUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Movie(
      id: id is int? ? id : this.id,
      uid: uid ?? this.uid,
      title: title ?? this.title,
      year: year ?? this.year,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

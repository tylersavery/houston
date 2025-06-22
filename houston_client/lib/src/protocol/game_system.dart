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

abstract class GameSystemDTO implements _i1.SerializableModel {
  GameSystemDTO._({
    this.id,
    required this.uid,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.createdAt,
  });

  factory GameSystemDTO({
    int? id,
    required String uid,
    required String name,
    required double price,
    required String description,
    required String imageUrl,
    required DateTime createdAt,
  }) = _GameSystemDTOImpl;

  factory GameSystemDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return GameSystemDTO(
      id: jsonSerialization['id'] as int?,
      uid: jsonSerialization['uid'] as String,
      name: jsonSerialization['name'] as String,
      price: (jsonSerialization['price'] as num).toDouble(),
      description: jsonSerialization['description'] as String,
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

  String name;

  double price;

  String description;

  String imageUrl;

  DateTime createdAt;

  /// Returns a shallow copy of this [GameSystemDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GameSystemDTO copyWith({
    int? id,
    String? uid,
    String? name,
    double? price,
    String? description,
    String? imageUrl,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'uid': uid,
      'name': name,
      'price': price,
      'description': description,
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

class _GameSystemDTOImpl extends GameSystemDTO {
  _GameSystemDTOImpl({
    int? id,
    required String uid,
    required String name,
    required double price,
    required String description,
    required String imageUrl,
    required DateTime createdAt,
  }) : super._(
          id: id,
          uid: uid,
          name: name,
          price: price,
          description: description,
          imageUrl: imageUrl,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [GameSystemDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GameSystemDTO copyWith({
    Object? id = _Undefined,
    String? uid,
    String? name,
    double? price,
    String? description,
    String? imageUrl,
    DateTime? createdAt,
  }) {
    return GameSystemDTO(
      id: id is int? ? id : this.id,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

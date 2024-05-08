/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class GameDTO extends _i1.SerializableEntity {
  GameDTO._({
    this.id,
    required this.uid,
    required this.name,
    required this.price,
    required this.description,
    required this.players,
    required this.imageUrl,
    required this.createdAt,
  });

  factory GameDTO({
    int? id,
    required String uid,
    required String name,
    required double price,
    required String description,
    required int players,
    required String imageUrl,
    required DateTime createdAt,
  }) = _GameDTOImpl;

  factory GameDTO.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return GameDTO(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      uid: serializationManager.deserialize<String>(jsonSerialization['uid']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      price:
          serializationManager.deserialize<double>(jsonSerialization['price']),
      description: serializationManager
          .deserialize<String>(jsonSerialization['description']),
      players:
          serializationManager.deserialize<int>(jsonSerialization['players']),
      imageUrl: serializationManager
          .deserialize<String>(jsonSerialization['imageUrl']),
      createdAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['createdAt']),
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

  int players;

  String imageUrl;

  DateTime createdAt;

  GameDTO copyWith({
    int? id,
    String? uid,
    String? name,
    double? price,
    String? description,
    int? players,
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
      'players': players,
      'imageUrl': imageUrl,
      'createdAt': createdAt.toJson(),
    };
  }
}

class _Undefined {}

class _GameDTOImpl extends GameDTO {
  _GameDTOImpl({
    int? id,
    required String uid,
    required String name,
    required double price,
    required String description,
    required int players,
    required String imageUrl,
    required DateTime createdAt,
  }) : super._(
          id: id,
          uid: uid,
          name: name,
          price: price,
          description: description,
          players: players,
          imageUrl: imageUrl,
          createdAt: createdAt,
        );

  @override
  GameDTO copyWith({
    Object? id = _Undefined,
    String? uid,
    String? name,
    double? price,
    String? description,
    int? players,
    String? imageUrl,
    DateTime? createdAt,
  }) {
    return GameDTO(
      id: id is int? ? id : this.id,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      players: players ?? this.players,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

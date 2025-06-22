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
import 'game_system.dart' as _i2;

abstract class GameDTO implements _i1.SerializableModel {
  GameDTO._({
    this.id,
    required this.uid,
    required this.gameSystemId,
    this.gameSystem,
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
    required int gameSystemId,
    _i2.GameSystemDTO? gameSystem,
    required String name,
    required double price,
    required String description,
    required int players,
    required String imageUrl,
    required DateTime createdAt,
  }) = _GameDTOImpl;

  factory GameDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return GameDTO(
      id: jsonSerialization['id'] as int?,
      uid: jsonSerialization['uid'] as String,
      gameSystemId: jsonSerialization['gameSystemId'] as int,
      gameSystem: jsonSerialization['gameSystem'] == null
          ? null
          : _i2.GameSystemDTO.fromJson(
              (jsonSerialization['gameSystem'] as Map<String, dynamic>)),
      name: jsonSerialization['name'] as String,
      price: (jsonSerialization['price'] as num).toDouble(),
      description: jsonSerialization['description'] as String,
      players: jsonSerialization['players'] as int,
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

  int gameSystemId;

  _i2.GameSystemDTO? gameSystem;

  String name;

  double price;

  String description;

  int players;

  String imageUrl;

  DateTime createdAt;

  /// Returns a shallow copy of this [GameDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GameDTO copyWith({
    int? id,
    String? uid,
    int? gameSystemId,
    _i2.GameSystemDTO? gameSystem,
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
      'gameSystemId': gameSystemId,
      if (gameSystem != null) 'gameSystem': gameSystem?.toJson(),
      'name': name,
      'price': price,
      'description': description,
      'players': players,
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

class _GameDTOImpl extends GameDTO {
  _GameDTOImpl({
    int? id,
    required String uid,
    required int gameSystemId,
    _i2.GameSystemDTO? gameSystem,
    required String name,
    required double price,
    required String description,
    required int players,
    required String imageUrl,
    required DateTime createdAt,
  }) : super._(
          id: id,
          uid: uid,
          gameSystemId: gameSystemId,
          gameSystem: gameSystem,
          name: name,
          price: price,
          description: description,
          players: players,
          imageUrl: imageUrl,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [GameDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GameDTO copyWith({
    Object? id = _Undefined,
    String? uid,
    int? gameSystemId,
    Object? gameSystem = _Undefined,
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
      gameSystemId: gameSystemId ?? this.gameSystemId,
      gameSystem: gameSystem is _i2.GameSystemDTO?
          ? gameSystem
          : this.gameSystem?.copyWith(),
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      players: players ?? this.players,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

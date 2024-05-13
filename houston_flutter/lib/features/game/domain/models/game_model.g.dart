// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameImpl _$$GameImplFromJson(Map<String, dynamic> json) => _$GameImpl(
      id: (json['id'] as num?)?.toInt(),
      uid: json['uid'] as String,
      gameSystem: json['gameSystem'] == null
          ? null
          : GameSystem.fromJson(json['gameSystem'] as Map<String, dynamic>),
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      players: (json['players'] as num).toInt(),
      imageUrl: json['imageUrl'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$GameImplToJson(_$GameImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'gameSystem': instance.gameSystem,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'players': instance.players,
      'imageUrl': instance.imageUrl,
      'createdAt': instance.createdAt.toIso8601String(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameImpl _$$GameImplFromJson(Map<String, dynamic> json) => _$GameImpl(
  id: (json['id'] as num?)?.toInt(),
  uid: json['uid'] as String,
  gameSystem:
      json['game_system'] == null
          ? null
          : GameSystem.fromJson(json['game_system'] as Map<String, dynamic>),
  name: json['name'] as String,
  price: (json['price'] as num).toDouble(),
  description: json['description'] as String,
  players: (json['players'] as num).toInt(),
  imageUrl: json['image_url'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$$GameImplToJson(_$GameImpl instance) =>
    <String, dynamic>{
      'game_system': gameSystemToJson(instance.gameSystem),
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'players': instance.players,
      'image_url': instance.imageUrl,
    };

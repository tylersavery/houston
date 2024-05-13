// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_system_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameSystemImpl _$$GameSystemImplFromJson(Map<String, dynamic> json) =>
    _$GameSystemImpl(
      id: (json['id'] as num?)?.toInt(),
      uid: json['uid'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$GameSystemImplToJson(_$GameSystemImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'price': instance.price,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'createdAt': instance.createdAt.toIso8601String(),
    };

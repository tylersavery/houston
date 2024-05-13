// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieImpl _$$MovieImplFromJson(Map<String, dynamic> json) => _$MovieImpl(
      id: (json['id'] as num?)?.toInt(),
      uid: json['uid'] as String,
      title: json['title'] as String,
      year: (json['year'] as num).toInt(),
      imageUrl: json['imageUrl'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$MovieImplToJson(_$MovieImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'title': instance.title,
      'year': instance.year,
      'imageUrl': instance.imageUrl,
      'createdAt': instance.createdAt.toIso8601String(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      id: (json['id'] as num?)?.toInt(),
      uid: json['uid'] as String,
      userId: (json['userId'] as num).toInt(),
      username: json['username'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      avatar: json['avatar'] as String,
      bio: json['bio'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'userId': instance.userId,
      'username': instance.username,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'avatar': instance.avatar,
      'bio': instance.bio,
      'created_at': instance.createdAt.toIso8601String(),
    };

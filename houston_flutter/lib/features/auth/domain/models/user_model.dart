// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class User with _$User {
  const User._();

  factory User({
    required String id,
    required String email,
    required String username,
    @JsonKey(name: "first_name") required String firstName,
    @JsonKey(name: "last_name") required String lastName,
    required String avatar,
    String? bio,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

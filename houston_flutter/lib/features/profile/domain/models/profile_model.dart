// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class Profile with _$Profile {
  const Profile._();

  factory Profile({
    @JsonKey(includeToJson: false) int? id,
    required String uid,
    required int userId,
    required String username,
    @JsonKey(name: "first_name") required String firstName,
    @JsonKey(name: "last_name") required String lastName,
    required String avatar,
    String? bio,
    @JsonKey(name: "created_at") required DateTime createdAt,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

  factory Profile.empty() {
    return Profile(
      id: null,
      userId: 0,
      uid: "",
      username: "",
      firstName: "",
      lastName: "",
      avatar: "",
      createdAt: DateTime.now(),
    );
  }

  bool get exists {
    return id != null && id! > 0;
  }

  String get label {
    return "$id";
  }
}

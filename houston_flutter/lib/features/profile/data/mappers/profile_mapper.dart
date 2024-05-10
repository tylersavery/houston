import 'package:houston_client/houston_client.dart';
import 'package:houston_flutter/features/profile/domain/models/profile_model.dart';

class ProfileMapper {
  static Profile toModel(ProfileDTO profileDTO) {
    return Profile(
      id: profileDTO.id,
      uid: profileDTO.uid,
      userId: profileDTO.userId,
      username: profileDTO.username,
      firstName: profileDTO.firstName,
      lastName: profileDTO.lastName,
      avatar: profileDTO.avatar,
      bio: profileDTO.bio,
      createdAt: profileDTO.createdAt,
    );
  }

  static ProfileDTO toDto(Profile profile) {
    return ProfileDTO(
      id: profile.id,
      userId: profile.userId,
      uid: profile.uid,
      username: profile.username,
      firstName: profile.firstName,
      lastName: profile.lastName,
      avatar: profile.avatar,
      bio: profile.bio,
      createdAt: profile.createdAt,
    );
  }

  static List<Profile> listToModel(List<ProfileDTO> profiles) {
    return profiles.map((profile) => toModel(profile)).toList();
  }

  static List<ProfileDTO> listToDto(List<Profile> profiles) {
    return profiles.map((profile) => toDto(profile)).toList();
  }
}

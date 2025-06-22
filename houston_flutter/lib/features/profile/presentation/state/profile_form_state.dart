import '../../domain/models/profile_model.dart';

class ProfileFormState {
  final Profile profile;
  final bool isLoading;
  final String? error;

  ProfileFormState({
    required this.profile,
    required this.isLoading,
    this.error,
  });

  static Profile get initialProfile {
    return Profile(
      id: null,
      uid: "",
      userId: 0,
      username: "",
      firstName: "",
      lastName: "",
      avatar: "",
      createdAt: DateTime.now(),
    );
  }

  factory ProfileFormState.initial() {
    return ProfileFormState(isLoading: false, profile: initialProfile);
  }

  ProfileFormState loading() {
    return ProfileFormState(profile: profile, isLoading: true, error: null);
  }

  ProfileFormState success(Profile profile) {
    return ProfileFormState(profile: profile, isLoading: false, error: null);
  }

  ProfileFormState failure(String error) {
    return ProfileFormState(
      profile: initialProfile,
      isLoading: false,
      error: error,
    );
  }

  ProfileFormState updateProfile(Profile profile) {
    return ProfileFormState(
      profile: profile,
      isLoading: isLoading,
      error: error,
    );
  }

  ProfileFormState clean() {
    return ProfileFormState(profile: profile, isLoading: false, error: null);
  }
}

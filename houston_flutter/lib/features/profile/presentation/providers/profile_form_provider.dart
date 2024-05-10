import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/utils/validation_utils.dart';
import '../../domain/providers/profile_repository_provider.dart';
import 'profile_detail_provider.dart';
import '../state/profile_form_state.dart';
import 'profile_infinite_list_provider.dart';

part 'profile_form_provider.g.dart';

@Riverpod(keepAlive: true)
class ProfileForm extends _$ProfileForm {
  @override
  ProfileFormState build() {
    return ProfileFormState.initial();
  }

  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final avatarController = TextEditingController();
  final bioController = TextEditingController();

  String? usernameValidator(String? value) =>
      ValidationUtils.formValidatorNotEmpty(value, "Username");

  Future<void> load(int profileId) async {
    final result =
        await ref.read(profileRepositoryProvider).retrieve(profileId);

    result.fold(
      (failure) {
        state = state.failure(failure.message);
      },
      (profile) {
        state = state.success(profile);
        _refreshControllers();
      },
    );
  }

  void _refreshControllers() {
    usernameController.text = state.profile.username;
    firstNameController.text = state.profile.firstName;
    lastNameController.text = state.profile.lastName;
    avatarController.text = state.profile.avatar;
    bioController.text = state.profile.bio ?? '';
  }

  void reset() {
    state = ProfileFormState.initial();
    _refreshControllers();
  }

  Future<bool> submit() async {
    if (!formKey.currentState!.validate()) {
      state = state.failure("Invalid Details");
      return false;
    }

    final profile = state.profile.copyWith(
      username: usernameController.text,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      avatar: avatarController.text,
      bio: bioController.text,
    );

    state = state.loading();

    final result = await ref.read(profileRepositoryProvider).save(profile);

    return result.fold(
      (failure) {
        state = state.failure(failure.message);
        return false;
      },
      (profile) {
        state = state.success(profile);
        reset();
        ref.read(profileInfiniteListProvider).refresh();
        if (profile.id != null) {
          ref.invalidate(profileDetailProvider(profile.id!));
        }
        return true;
      },
    );
  }

  Future<bool> delete() async {
    if (state.profile.id != null) {
      final result =
          await ref.read(profileRepositoryProvider).delete(state.profile.id!);

      return result.fold((failure) {
        state = state.failure(failure.message);
        return false;
      }, (_) {
        reset();
        ref.invalidate(profileInfiniteListProvider);
        return true;
      });
    }

    return false;
  }
}

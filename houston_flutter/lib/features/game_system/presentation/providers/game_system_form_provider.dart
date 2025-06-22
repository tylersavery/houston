import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/utils/validation_utils.dart';
import '../../domain/providers/game_system_repository_provider.dart';
import '../../domain/models/game_system_list_variant.dart';
import 'game_system_detail_provider.dart';
import '../state/game_system_form_state.dart';
import 'game_system_infinite_list_provider.dart';

part 'game_system_form_provider.g.dart';

@Riverpod(keepAlive: true)
class GameSystemForm extends _$GameSystemForm {
  @override
  GameSystemFormState build() {
    return GameSystemFormState.initial();
  }

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();

  String? nameValidator(String? value) =>
      ValidationUtils.formValidatorNotEmpty(value, "Name");
  String? priceValidator(String? value) =>
      ValidationUtils.formValidatorNotEmpty(value, "Price");
  String? descriptionValidator(String? value) =>
      ValidationUtils.formValidatorNotEmpty(value, "Description");

  Future<void> load(int gameSystemId) async {
    final result = await ref
        .read(gameSystemRepositoryProvider)
        .retrieve(gameSystemId);

    result.fold(
      (failure) {
        state = state.failure(failure.message);
      },
      (gameSystem) {
        state = state.success(gameSystem);
        _refreshControllers();
      },
    );
  }

  void _refreshControllers() {
    nameController.text = state.gameSystem.name;
    priceController.text = state.gameSystem.price.toString();
    descriptionController.text = state.gameSystem.description;
  }

  void reset() {
    state = GameSystemFormState.initial();
    _refreshControllers();
  }

  void setImageUrl(String value) {
    state = state.updateGameSystem(state.gameSystem.copyWith(imageUrl: value));
  }

  Future<bool> submit() async {
    if (!formKey.currentState!.validate()) {
      state = state.failure("Invalid Details");
      return false;
    }

    final gameSystem = state.gameSystem.copyWith(
      name: nameController.text,
      price: double.tryParse(priceController.text) ?? 0.0,
      description: descriptionController.text,
    );

    state = state.loading();

    final result = await ref
        .read(gameSystemRepositoryProvider)
        .save(gameSystem);

    return result.fold(
      (failure) {
        state = state.failure(failure.message);
        return false;
      },
      (gameSystem) {
        state = state.success(gameSystem);
        reset();
        ref
            .read(
              gameSystemInfiniteListProvider(
                GameSystemListVariant.all,
              ).notifier,
            )
            .refresh();
        if (gameSystem.id != null) {
          ref.invalidate(gameSystemDetailProvider(gameSystem.id!));
        }
        return true;
      },
    );
  }

  Future<bool> delete() async {
    if (state.gameSystem.id != null) {
      final result = await ref
          .read(gameSystemRepositoryProvider)
          .delete(state.gameSystem.id!);

      return result.fold(
        (failure) {
          state = state.failure(failure.message);
          return false;
        },
        (_) {
          reset();
          ref.invalidate(gameSystemInfiniteListProvider);
          return true;
        },
      );
    }

    return false;
  }
}

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/utils/validation_utils.dart';
import '../../domain/providers/game_repository_provider.dart';
import '../../domain/models/game_list_variant.dart';
import 'game_detail_provider.dart';
import '../state/game_form_state.dart';
import 'game_infinite_list_provider.dart';
import '../../../game_system/domain/models/game_system_model.dart';

part 'game_form_provider.g.dart';

@Riverpod(keepAlive: true)
class GameForm extends _$GameForm {
  @override
  GameFormState build() {
    return GameFormState.initial();
  }

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  final playersController = TextEditingController();
  

  String? nameValidator(String? value) => ValidationUtils.formValidatorNotEmpty(value, "Name");
  String? priceValidator(String? value) => ValidationUtils.formValidatorNotEmpty(value, "Price");
  String? descriptionValidator(String? value) => ValidationUtils.formValidatorNotEmpty(value, "Description");
  String? playersValidator(String? value) => ValidationUtils.formValidatorNotEmpty(value, "Players");
  

  Future<void> load(int gameId) async {
    final result = await ref.read(gameRepositoryProvider).retrieve(gameId);

    result.fold(
      (failure) {
        state = state.failure(failure.message);
      },
      (game) {
        state = state.success(game);
        _refreshControllers();
      },
    );
  }

  void _refreshControllers() {
    nameController.text = state.game.name;
    priceController.text = state.game.price.toString();
    descriptionController.text = state.game.description;
    playersController.text = state.game.players.toString();
    
  }

  void reset() {
    state = GameFormState.initial();
    _refreshControllers();
  }

    void setGameSystem(GameSystem value) {
    state = state.updateGame(
      state.game.copyWith(gameSystem: value),
    );
  }


    void setImageUrl(String value) {
    state = state.updateGame(
      state.game.copyWith(imageUrl: value),
    );
  }


  

  Future<bool> submit() async {
    if (!formKey.currentState!.validate()) {
      state = state.failure("Invalid Details");
      return false;
    }

    final game = state.game.copyWith(
      name: nameController.text,
      price: double.tryParse(priceController.text) ?? 0.0,
      description: descriptionController.text,
      players: int.tryParse(playersController.text) ?? 0,
      
    );

    state = state.loading();

    final result = await ref.read(gameRepositoryProvider).save(game);

    return result.fold(
      (failure) {
        state = state.failure(failure.message);
        return false;
      },
      (game) {
        state = state.success(game);
        reset();
        ref.read(gameInfiniteListProvider(GameListVariant.all).notifier).refresh();
        if (game.id != null) {
          ref.invalidate(gameDetailProvider(game.id!));
        }
        return true;
      },
    );
  }

  Future<bool> delete() async {
    if (state.game.id != null) {
      final result = await ref.read(gameRepositoryProvider).delete(state.game.id!);
    
      return result.fold((failure) {
        state = state.failure(failure.message);
        return false;
      }, (_) {
        reset();
        ref.invalidate(gameInfiniteListProvider);
        return true;
      });
    }

    return false;
  }
}

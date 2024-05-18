import '../../domain/models/game_system_model.dart';

class GameSystemFormState {
  final GameSystem gameSystem;
  final bool isLoading;
  final String? error;

  GameSystemFormState({
    required this.gameSystem,
    required this.isLoading,
    this.error,
  });

  static GameSystem get initialGameSystem {
    return GameSystem(
      id: null,
      uid: "",
      name: "",
      price: 0,
      description: "",
      imageUrl: "",
      createdAt: DateTime.now(),
    );
  }

  factory GameSystemFormState.initial() {
    return GameSystemFormState(
      isLoading: false,
      gameSystem: initialGameSystem,
    );
  }

  GameSystemFormState loading() {
    return GameSystemFormState(
      gameSystem: gameSystem,
      isLoading: true,
      error: null,
    );
  }

  GameSystemFormState success(GameSystem gameSystem) {
    return GameSystemFormState(
      gameSystem: gameSystem,
      isLoading: false,
      error: null,
    );
  }

  GameSystemFormState failure(String error) {
    return GameSystemFormState(
      gameSystem: initialGameSystem,
      isLoading: false,
      error: error,
    );
  }

  GameSystemFormState updateGameSystem(GameSystem gameSystem) {
    return GameSystemFormState(
      gameSystem: gameSystem,
      isLoading: isLoading,
      error: error,
    );
  }

  GameSystemFormState clean() {
    return GameSystemFormState(
      gameSystem: gameSystem,
      isLoading: false,
      error: null,
    );
  }
}

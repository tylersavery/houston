import '../../domain/models/game_model.dart';
import '../../../game_system/domain/models/game_system_model.dart';

class GameFormState {
  final Game game;
  final bool isLoading;
  final String? error;

  GameFormState({required this.game, required this.isLoading, this.error});

  static Game get initialGame {
    return Game(
      id: null,
      uid: "",
      name: "",
      price: 0,
      description: "",
      players: 0,
      imageUrl: "",
      createdAt: DateTime.now(),
    );
  }

  factory GameFormState.initial() {
    return GameFormState(isLoading: false, game: initialGame);
  }

  GameFormState loading() {
    return GameFormState(game: game, isLoading: true, error: null);
  }

  GameFormState success(Game game) {
    return GameFormState(game: game, isLoading: false, error: null);
  }

  GameFormState failure(String error) {
    return GameFormState(game: initialGame, isLoading: false, error: error);
  }

  GameFormState updateGame(Game game) {
    return GameFormState(game: game, isLoading: isLoading, error: error);
  }

  GameFormState clean() {
    return GameFormState(game: game, isLoading: false, error: null);
  }
}

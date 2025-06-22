import 'package:houston_client/houston_client.dart';
import 'package:houston_flutter/features/game_system/domain/models/game_system_model.dart';

class GameSystemMapper {
  static GameSystem toModel(GameSystemDTO gameSystemDTO) {
    return GameSystem(
      id: gameSystemDTO.id,
      uid: gameSystemDTO.uid,
      name: gameSystemDTO.name,
      price: gameSystemDTO.price,
      description: gameSystemDTO.description,
      imageUrl: gameSystemDTO.imageUrl,
      createdAt: gameSystemDTO.createdAt,
    );
  }

  static GameSystemDTO toDto(GameSystem gameSystem) {
    return GameSystemDTO(
      id: gameSystem.id,
      uid: gameSystem.uid,
      name: gameSystem.name,
      price: gameSystem.price,
      description: gameSystem.description,
      imageUrl: gameSystem.imageUrl,
      createdAt: gameSystem.createdAt,
    );
  }

  static List<GameSystem> listToModel(List<GameSystemDTO> gameSystems) {
    return gameSystems.map((gameSystem) => toModel(gameSystem)).toList();
  }

  static List<GameSystemDTO> listToDto(List<GameSystem> gameSystems) {
    return gameSystems.map((gameSystem) => toDto(gameSystem)).toList();
  }
}

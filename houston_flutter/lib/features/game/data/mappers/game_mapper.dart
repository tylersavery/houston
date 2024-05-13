import 'package:houston_client/houston_client.dart';
import 'package:houston_flutter/features/game/domain/models/game_model.dart';
import '../../../game_system/data/mappers/game_system_mapper.dart';


class GameMapper {
  static Game toModel(GameDTO gameDTO) {
    return Game(
      id: gameDTO.id,
      uid: gameDTO.uid,
      gameSystem: GameSystemMapper.toModel(gameDTO.gameSystem),
      name: gameDTO.name,
      price: gameDTO.price,
      description: gameDTO.description,
      players: gameDTO.players,
      imageUrl: gameDTO.imageUrl,
      createdAt: gameDTO.createdAt,
      
    );
  }

  static GameDTO toDto(Game game) {
    return GameDTO(
      id: game.id,
      uid: game.uid,
      gameSystem: GameSystemMapper.toDto(game.gameSystem),
      name: game.name,
      price: game.price,
      description: game.description,
      players: game.players,
      imageUrl: game.imageUrl,
      createdAt: game.createdAt,
      
    );
  }

  static List<Game> listToModel(List<GameDTO> games) {
    return games.map((game) => toModel(game)).toList();
  }

  static List<GameDTO> listToDto(List<Game> games) {
    return games.map((game) => toDto(game)).toList();
  }
}
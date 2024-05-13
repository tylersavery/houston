// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../game_system/domain/models/game_system_model.dart';

part 'game_model.freezed.dart';
part 'game_model.g.dart';



@freezed
class Game with _$Game {
  const Game._();

  factory Game({
    @JsonKey(includeToJson: false) int? id,
    required String uid,
    required GameSystem gameSystem,
    required String name,
    required double price,
    required String description,
    required int players,
    required String imageUrl,
    required DateTime createdAt,
    
  }) = _Game;

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);


  factory Game.empty() {
    return Game(
      id: null,
      uid: "",
      gameSystem: GameSystem.empty(),
      name: "",
      price: 0,
      description: "",
      players: 0,
      imageUrl: "",
      createdAt: DateTime.now(),
      
    );
  }

  bool get exists {
    return id != null && id! > 0;
  }

  String get label {
    return name;
    
  }

}
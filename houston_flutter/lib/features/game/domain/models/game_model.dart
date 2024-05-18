// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../game_system/domain/models/game_system_model.dart';

part 'game_model.freezed.dart';
part 'game_model.g.dart';

int? gameSystemToJson(GameSystem? gameSystem) => gameSystem?.id;


@freezed
class Game with _$Game {
  const Game._();

  factory Game({
    @JsonKey(includeToJson: false) int? id,
    @JsonKey(includeToJson: false) required String uid,
    @JsonKey(name: "game_system", toJson: gameSystemToJson) GameSystem? gameSystem,
    required String name,
    required double price,
    required String description,
    required int players,
    @JsonKey(name: "image_url") required String imageUrl,
    @JsonKey(name: "created_at", includeToJson: false) required DateTime createdAt,
    
  }) = _Game;

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);


  factory Game.empty() {
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

  bool get exists {
    return id != null && id! > 0;
  }

  String get label {
    return name;
    
  }

}
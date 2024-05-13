// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';


part 'game_system_model.freezed.dart';
part 'game_system_model.g.dart';



@freezed
class GameSystem with _$GameSystem {
  const GameSystem._();

  factory GameSystem({
    @JsonKey(includeToJson: false) int? id,
    required String uid,
    required String name,
    required double price,
    required String description,
    required String imageUrl,
    required DateTime createdAt,
    
  }) = _GameSystem;

  factory GameSystem.fromJson(Map<String, dynamic> json) => _$GameSystemFromJson(json);


  factory GameSystem.empty() {
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

  bool get exists {
    return id != null && id! > 0;
  }

  String get label {
    return name;
    
  }

}
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';


part 'movie_model.freezed.dart';
part 'movie_model.g.dart';



@freezed
class Movie with _$Movie {
  const Movie._();

  factory Movie({
    @JsonKey(includeToJson: false) int? id,
    required String uid,
    required String title,
    required int year,
    required String imageUrl,
    required DateTime createdAt,
    
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);


  factory Movie.empty() {
    return Movie(
      id: null,
      uid: "",
      title: "",
      year: 0,
      imageUrl: "",
      createdAt: DateTime.now(),
      
    );
  }

  bool get exists {
    return id != null && id! > 0;
  }

  String get label {
    return title;
    
  }

}
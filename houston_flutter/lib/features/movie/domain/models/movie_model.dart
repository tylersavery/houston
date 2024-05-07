import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_model.freezed.dart';
part 'movie_model.g.dart';

@freezed
class Movie with _$Movie {
  const Movie._();

  factory Movie({
    int? id,
    required String uid,
    required String title,
    required int year,
    required String imageUrl,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  String get label {
    return title;
  }
}

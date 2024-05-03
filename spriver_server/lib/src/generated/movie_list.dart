/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class MovieList extends _i1.SerializableEntity {
  MovieList._({
    required this.page,
    required this.count,
    required this.numPages,
    required this.limit,
    required this.results,
  });

  factory MovieList({
    required int page,
    required int count,
    required int numPages,
    required int limit,
    required List<_i2.Movie> results,
  }) = _MovieListImpl;

  factory MovieList.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return MovieList(
      page: serializationManager.deserialize<int>(jsonSerialization['page']),
      count: serializationManager.deserialize<int>(jsonSerialization['count']),
      numPages:
          serializationManager.deserialize<int>(jsonSerialization['numPages']),
      limit: serializationManager.deserialize<int>(jsonSerialization['limit']),
      results: serializationManager
          .deserialize<List<_i2.Movie>>(jsonSerialization['results']),
    );
  }

  int page;

  int count;

  int numPages;

  int limit;

  List<_i2.Movie> results;

  MovieList copyWith({
    int? page,
    int? count,
    int? numPages,
    int? limit,
    List<_i2.Movie>? results,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'count': count,
      'numPages': numPages,
      'limit': limit,
      'results': results.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'page': page,
      'count': count,
      'numPages': numPages,
      'limit': limit,
      'results': results.toJson(valueToJson: (v) => v.allToJson()),
    };
  }
}

class _MovieListImpl extends MovieList {
  _MovieListImpl({
    required int page,
    required int count,
    required int numPages,
    required int limit,
    required List<_i2.Movie> results,
  }) : super._(
          page: page,
          count: count,
          numPages: numPages,
          limit: limit,
          results: results,
        );

  @override
  MovieList copyWith({
    int? page,
    int? count,
    int? numPages,
    int? limit,
    List<_i2.Movie>? results,
  }) {
    return MovieList(
      page: page ?? this.page,
      count: count ?? this.count,
      numPages: numPages ?? this.numPages,
      limit: limit ?? this.limit,
      results: results ?? this.results.clone(),
    );
  }
}

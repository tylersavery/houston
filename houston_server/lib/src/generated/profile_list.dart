/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'profile.dart' as _i2;

abstract class ProfileDTOList
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  ProfileDTOList._({
    required this.page,
    required this.count,
    required this.numPages,
    required this.limit,
    required this.results,
  });

  factory ProfileDTOList({
    required int page,
    required int count,
    required int numPages,
    required int limit,
    required List<_i2.ProfileDTO> results,
  }) = _ProfileDTOListImpl;

  factory ProfileDTOList.fromJson(Map<String, dynamic> jsonSerialization) {
    return ProfileDTOList(
      page: jsonSerialization['page'] as int,
      count: jsonSerialization['count'] as int,
      numPages: jsonSerialization['numPages'] as int,
      limit: jsonSerialization['limit'] as int,
      results: (jsonSerialization['results'] as List)
          .map((e) => _i2.ProfileDTO.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  int page;

  int count;

  int numPages;

  int limit;

  List<_i2.ProfileDTO> results;

  /// Returns a shallow copy of this [ProfileDTOList]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProfileDTOList copyWith({
    int? page,
    int? count,
    int? numPages,
    int? limit,
    List<_i2.ProfileDTO>? results,
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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'page': page,
      'count': count,
      'numPages': numPages,
      'limit': limit,
      'results': results.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _ProfileDTOListImpl extends ProfileDTOList {
  _ProfileDTOListImpl({
    required int page,
    required int count,
    required int numPages,
    required int limit,
    required List<_i2.ProfileDTO> results,
  }) : super._(
          page: page,
          count: count,
          numPages: numPages,
          limit: limit,
          results: results,
        );

  /// Returns a shallow copy of this [ProfileDTOList]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProfileDTOList copyWith({
    int? page,
    int? count,
    int? numPages,
    int? limit,
    List<_i2.ProfileDTO>? results,
  }) {
    return ProfileDTOList(
      page: page ?? this.page,
      count: count ?? this.count,
      numPages: numPages ?? this.numPages,
      limit: limit ?? this.limit,
      results: results ?? this.results.map((e0) => e0.copyWith()).toList(),
    );
  }
}

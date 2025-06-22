/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'game.dart' as _i2;
import 'game_list.dart' as _i3;
import 'game_system.dart' as _i4;
import 'game_system_list.dart' as _i5;
import 'movie.dart' as _i6;
import 'movie_list.dart' as _i7;
import 'profile.dart' as _i8;
import 'profile_list.dart' as _i9;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i10;
export 'game.dart';
export 'game_list.dart';
export 'game_system.dart';
export 'game_system_list.dart';
export 'movie.dart';
export 'movie_list.dart';
export 'profile.dart';
export 'profile_list.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.GameDTO) {
      return _i2.GameDTO.fromJson(data) as T;
    }
    if (t == _i3.GameDTOList) {
      return _i3.GameDTOList.fromJson(data) as T;
    }
    if (t == _i4.GameSystemDTO) {
      return _i4.GameSystemDTO.fromJson(data) as T;
    }
    if (t == _i5.GameSystemDTOList) {
      return _i5.GameSystemDTOList.fromJson(data) as T;
    }
    if (t == _i6.MovieDTO) {
      return _i6.MovieDTO.fromJson(data) as T;
    }
    if (t == _i7.MovieDTOList) {
      return _i7.MovieDTOList.fromJson(data) as T;
    }
    if (t == _i8.ProfileDTO) {
      return _i8.ProfileDTO.fromJson(data) as T;
    }
    if (t == _i9.ProfileDTOList) {
      return _i9.ProfileDTOList.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.GameDTO?>()) {
      return (data != null ? _i2.GameDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.GameDTOList?>()) {
      return (data != null ? _i3.GameDTOList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.GameSystemDTO?>()) {
      return (data != null ? _i4.GameSystemDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.GameSystemDTOList?>()) {
      return (data != null ? _i5.GameSystemDTOList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.MovieDTO?>()) {
      return (data != null ? _i6.MovieDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.MovieDTOList?>()) {
      return (data != null ? _i7.MovieDTOList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.ProfileDTO?>()) {
      return (data != null ? _i8.ProfileDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.ProfileDTOList?>()) {
      return (data != null ? _i9.ProfileDTOList.fromJson(data) : null) as T;
    }
    if (t == List<_i2.GameDTO>) {
      return (data as List).map((e) => deserialize<_i2.GameDTO>(e)).toList()
          as T;
    }
    if (t == List<_i4.GameSystemDTO>) {
      return (data as List)
          .map((e) => deserialize<_i4.GameSystemDTO>(e))
          .toList() as T;
    }
    if (t == List<_i6.MovieDTO>) {
      return (data as List).map((e) => deserialize<_i6.MovieDTO>(e)).toList()
          as T;
    }
    if (t == List<_i8.ProfileDTO>) {
      return (data as List).map((e) => deserialize<_i8.ProfileDTO>(e)).toList()
          as T;
    }
    try {
      return _i10.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.GameDTO) {
      return 'GameDTO';
    }
    if (data is _i3.GameDTOList) {
      return 'GameDTOList';
    }
    if (data is _i4.GameSystemDTO) {
      return 'GameSystemDTO';
    }
    if (data is _i5.GameSystemDTOList) {
      return 'GameSystemDTOList';
    }
    if (data is _i6.MovieDTO) {
      return 'MovieDTO';
    }
    if (data is _i7.MovieDTOList) {
      return 'MovieDTOList';
    }
    if (data is _i8.ProfileDTO) {
      return 'ProfileDTO';
    }
    if (data is _i9.ProfileDTOList) {
      return 'ProfileDTOList';
    }
    className = _i10.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'GameDTO') {
      return deserialize<_i2.GameDTO>(data['data']);
    }
    if (dataClassName == 'GameDTOList') {
      return deserialize<_i3.GameDTOList>(data['data']);
    }
    if (dataClassName == 'GameSystemDTO') {
      return deserialize<_i4.GameSystemDTO>(data['data']);
    }
    if (dataClassName == 'GameSystemDTOList') {
      return deserialize<_i5.GameSystemDTOList>(data['data']);
    }
    if (dataClassName == 'MovieDTO') {
      return deserialize<_i6.MovieDTO>(data['data']);
    }
    if (dataClassName == 'MovieDTOList') {
      return deserialize<_i7.MovieDTOList>(data['data']);
    }
    if (dataClassName == 'ProfileDTO') {
      return deserialize<_i8.ProfileDTO>(data['data']);
    }
    if (dataClassName == 'ProfileDTOList') {
      return deserialize<_i9.ProfileDTOList>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i10.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}

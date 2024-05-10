/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'food.dart' as _i2;
import 'food_list.dart' as _i3;
import 'game.dart' as _i4;
import 'game_list.dart' as _i5;
import 'game_system.dart' as _i6;
import 'game_system_list.dart' as _i7;
import 'movie.dart' as _i8;
import 'movie_list.dart' as _i9;
import 'profile.dart' as _i10;
import 'profile_list.dart' as _i11;
import 'protocol.dart' as _i12;
import 'package:serverpod_auth_client/module.dart' as _i13;
export 'food.dart';
export 'food_list.dart';
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

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i2.FoodDTO) {
      return _i2.FoodDTO.fromJson(data, this) as T;
    }
    if (t == _i3.FoodDTOList) {
      return _i3.FoodDTOList.fromJson(data, this) as T;
    }
    if (t == _i4.GameDTO) {
      return _i4.GameDTO.fromJson(data, this) as T;
    }
    if (t == _i5.GameDTOList) {
      return _i5.GameDTOList.fromJson(data, this) as T;
    }
    if (t == _i6.GameSystemDTO) {
      return _i6.GameSystemDTO.fromJson(data, this) as T;
    }
    if (t == _i7.GameSystemDTOList) {
      return _i7.GameSystemDTOList.fromJson(data, this) as T;
    }
    if (t == _i8.MovieDTO) {
      return _i8.MovieDTO.fromJson(data, this) as T;
    }
    if (t == _i9.MovieDTOList) {
      return _i9.MovieDTOList.fromJson(data, this) as T;
    }
    if (t == _i10.ProfileDTO) {
      return _i10.ProfileDTO.fromJson(data, this) as T;
    }
    if (t == _i11.ProfileDTOList) {
      return _i11.ProfileDTOList.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.FoodDTO?>()) {
      return (data != null ? _i2.FoodDTO.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i3.FoodDTOList?>()) {
      return (data != null ? _i3.FoodDTOList.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i4.GameDTO?>()) {
      return (data != null ? _i4.GameDTO.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i5.GameDTOList?>()) {
      return (data != null ? _i5.GameDTOList.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i6.GameSystemDTO?>()) {
      return (data != null ? _i6.GameSystemDTO.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i7.GameSystemDTOList?>()) {
      return (data != null ? _i7.GameSystemDTOList.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i8.MovieDTO?>()) {
      return (data != null ? _i8.MovieDTO.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i9.MovieDTOList?>()) {
      return (data != null ? _i9.MovieDTOList.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i10.ProfileDTO?>()) {
      return (data != null ? _i10.ProfileDTO.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i11.ProfileDTOList?>()) {
      return (data != null ? _i11.ProfileDTOList.fromJson(data, this) : null)
          as T;
    }
    if (t == List<_i12.FoodDTO>) {
      return (data as List).map((e) => deserialize<_i12.FoodDTO>(e)).toList()
          as dynamic;
    }
    if (t == List<_i12.GameDTO>) {
      return (data as List).map((e) => deserialize<_i12.GameDTO>(e)).toList()
          as dynamic;
    }
    if (t == List<_i12.GameSystemDTO>) {
      return (data as List)
          .map((e) => deserialize<_i12.GameSystemDTO>(e))
          .toList() as dynamic;
    }
    if (t == List<_i12.MovieDTO>) {
      return (data as List).map((e) => deserialize<_i12.MovieDTO>(e)).toList()
          as dynamic;
    }
    if (t == List<_i12.ProfileDTO>) {
      return (data as List).map((e) => deserialize<_i12.ProfileDTO>(e)).toList()
          as dynamic;
    }
    try {
      return _i13.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i13.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i2.FoodDTO) {
      return 'FoodDTO';
    }
    if (data is _i3.FoodDTOList) {
      return 'FoodDTOList';
    }
    if (data is _i4.GameDTO) {
      return 'GameDTO';
    }
    if (data is _i5.GameDTOList) {
      return 'GameDTOList';
    }
    if (data is _i6.GameSystemDTO) {
      return 'GameSystemDTO';
    }
    if (data is _i7.GameSystemDTOList) {
      return 'GameSystemDTOList';
    }
    if (data is _i8.MovieDTO) {
      return 'MovieDTO';
    }
    if (data is _i9.MovieDTOList) {
      return 'MovieDTOList';
    }
    if (data is _i10.ProfileDTO) {
      return 'ProfileDTO';
    }
    if (data is _i11.ProfileDTOList) {
      return 'ProfileDTOList';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i13.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'FoodDTO') {
      return deserialize<_i2.FoodDTO>(data['data']);
    }
    if (data['className'] == 'FoodDTOList') {
      return deserialize<_i3.FoodDTOList>(data['data']);
    }
    if (data['className'] == 'GameDTO') {
      return deserialize<_i4.GameDTO>(data['data']);
    }
    if (data['className'] == 'GameDTOList') {
      return deserialize<_i5.GameDTOList>(data['data']);
    }
    if (data['className'] == 'GameSystemDTO') {
      return deserialize<_i6.GameSystemDTO>(data['data']);
    }
    if (data['className'] == 'GameSystemDTOList') {
      return deserialize<_i7.GameSystemDTOList>(data['data']);
    }
    if (data['className'] == 'MovieDTO') {
      return deserialize<_i8.MovieDTO>(data['data']);
    }
    if (data['className'] == 'MovieDTOList') {
      return deserialize<_i9.MovieDTOList>(data['data']);
    }
    if (data['className'] == 'ProfileDTO') {
      return deserialize<_i10.ProfileDTO>(data['data']);
    }
    if (data['className'] == 'ProfileDTOList') {
      return deserialize<_i11.ProfileDTOList>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}

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
import 'movie.dart' as _i4;
import 'movie_list.dart' as _i5;
import 'protocol.dart' as _i6;
import 'package:serverpod_auth_client/module.dart' as _i7;
export 'food.dart';
export 'food_list.dart';
export 'movie.dart';
export 'movie_list.dart';
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
    if (t == _i4.MovieDTO) {
      return _i4.MovieDTO.fromJson(data, this) as T;
    }
    if (t == _i5.MovieDTOList) {
      return _i5.MovieDTOList.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.FoodDTO?>()) {
      return (data != null ? _i2.FoodDTO.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i3.FoodDTOList?>()) {
      return (data != null ? _i3.FoodDTOList.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i4.MovieDTO?>()) {
      return (data != null ? _i4.MovieDTO.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i5.MovieDTOList?>()) {
      return (data != null ? _i5.MovieDTOList.fromJson(data, this) : null) as T;
    }
    if (t == List<_i6.FoodDTO>) {
      return (data as List).map((e) => deserialize<_i6.FoodDTO>(e)).toList()
          as dynamic;
    }
    if (t == List<_i6.MovieDTO>) {
      return (data as List).map((e) => deserialize<_i6.MovieDTO>(e)).toList()
          as dynamic;
    }
    try {
      return _i7.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i7.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i2.FoodDTO) {
      return 'FoodDTO';
    }
    if (data is _i3.FoodDTOList) {
      return 'FoodDTOList';
    }
    if (data is _i4.MovieDTO) {
      return 'MovieDTO';
    }
    if (data is _i5.MovieDTOList) {
      return 'MovieDTOList';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i7.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'FoodDTO') {
      return deserialize<_i2.FoodDTO>(data['data']);
    }
    if (data['className'] == 'FoodDTOList') {
      return deserialize<_i3.FoodDTOList>(data['data']);
    }
    if (data['className'] == 'MovieDTO') {
      return deserialize<_i4.MovieDTO>(data['data']);
    }
    if (data['className'] == 'MovieDTOList') {
      return deserialize<_i5.MovieDTOList>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}

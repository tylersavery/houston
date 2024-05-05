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
    if (t == _i2.Food) {
      return _i2.Food.fromJson(data, this) as T;
    }
    if (t == _i3.FoodList) {
      return _i3.FoodList.fromJson(data, this) as T;
    }
    if (t == _i4.Movie) {
      return _i4.Movie.fromJson(data, this) as T;
    }
    if (t == _i5.MovieList) {
      return _i5.MovieList.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.Food?>()) {
      return (data != null ? _i2.Food.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i3.FoodList?>()) {
      return (data != null ? _i3.FoodList.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i4.Movie?>()) {
      return (data != null ? _i4.Movie.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i5.MovieList?>()) {
      return (data != null ? _i5.MovieList.fromJson(data, this) : null) as T;
    }
    if (t == List<_i6.Food>) {
      return (data as List).map((e) => deserialize<_i6.Food>(e)).toList()
          as dynamic;
    }
    if (t == List<_i6.Movie>) {
      return (data as List).map((e) => deserialize<_i6.Movie>(e)).toList()
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
    if (data is _i2.Food) {
      return 'Food';
    }
    if (data is _i3.FoodList) {
      return 'FoodList';
    }
    if (data is _i4.Movie) {
      return 'Movie';
    }
    if (data is _i5.MovieList) {
      return 'MovieList';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i7.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'Food') {
      return deserialize<_i2.Food>(data['data']);
    }
    if (data['className'] == 'FoodList') {
      return deserialize<_i3.FoodList>(data['data']);
    }
    if (data['className'] == 'Movie') {
      return deserialize<_i4.Movie>(data['data']);
    }
    if (data['className'] == 'MovieList') {
      return deserialize<_i5.MovieList>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}

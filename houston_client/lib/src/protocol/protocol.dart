/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'game.dart' as _i2;
import 'game_list.dart' as _i3;
import 'game_system.dart' as _i4;
import 'game_system_list.dart' as _i5;
import 'profile.dart' as _i6;
import 'profile_list.dart' as _i7;
import 'protocol.dart' as _i8;
import 'package:serverpod_auth_client/module.dart' as _i9;
export 'game.dart';
export 'game_list.dart';
export 'game_system.dart';
export 'game_system_list.dart';
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
    if (t == _i2.GameDTO) {
      return _i2.GameDTO.fromJson(data, this) as T;
    }
    if (t == _i3.GameDTOList) {
      return _i3.GameDTOList.fromJson(data, this) as T;
    }
    if (t == _i4.GameSystemDTO) {
      return _i4.GameSystemDTO.fromJson(data, this) as T;
    }
    if (t == _i5.GameSystemDTOList) {
      return _i5.GameSystemDTOList.fromJson(data, this) as T;
    }
    if (t == _i6.ProfileDTO) {
      return _i6.ProfileDTO.fromJson(data, this) as T;
    }
    if (t == _i7.ProfileDTOList) {
      return _i7.ProfileDTOList.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.GameDTO?>()) {
      return (data != null ? _i2.GameDTO.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i3.GameDTOList?>()) {
      return (data != null ? _i3.GameDTOList.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i4.GameSystemDTO?>()) {
      return (data != null ? _i4.GameSystemDTO.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i5.GameSystemDTOList?>()) {
      return (data != null ? _i5.GameSystemDTOList.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i6.ProfileDTO?>()) {
      return (data != null ? _i6.ProfileDTO.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i7.ProfileDTOList?>()) {
      return (data != null ? _i7.ProfileDTOList.fromJson(data, this) : null)
          as T;
    }
    if (t == List<_i8.GameDTO>) {
      return (data as List).map((e) => deserialize<_i8.GameDTO>(e)).toList()
          as dynamic;
    }
    if (t == List<_i8.GameSystemDTO>) {
      return (data as List)
          .map((e) => deserialize<_i8.GameSystemDTO>(e))
          .toList() as dynamic;
    }
    if (t == List<_i8.ProfileDTO>) {
      return (data as List).map((e) => deserialize<_i8.ProfileDTO>(e)).toList()
          as dynamic;
    }
    try {
      return _i9.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i9.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
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
    if (data is _i6.ProfileDTO) {
      return 'ProfileDTO';
    }
    if (data is _i7.ProfileDTOList) {
      return 'ProfileDTOList';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i9.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'GameDTO') {
      return deserialize<_i2.GameDTO>(data['data']);
    }
    if (data['className'] == 'GameDTOList') {
      return deserialize<_i3.GameDTOList>(data['data']);
    }
    if (data['className'] == 'GameSystemDTO') {
      return deserialize<_i4.GameSystemDTO>(data['data']);
    }
    if (data['className'] == 'GameSystemDTOList') {
      return deserialize<_i5.GameSystemDTOList>(data['data']);
    }
    if (data['className'] == 'ProfileDTO') {
      return deserialize<_i6.ProfileDTO>(data['data']);
    }
    if (data['className'] == 'ProfileDTOList') {
      return deserialize<_i7.ProfileDTOList>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}

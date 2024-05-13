/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/module.dart' as _i3;
import 'food.dart' as _i4;
import 'food_list.dart' as _i5;
import 'game.dart' as _i6;
import 'game_list.dart' as _i7;
import 'game_system.dart' as _i8;
import 'game_system_list.dart' as _i9;
import 'movie.dart' as _i10;
import 'movie_list.dart' as _i11;
import 'profile.dart' as _i12;
import 'profile_list.dart' as _i13;
import 'protocol.dart' as _i14;
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

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'food',
      dartName: 'FoodDTO',
      schema: 'public',
      module: 'houston',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'food_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'uid',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'price',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'calories',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'imageUrl',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'food_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'game',
      dartName: 'GameDTO',
      schema: 'public',
      module: 'houston',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'game_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'uid',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'gameSystem',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'protocol:GameSystemDTO',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'price',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'players',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'imageUrl',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'game_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'game_system',
      dartName: 'GameSystemDTO',
      schema: 'public',
      module: 'houston',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'game_system_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'uid',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'price',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'imageUrl',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'game_system_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'movie',
      dartName: 'MovieDTO',
      schema: 'public',
      module: 'houston',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'movie_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'uid',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'year',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'imageUrl',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'movie_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'profile',
      dartName: 'ProfileDTO',
      schema: 'public',
      module: 'houston',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'profile_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'uid',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'username',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'firstName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'lastName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'avatar',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'bio',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'profile_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i4.FoodDTO) {
      return _i4.FoodDTO.fromJson(data, this) as T;
    }
    if (t == _i5.FoodDTOList) {
      return _i5.FoodDTOList.fromJson(data, this) as T;
    }
    if (t == _i6.GameDTO) {
      return _i6.GameDTO.fromJson(data, this) as T;
    }
    if (t == _i7.GameDTOList) {
      return _i7.GameDTOList.fromJson(data, this) as T;
    }
    if (t == _i8.GameSystemDTO) {
      return _i8.GameSystemDTO.fromJson(data, this) as T;
    }
    if (t == _i9.GameSystemDTOList) {
      return _i9.GameSystemDTOList.fromJson(data, this) as T;
    }
    if (t == _i10.MovieDTO) {
      return _i10.MovieDTO.fromJson(data, this) as T;
    }
    if (t == _i11.MovieDTOList) {
      return _i11.MovieDTOList.fromJson(data, this) as T;
    }
    if (t == _i12.ProfileDTO) {
      return _i12.ProfileDTO.fromJson(data, this) as T;
    }
    if (t == _i13.ProfileDTOList) {
      return _i13.ProfileDTOList.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i4.FoodDTO?>()) {
      return (data != null ? _i4.FoodDTO.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i5.FoodDTOList?>()) {
      return (data != null ? _i5.FoodDTOList.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i6.GameDTO?>()) {
      return (data != null ? _i6.GameDTO.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i7.GameDTOList?>()) {
      return (data != null ? _i7.GameDTOList.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i8.GameSystemDTO?>()) {
      return (data != null ? _i8.GameSystemDTO.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i9.GameSystemDTOList?>()) {
      return (data != null ? _i9.GameSystemDTOList.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i10.MovieDTO?>()) {
      return (data != null ? _i10.MovieDTO.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i11.MovieDTOList?>()) {
      return (data != null ? _i11.MovieDTOList.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i12.ProfileDTO?>()) {
      return (data != null ? _i12.ProfileDTO.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i13.ProfileDTOList?>()) {
      return (data != null ? _i13.ProfileDTOList.fromJson(data, this) : null)
          as T;
    }
    if (t == List<_i14.FoodDTO>) {
      return (data as List).map((e) => deserialize<_i14.FoodDTO>(e)).toList()
          as dynamic;
    }
    if (t == List<_i14.GameDTO>) {
      return (data as List).map((e) => deserialize<_i14.GameDTO>(e)).toList()
          as dynamic;
    }
    if (t == List<_i14.GameSystemDTO>) {
      return (data as List)
          .map((e) => deserialize<_i14.GameSystemDTO>(e))
          .toList() as dynamic;
    }
    if (t == List<_i14.MovieDTO>) {
      return (data as List).map((e) => deserialize<_i14.MovieDTO>(e)).toList()
          as dynamic;
    }
    if (t == List<_i14.ProfileDTO>) {
      return (data as List).map((e) => deserialize<_i14.ProfileDTO>(e)).toList()
          as dynamic;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    String? className;
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    if (data is _i4.FoodDTO) {
      return 'FoodDTO';
    }
    if (data is _i5.FoodDTOList) {
      return 'FoodDTOList';
    }
    if (data is _i6.GameDTO) {
      return 'GameDTO';
    }
    if (data is _i7.GameDTOList) {
      return 'GameDTOList';
    }
    if (data is _i8.GameSystemDTO) {
      return 'GameSystemDTO';
    }
    if (data is _i9.GameSystemDTOList) {
      return 'GameSystemDTOList';
    }
    if (data is _i10.MovieDTO) {
      return 'MovieDTO';
    }
    if (data is _i11.MovieDTOList) {
      return 'MovieDTOList';
    }
    if (data is _i12.ProfileDTO) {
      return 'ProfileDTO';
    }
    if (data is _i13.ProfileDTOList) {
      return 'ProfileDTOList';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'].startsWith('serverpod_auth.')) {
      data['className'] = data['className'].substring(15);
      return _i3.Protocol().deserializeByClassName(data);
    }
    if (data['className'] == 'FoodDTO') {
      return deserialize<_i4.FoodDTO>(data['data']);
    }
    if (data['className'] == 'FoodDTOList') {
      return deserialize<_i5.FoodDTOList>(data['data']);
    }
    if (data['className'] == 'GameDTO') {
      return deserialize<_i6.GameDTO>(data['data']);
    }
    if (data['className'] == 'GameDTOList') {
      return deserialize<_i7.GameDTOList>(data['data']);
    }
    if (data['className'] == 'GameSystemDTO') {
      return deserialize<_i8.GameSystemDTO>(data['data']);
    }
    if (data['className'] == 'GameSystemDTOList') {
      return deserialize<_i9.GameSystemDTOList>(data['data']);
    }
    if (data['className'] == 'MovieDTO') {
      return deserialize<_i10.MovieDTO>(data['data']);
    }
    if (data['className'] == 'MovieDTOList') {
      return deserialize<_i11.MovieDTOList>(data['data']);
    }
    if (data['className'] == 'ProfileDTO') {
      return deserialize<_i12.ProfileDTO>(data['data']);
    }
    if (data['className'] == 'ProfileDTOList') {
      return deserialize<_i13.ProfileDTOList>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i4.FoodDTO:
        return _i4.FoodDTO.t;
      case _i6.GameDTO:
        return _i6.GameDTO.t;
      case _i8.GameSystemDTO:
        return _i8.GameSystemDTO.t;
      case _i10.MovieDTO:
        return _i10.MovieDTO.t;
      case _i12.ProfileDTO:
        return _i12.ProfileDTO.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'houston';
}

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
import 'game.dart' as _i4;
import 'game_list.dart' as _i5;
import 'game_system.dart' as _i6;
import 'game_system_list.dart' as _i7;
import 'profile.dart' as _i8;
import 'profile_list.dart' as _i9;
import 'protocol.dart' as _i10;
export 'game.dart';
export 'game_list.dart';
export 'game_system.dart';
export 'game_system_list.dart';
export 'profile.dart';
export 'profile_list.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
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
    if (t == _i8.ProfileDTO) {
      return _i8.ProfileDTO.fromJson(data, this) as T;
    }
    if (t == _i9.ProfileDTOList) {
      return _i9.ProfileDTOList.fromJson(data, this) as T;
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
    if (t == _i1.getType<_i8.ProfileDTO?>()) {
      return (data != null ? _i8.ProfileDTO.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i9.ProfileDTOList?>()) {
      return (data != null ? _i9.ProfileDTOList.fromJson(data, this) : null)
          as T;
    }
    if (t == List<_i10.GameDTO>) {
      return (data as List).map((e) => deserialize<_i10.GameDTO>(e)).toList()
          as dynamic;
    }
    if (t == List<_i10.GameSystemDTO>) {
      return (data as List)
          .map((e) => deserialize<_i10.GameSystemDTO>(e))
          .toList() as dynamic;
    }
    if (t == List<_i10.ProfileDTO>) {
      return (data as List).map((e) => deserialize<_i10.ProfileDTO>(e)).toList()
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
    if (data is _i8.ProfileDTO) {
      return 'ProfileDTO';
    }
    if (data is _i9.ProfileDTOList) {
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
    if (data['className'] == 'ProfileDTO') {
      return deserialize<_i8.ProfileDTO>(data['data']);
    }
    if (data['className'] == 'ProfileDTOList') {
      return deserialize<_i9.ProfileDTOList>(data['data']);
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
      case _i4.GameDTO:
        return _i4.GameDTO.t;
      case _i6.GameSystemDTO:
        return _i6.GameSystemDTO.t;
      case _i8.ProfileDTO:
        return _i8.ProfileDTO.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'houston';
}

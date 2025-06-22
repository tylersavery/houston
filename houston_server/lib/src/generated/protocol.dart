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
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;
import 'game.dart' as _i4;
import 'game_list.dart' as _i5;
import 'game_system.dart' as _i6;
import 'game_system_list.dart' as _i7;
import 'movie.dart' as _i8;
import 'movie_list.dart' as _i9;
import 'profile.dart' as _i10;
import 'profile_list.dart' as _i11;
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
          columnType: _i2.ColumnType.bigint,
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
          name: 'gameSystemId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
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
          columnType: _i2.ColumnType.bigint,
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
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'game_fk_0',
          columns: ['gameSystemId'],
          referenceTable: 'game_system',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
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
          columnType: _i2.ColumnType.bigint,
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
          columnType: _i2.ColumnType.bigint,
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
          columnType: _i2.ColumnType.bigint,
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
          columnType: _i2.ColumnType.bigint,
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
          columnType: _i2.ColumnType.bigint,
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
    if (t == _i4.GameDTO) {
      return _i4.GameDTO.fromJson(data) as T;
    }
    if (t == _i5.GameDTOList) {
      return _i5.GameDTOList.fromJson(data) as T;
    }
    if (t == _i6.GameSystemDTO) {
      return _i6.GameSystemDTO.fromJson(data) as T;
    }
    if (t == _i7.GameSystemDTOList) {
      return _i7.GameSystemDTOList.fromJson(data) as T;
    }
    if (t == _i8.MovieDTO) {
      return _i8.MovieDTO.fromJson(data) as T;
    }
    if (t == _i9.MovieDTOList) {
      return _i9.MovieDTOList.fromJson(data) as T;
    }
    if (t == _i10.ProfileDTO) {
      return _i10.ProfileDTO.fromJson(data) as T;
    }
    if (t == _i11.ProfileDTOList) {
      return _i11.ProfileDTOList.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.GameDTO?>()) {
      return (data != null ? _i4.GameDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.GameDTOList?>()) {
      return (data != null ? _i5.GameDTOList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.GameSystemDTO?>()) {
      return (data != null ? _i6.GameSystemDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.GameSystemDTOList?>()) {
      return (data != null ? _i7.GameSystemDTOList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.MovieDTO?>()) {
      return (data != null ? _i8.MovieDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.MovieDTOList?>()) {
      return (data != null ? _i9.MovieDTOList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.ProfileDTO?>()) {
      return (data != null ? _i10.ProfileDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.ProfileDTOList?>()) {
      return (data != null ? _i11.ProfileDTOList.fromJson(data) : null) as T;
    }
    if (t == List<_i4.GameDTO>) {
      return (data as List).map((e) => deserialize<_i4.GameDTO>(e)).toList()
          as T;
    }
    if (t == List<_i6.GameSystemDTO>) {
      return (data as List)
          .map((e) => deserialize<_i6.GameSystemDTO>(e))
          .toList() as T;
    }
    if (t == List<_i8.MovieDTO>) {
      return (data as List).map((e) => deserialize<_i8.MovieDTO>(e)).toList()
          as T;
    }
    if (t == List<_i10.ProfileDTO>) {
      return (data as List).map((e) => deserialize<_i10.ProfileDTO>(e)).toList()
          as T;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
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
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
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
      return deserialize<_i4.GameDTO>(data['data']);
    }
    if (dataClassName == 'GameDTOList') {
      return deserialize<_i5.GameDTOList>(data['data']);
    }
    if (dataClassName == 'GameSystemDTO') {
      return deserialize<_i6.GameSystemDTO>(data['data']);
    }
    if (dataClassName == 'GameSystemDTOList') {
      return deserialize<_i7.GameSystemDTOList>(data['data']);
    }
    if (dataClassName == 'MovieDTO') {
      return deserialize<_i8.MovieDTO>(data['data']);
    }
    if (dataClassName == 'MovieDTOList') {
      return deserialize<_i9.MovieDTOList>(data['data']);
    }
    if (dataClassName == 'ProfileDTO') {
      return deserialize<_i10.ProfileDTO>(data['data']);
    }
    if (dataClassName == 'ProfileDTOList') {
      return deserialize<_i11.ProfileDTOList>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i3.Protocol().deserializeByClassName(data);
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
      case _i8.MovieDTO:
        return _i8.MovieDTO.t;
      case _i10.ProfileDTO:
        return _i10.ProfileDTO.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'houston';
}

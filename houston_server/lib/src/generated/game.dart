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

abstract class GameDTO extends _i1.TableRow {
  GameDTO._({
    int? id,
    required this.uid,
    required this.gameSystem,
    required this.name,
    required this.price,
    required this.description,
    required this.players,
    required this.imageUrl,
    required this.createdAt,
  }) : super(id);

  factory GameDTO({
    int? id,
    required String uid,
    required _i2.GameSystemDTO gameSystem,
    required String name,
    required double price,
    required String description,
    required int players,
    required String imageUrl,
    required DateTime createdAt,
  }) = _GameDTOImpl;

  factory GameDTO.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return GameDTO(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      uid: serializationManager.deserialize<String>(jsonSerialization['uid']),
      gameSystem: serializationManager
          .deserialize<_i2.GameSystemDTO>(jsonSerialization['gameSystem']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      price:
          serializationManager.deserialize<double>(jsonSerialization['price']),
      description: serializationManager
          .deserialize<String>(jsonSerialization['description']),
      players:
          serializationManager.deserialize<int>(jsonSerialization['players']),
      imageUrl: serializationManager
          .deserialize<String>(jsonSerialization['imageUrl']),
      createdAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['createdAt']),
    );
  }

  static final t = GameDTOTable();

  static const db = GameDTORepository._();

  String uid;

  _i2.GameSystemDTO gameSystem;

  String name;

  double price;

  String description;

  int players;

  String imageUrl;

  DateTime createdAt;

  @override
  _i1.Table get table => t;

  GameDTO copyWith({
    int? id,
    String? uid,
    _i2.GameSystemDTO? gameSystem,
    String? name,
    double? price,
    String? description,
    int? players,
    String? imageUrl,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'uid': uid,
      'gameSystem': gameSystem.toJson(),
      'name': name,
      'price': price,
      'description': description,
      'players': players,
      'imageUrl': imageUrl,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'uid': uid,
      'gameSystem': gameSystem,
      'name': name,
      'price': price,
      'description': description,
      'players': players,
      'imageUrl': imageUrl,
      'createdAt': createdAt,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'uid': uid,
      'gameSystem': gameSystem.allToJson(),
      'name': name,
      'price': price,
      'description': description,
      'players': players,
      'imageUrl': imageUrl,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  @Deprecated('Will be removed in 2.0.0')
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'uid':
        uid = value;
        return;
      case 'gameSystem':
        gameSystem = value;
        return;
      case 'name':
        name = value;
        return;
      case 'price':
        price = value;
        return;
      case 'description':
        description = value;
        return;
      case 'players':
        players = value;
        return;
      case 'imageUrl':
        imageUrl = value;
        return;
      case 'createdAt':
        createdAt = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<GameDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GameDTOTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<GameDTO>(
      where: where != null ? where(GameDTO.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findRow instead.')
  static Future<GameDTO?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GameDTOTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<GameDTO>(
      where: where != null ? where(GameDTO.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<GameDTO?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<GameDTO>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<GameDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<GameDTO>(
      where: where(GameDTO.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    GameDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.update instead.')
  static Future<bool> update(
    _i1.Session session,
    GameDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  @Deprecated(
      'Will be removed in 2.0.0. Use: db.insert instead. Important note: In db.insert, the object you pass in is no longer modified, instead a new copy with the added row is returned which contains the inserted id.')
  static Future<void> insert(
    _i1.Session session,
    GameDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.count instead.')
  static Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GameDTOTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<GameDTO>(
      where: where != null ? where(GameDTO.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static GameDTOInclude include() {
    return GameDTOInclude._();
  }

  static GameDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<GameDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GameDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GameDTOTable>? orderByList,
    GameDTOInclude? include,
  }) {
    return GameDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(GameDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(GameDTO.t),
      include: include,
    );
  }
}

class _Undefined {}

class _GameDTOImpl extends GameDTO {
  _GameDTOImpl({
    int? id,
    required String uid,
    required _i2.GameSystemDTO gameSystem,
    required String name,
    required double price,
    required String description,
    required int players,
    required String imageUrl,
    required DateTime createdAt,
  }) : super._(
          id: id,
          uid: uid,
          gameSystem: gameSystem,
          name: name,
          price: price,
          description: description,
          players: players,
          imageUrl: imageUrl,
          createdAt: createdAt,
        );

  @override
  GameDTO copyWith({
    Object? id = _Undefined,
    String? uid,
    _i2.GameSystemDTO? gameSystem,
    String? name,
    double? price,
    String? description,
    int? players,
    String? imageUrl,
    DateTime? createdAt,
  }) {
    return GameDTO(
      id: id is int? ? id : this.id,
      uid: uid ?? this.uid,
      gameSystem: gameSystem ?? this.gameSystem.copyWith(),
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      players: players ?? this.players,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class GameDTOTable extends _i1.Table {
  GameDTOTable({super.tableRelation}) : super(tableName: 'game') {
    uid = _i1.ColumnString(
      'uid',
      this,
    );
    gameSystem = _i1.ColumnSerializable(
      'gameSystem',
      this,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
    price = _i1.ColumnDouble(
      'price',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    players = _i1.ColumnInt(
      'players',
      this,
    );
    imageUrl = _i1.ColumnString(
      'imageUrl',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final _i1.ColumnString uid;

  late final _i1.ColumnSerializable gameSystem;

  late final _i1.ColumnString name;

  late final _i1.ColumnDouble price;

  late final _i1.ColumnString description;

  late final _i1.ColumnInt players;

  late final _i1.ColumnString imageUrl;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
        id,
        uid,
        gameSystem,
        name,
        price,
        description,
        players,
        imageUrl,
        createdAt,
      ];
}

@Deprecated('Use GameDTOTable.t instead.')
GameDTOTable tGameDTO = GameDTOTable();

class GameDTOInclude extends _i1.IncludeObject {
  GameDTOInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => GameDTO.t;
}

class GameDTOIncludeList extends _i1.IncludeList {
  GameDTOIncludeList._({
    _i1.WhereExpressionBuilder<GameDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(GameDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => GameDTO.t;
}

class GameDTORepository {
  const GameDTORepository._();

  Future<List<GameDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GameDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GameDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GameDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.find<GameDTO>(
      where: where?.call(GameDTO.t),
      orderBy: orderBy?.call(GameDTO.t),
      orderByList: orderByList?.call(GameDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<GameDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GameDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<GameDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GameDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findFirstRow<GameDTO>(
      where: where?.call(GameDTO.t),
      orderBy: orderBy?.call(GameDTO.t),
      orderByList: orderByList?.call(GameDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<GameDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findById<GameDTO>(
      id,
      transaction: transaction,
    );
  }

  Future<List<GameDTO>> insert(
    _i1.Session session,
    List<GameDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<GameDTO>(
      rows,
      transaction: transaction,
    );
  }

  Future<GameDTO> insertRow(
    _i1.Session session,
    GameDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<GameDTO>(
      row,
      transaction: transaction,
    );
  }

  Future<List<GameDTO>> update(
    _i1.Session session,
    List<GameDTO> rows, {
    _i1.ColumnSelections<GameDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<GameDTO>(
      rows,
      columns: columns?.call(GameDTO.t),
      transaction: transaction,
    );
  }

  Future<GameDTO> updateRow(
    _i1.Session session,
    GameDTO row, {
    _i1.ColumnSelections<GameDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<GameDTO>(
      row,
      columns: columns?.call(GameDTO.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<GameDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<GameDTO>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    GameDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<GameDTO>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<GameDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<GameDTO>(
      where: where(GameDTO.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GameDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<GameDTO>(
      where: where?.call(GameDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

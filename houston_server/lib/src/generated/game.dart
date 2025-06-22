/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'game_system.dart' as _i2;

abstract class GameDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  GameDTO._({
    this.id,
    required this.uid,
    required this.gameSystemId,
    this.gameSystem,
    required this.name,
    required this.price,
    required this.description,
    required this.players,
    required this.imageUrl,
    required this.createdAt,
  });

  factory GameDTO({
    int? id,
    required String uid,
    required int gameSystemId,
    _i2.GameSystemDTO? gameSystem,
    required String name,
    required double price,
    required String description,
    required int players,
    required String imageUrl,
    required DateTime createdAt,
  }) = _GameDTOImpl;

  factory GameDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return GameDTO(
      id: jsonSerialization['id'] as int?,
      uid: jsonSerialization['uid'] as String,
      gameSystemId: jsonSerialization['gameSystemId'] as int,
      gameSystem: jsonSerialization['gameSystem'] == null
          ? null
          : _i2.GameSystemDTO.fromJson(
              (jsonSerialization['gameSystem'] as Map<String, dynamic>)),
      name: jsonSerialization['name'] as String,
      price: (jsonSerialization['price'] as num).toDouble(),
      description: jsonSerialization['description'] as String,
      players: jsonSerialization['players'] as int,
      imageUrl: jsonSerialization['imageUrl'] as String,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = GameDTOTable();

  static const db = GameDTORepository._();

  @override
  int? id;

  String uid;

  int gameSystemId;

  _i2.GameSystemDTO? gameSystem;

  String name;

  double price;

  String description;

  int players;

  String imageUrl;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [GameDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GameDTO copyWith({
    int? id,
    String? uid,
    int? gameSystemId,
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
      'gameSystemId': gameSystemId,
      if (gameSystem != null) 'gameSystem': gameSystem?.toJson(),
      'name': name,
      'price': price,
      'description': description,
      'players': players,
      'imageUrl': imageUrl,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'uid': uid,
      'gameSystemId': gameSystemId,
      if (gameSystem != null) 'gameSystem': gameSystem?.toJsonForProtocol(),
      'name': name,
      'price': price,
      'description': description,
      'players': players,
      'imageUrl': imageUrl,
      'createdAt': createdAt.toJson(),
    };
  }

  static GameDTOInclude include({_i2.GameSystemDTOInclude? gameSystem}) {
    return GameDTOInclude._(gameSystem: gameSystem);
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

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GameDTOImpl extends GameDTO {
  _GameDTOImpl({
    int? id,
    required String uid,
    required int gameSystemId,
    _i2.GameSystemDTO? gameSystem,
    required String name,
    required double price,
    required String description,
    required int players,
    required String imageUrl,
    required DateTime createdAt,
  }) : super._(
          id: id,
          uid: uid,
          gameSystemId: gameSystemId,
          gameSystem: gameSystem,
          name: name,
          price: price,
          description: description,
          players: players,
          imageUrl: imageUrl,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [GameDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GameDTO copyWith({
    Object? id = _Undefined,
    String? uid,
    int? gameSystemId,
    Object? gameSystem = _Undefined,
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
      gameSystemId: gameSystemId ?? this.gameSystemId,
      gameSystem: gameSystem is _i2.GameSystemDTO?
          ? gameSystem
          : this.gameSystem?.copyWith(),
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      players: players ?? this.players,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class GameDTOTable extends _i1.Table<int?> {
  GameDTOTable({super.tableRelation}) : super(tableName: 'game') {
    uid = _i1.ColumnString(
      'uid',
      this,
    );
    gameSystemId = _i1.ColumnInt(
      'gameSystemId',
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

  late final _i1.ColumnInt gameSystemId;

  _i2.GameSystemDTOTable? _gameSystem;

  late final _i1.ColumnString name;

  late final _i1.ColumnDouble price;

  late final _i1.ColumnString description;

  late final _i1.ColumnInt players;

  late final _i1.ColumnString imageUrl;

  late final _i1.ColumnDateTime createdAt;

  _i2.GameSystemDTOTable get gameSystem {
    if (_gameSystem != null) return _gameSystem!;
    _gameSystem = _i1.createRelationTable(
      relationFieldName: 'gameSystem',
      field: GameDTO.t.gameSystemId,
      foreignField: _i2.GameSystemDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.GameSystemDTOTable(tableRelation: foreignTableRelation),
    );
    return _gameSystem!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        uid,
        gameSystemId,
        name,
        price,
        description,
        players,
        imageUrl,
        createdAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'gameSystem') {
      return gameSystem;
    }
    return null;
  }
}

class GameDTOInclude extends _i1.IncludeObject {
  GameDTOInclude._({_i2.GameSystemDTOInclude? gameSystem}) {
    _gameSystem = gameSystem;
  }

  _i2.GameSystemDTOInclude? _gameSystem;

  @override
  Map<String, _i1.Include?> get includes => {'gameSystem': _gameSystem};

  @override
  _i1.Table<int?> get table => GameDTO.t;
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
  _i1.Table<int?> get table => GameDTO.t;
}

class GameDTORepository {
  const GameDTORepository._();

  final attachRow = const GameDTOAttachRowRepository._();

  /// Returns a list of [GameDTO]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<GameDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GameDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GameDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GameDTOTable>? orderByList,
    _i1.Transaction? transaction,
    GameDTOInclude? include,
  }) async {
    return session.db.find<GameDTO>(
      where: where?.call(GameDTO.t),
      orderBy: orderBy?.call(GameDTO.t),
      orderByList: orderByList?.call(GameDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [GameDTO] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<GameDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GameDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<GameDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GameDTOTable>? orderByList,
    _i1.Transaction? transaction,
    GameDTOInclude? include,
  }) async {
    return session.db.findFirstRow<GameDTO>(
      where: where?.call(GameDTO.t),
      orderBy: orderBy?.call(GameDTO.t),
      orderByList: orderByList?.call(GameDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [GameDTO] by its [id] or null if no such row exists.
  Future<GameDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    GameDTOInclude? include,
  }) async {
    return session.db.findById<GameDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [GameDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [GameDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<GameDTO>> insert(
    _i1.Session session,
    List<GameDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<GameDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [GameDTO] and returns the inserted row.
  ///
  /// The returned [GameDTO] will have its `id` field set.
  Future<GameDTO> insertRow(
    _i1.Session session,
    GameDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<GameDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [GameDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<GameDTO>> update(
    _i1.Session session,
    List<GameDTO> rows, {
    _i1.ColumnSelections<GameDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<GameDTO>(
      rows,
      columns: columns?.call(GameDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [GameDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<GameDTO> updateRow(
    _i1.Session session,
    GameDTO row, {
    _i1.ColumnSelections<GameDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<GameDTO>(
      row,
      columns: columns?.call(GameDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [GameDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<GameDTO>> delete(
    _i1.Session session,
    List<GameDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<GameDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [GameDTO].
  Future<GameDTO> deleteRow(
    _i1.Session session,
    GameDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<GameDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<GameDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<GameDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<GameDTO>(
      where: where(GameDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GameDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<GameDTO>(
      where: where?.call(GameDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class GameDTOAttachRowRepository {
  const GameDTOAttachRowRepository._();

  /// Creates a relation between the given [GameDTO] and [GameSystemDTO]
  /// by setting the [GameDTO]'s foreign key `gameSystemId` to refer to the [GameSystemDTO].
  Future<void> gameSystem(
    _i1.Session session,
    GameDTO gameDTO,
    _i2.GameSystemDTO gameSystem, {
    _i1.Transaction? transaction,
  }) async {
    if (gameDTO.id == null) {
      throw ArgumentError.notNull('gameDTO.id');
    }
    if (gameSystem.id == null) {
      throw ArgumentError.notNull('gameSystem.id');
    }

    var $gameDTO = gameDTO.copyWith(gameSystemId: gameSystem.id);
    await session.db.updateRow<GameDTO>(
      $gameDTO,
      columns: [GameDTO.t.gameSystemId],
      transaction: transaction,
    );
  }
}

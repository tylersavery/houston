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

abstract class GameSystemDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  GameSystemDTO._({
    this.id,
    required this.uid,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.createdAt,
  });

  factory GameSystemDTO({
    int? id,
    required String uid,
    required String name,
    required double price,
    required String description,
    required String imageUrl,
    required DateTime createdAt,
  }) = _GameSystemDTOImpl;

  factory GameSystemDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return GameSystemDTO(
      id: jsonSerialization['id'] as int?,
      uid: jsonSerialization['uid'] as String,
      name: jsonSerialization['name'] as String,
      price: (jsonSerialization['price'] as num).toDouble(),
      description: jsonSerialization['description'] as String,
      imageUrl: jsonSerialization['imageUrl'] as String,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = GameSystemDTOTable();

  static const db = GameSystemDTORepository._();

  @override
  int? id;

  String uid;

  String name;

  double price;

  String description;

  String imageUrl;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [GameSystemDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GameSystemDTO copyWith({
    int? id,
    String? uid,
    String? name,
    double? price,
    String? description,
    String? imageUrl,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'uid': uid,
      'name': name,
      'price': price,
      'description': description,
      'imageUrl': imageUrl,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'uid': uid,
      'name': name,
      'price': price,
      'description': description,
      'imageUrl': imageUrl,
      'createdAt': createdAt.toJson(),
    };
  }

  static GameSystemDTOInclude include() {
    return GameSystemDTOInclude._();
  }

  static GameSystemDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<GameSystemDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GameSystemDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GameSystemDTOTable>? orderByList,
    GameSystemDTOInclude? include,
  }) {
    return GameSystemDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(GameSystemDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(GameSystemDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _GameSystemDTOImpl extends GameSystemDTO {
  _GameSystemDTOImpl({
    int? id,
    required String uid,
    required String name,
    required double price,
    required String description,
    required String imageUrl,
    required DateTime createdAt,
  }) : super._(
          id: id,
          uid: uid,
          name: name,
          price: price,
          description: description,
          imageUrl: imageUrl,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [GameSystemDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GameSystemDTO copyWith({
    Object? id = _Undefined,
    String? uid,
    String? name,
    double? price,
    String? description,
    String? imageUrl,
    DateTime? createdAt,
  }) {
    return GameSystemDTO(
      id: id is int? ? id : this.id,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class GameSystemDTOTable extends _i1.Table<int?> {
  GameSystemDTOTable({super.tableRelation}) : super(tableName: 'game_system') {
    uid = _i1.ColumnString(
      'uid',
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

  late final _i1.ColumnString name;

  late final _i1.ColumnDouble price;

  late final _i1.ColumnString description;

  late final _i1.ColumnString imageUrl;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
        id,
        uid,
        name,
        price,
        description,
        imageUrl,
        createdAt,
      ];
}

class GameSystemDTOInclude extends _i1.IncludeObject {
  GameSystemDTOInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => GameSystemDTO.t;
}

class GameSystemDTOIncludeList extends _i1.IncludeList {
  GameSystemDTOIncludeList._({
    _i1.WhereExpressionBuilder<GameSystemDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(GameSystemDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => GameSystemDTO.t;
}

class GameSystemDTORepository {
  const GameSystemDTORepository._();

  /// Returns a list of [GameSystemDTO]s matching the given query parameters.
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
  Future<List<GameSystemDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GameSystemDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<GameSystemDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GameSystemDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<GameSystemDTO>(
      where: where?.call(GameSystemDTO.t),
      orderBy: orderBy?.call(GameSystemDTO.t),
      orderByList: orderByList?.call(GameSystemDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [GameSystemDTO] matching the given query parameters.
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
  Future<GameSystemDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GameSystemDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<GameSystemDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GameSystemDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<GameSystemDTO>(
      where: where?.call(GameSystemDTO.t),
      orderBy: orderBy?.call(GameSystemDTO.t),
      orderByList: orderByList?.call(GameSystemDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [GameSystemDTO] by its [id] or null if no such row exists.
  Future<GameSystemDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<GameSystemDTO>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [GameSystemDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [GameSystemDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<GameSystemDTO>> insert(
    _i1.Session session,
    List<GameSystemDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<GameSystemDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [GameSystemDTO] and returns the inserted row.
  ///
  /// The returned [GameSystemDTO] will have its `id` field set.
  Future<GameSystemDTO> insertRow(
    _i1.Session session,
    GameSystemDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<GameSystemDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [GameSystemDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<GameSystemDTO>> update(
    _i1.Session session,
    List<GameSystemDTO> rows, {
    _i1.ColumnSelections<GameSystemDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<GameSystemDTO>(
      rows,
      columns: columns?.call(GameSystemDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [GameSystemDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<GameSystemDTO> updateRow(
    _i1.Session session,
    GameSystemDTO row, {
    _i1.ColumnSelections<GameSystemDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<GameSystemDTO>(
      row,
      columns: columns?.call(GameSystemDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [GameSystemDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<GameSystemDTO>> delete(
    _i1.Session session,
    List<GameSystemDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<GameSystemDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [GameSystemDTO].
  Future<GameSystemDTO> deleteRow(
    _i1.Session session,
    GameSystemDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<GameSystemDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<GameSystemDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<GameSystemDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<GameSystemDTO>(
      where: where(GameSystemDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GameSystemDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<GameSystemDTO>(
      where: where?.call(GameSystemDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class GameSystemDTO extends _i1.TableRow {
  GameSystemDTO._({
    int? id,
    required this.uid,
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.createdAt,
  }) : super(id);

  factory GameSystemDTO({
    int? id,
    required String uid,
    required String name,
    required double price,
    required String description,
    required String imageUrl,
    required DateTime createdAt,
  }) = _GameSystemDTOImpl;

  factory GameSystemDTO.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return GameSystemDTO(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      uid: serializationManager.deserialize<String>(jsonSerialization['uid']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      price:
          serializationManager.deserialize<double>(jsonSerialization['price']),
      description: serializationManager
          .deserialize<String>(jsonSerialization['description']),
      imageUrl: serializationManager
          .deserialize<String>(jsonSerialization['imageUrl']),
      createdAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['createdAt']),
    );
  }

  static final t = GameSystemDTOTable();

  static const db = GameSystemDTORepository._();

  String uid;

  String name;

  double price;

  String description;

  String imageUrl;

  DateTime createdAt;

  @override
  _i1.Table get table => t;

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
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'uid': uid,
      'name': name,
      'price': price,
      'description': description,
      'imageUrl': imageUrl,
      'createdAt': createdAt,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
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
      case 'name':
        name = value;
        return;
      case 'price':
        price = value;
        return;
      case 'description':
        description = value;
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
  static Future<List<GameSystemDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GameSystemDTOTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<GameSystemDTO>(
      where: where != null ? where(GameSystemDTO.t) : null,
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
  static Future<GameSystemDTO?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GameSystemDTOTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<GameSystemDTO>(
      where: where != null ? where(GameSystemDTO.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<GameSystemDTO?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<GameSystemDTO>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<GameSystemDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<GameSystemDTO>(
      where: where(GameSystemDTO.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    GameSystemDTO row, {
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
    GameSystemDTO row, {
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
    GameSystemDTO row, {
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
    _i1.WhereExpressionBuilder<GameSystemDTOTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<GameSystemDTO>(
      where: where != null ? where(GameSystemDTO.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
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

class GameSystemDTOTable extends _i1.Table {
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

@Deprecated('Use GameSystemDTOTable.t instead.')
GameSystemDTOTable tGameSystemDTO = GameSystemDTOTable();

class GameSystemDTOInclude extends _i1.IncludeObject {
  GameSystemDTOInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => GameSystemDTO.t;
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
  _i1.Table get table => GameSystemDTO.t;
}

class GameSystemDTORepository {
  const GameSystemDTORepository._();

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
    return session.dbNext.find<GameSystemDTO>(
      where: where?.call(GameSystemDTO.t),
      orderBy: orderBy?.call(GameSystemDTO.t),
      orderByList: orderByList?.call(GameSystemDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<GameSystemDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GameSystemDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<GameSystemDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<GameSystemDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findFirstRow<GameSystemDTO>(
      where: where?.call(GameSystemDTO.t),
      orderBy: orderBy?.call(GameSystemDTO.t),
      orderByList: orderByList?.call(GameSystemDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<GameSystemDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findById<GameSystemDTO>(
      id,
      transaction: transaction,
    );
  }

  Future<List<GameSystemDTO>> insert(
    _i1.Session session,
    List<GameSystemDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<GameSystemDTO>(
      rows,
      transaction: transaction,
    );
  }

  Future<GameSystemDTO> insertRow(
    _i1.Session session,
    GameSystemDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<GameSystemDTO>(
      row,
      transaction: transaction,
    );
  }

  Future<List<GameSystemDTO>> update(
    _i1.Session session,
    List<GameSystemDTO> rows, {
    _i1.ColumnSelections<GameSystemDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<GameSystemDTO>(
      rows,
      columns: columns?.call(GameSystemDTO.t),
      transaction: transaction,
    );
  }

  Future<GameSystemDTO> updateRow(
    _i1.Session session,
    GameSystemDTO row, {
    _i1.ColumnSelections<GameSystemDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<GameSystemDTO>(
      row,
      columns: columns?.call(GameSystemDTO.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<GameSystemDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<GameSystemDTO>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    GameSystemDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<GameSystemDTO>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<GameSystemDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<GameSystemDTO>(
      where: where(GameSystemDTO.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<GameSystemDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<GameSystemDTO>(
      where: where?.call(GameSystemDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

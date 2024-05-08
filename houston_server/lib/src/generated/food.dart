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

abstract class FoodDTO extends _i1.TableRow {
  FoodDTO._({
    int? id,
    required this.uid,
    required this.name,
    required this.price,
    required this.description,
    required this.calories,
    required this.imageUrl,
    required this.createdAt,
  }) : super(id);

  factory FoodDTO({
    int? id,
    required String uid,
    required String name,
    required double price,
    required String description,
    required int calories,
    required String imageUrl,
    required DateTime createdAt,
  }) = _FoodDTOImpl;

  factory FoodDTO.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return FoodDTO(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      uid: serializationManager.deserialize<String>(jsonSerialization['uid']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      price:
          serializationManager.deserialize<double>(jsonSerialization['price']),
      description: serializationManager
          .deserialize<String>(jsonSerialization['description']),
      calories:
          serializationManager.deserialize<int>(jsonSerialization['calories']),
      imageUrl: serializationManager
          .deserialize<String>(jsonSerialization['imageUrl']),
      createdAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['createdAt']),
    );
  }

  static final t = FoodDTOTable();

  static const db = FoodDTORepository._();

  String uid;

  String name;

  double price;

  String description;

  int calories;

  String imageUrl;

  DateTime createdAt;

  @override
  _i1.Table get table => t;

  FoodDTO copyWith({
    int? id,
    String? uid,
    String? name,
    double? price,
    String? description,
    int? calories,
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
      'calories': calories,
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
      'calories': calories,
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
      'calories': calories,
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
      case 'calories':
        calories = value;
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
  static Future<List<FoodDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FoodDTOTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<FoodDTO>(
      where: where != null ? where(FoodDTO.t) : null,
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
  static Future<FoodDTO?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FoodDTOTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<FoodDTO>(
      where: where != null ? where(FoodDTO.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<FoodDTO?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<FoodDTO>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<FoodDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<FoodDTO>(
      where: where(FoodDTO.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    FoodDTO row, {
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
    FoodDTO row, {
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
    FoodDTO row, {
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
    _i1.WhereExpressionBuilder<FoodDTOTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<FoodDTO>(
      where: where != null ? where(FoodDTO.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static FoodDTOInclude include() {
    return FoodDTOInclude._();
  }

  static FoodDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<FoodDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FoodDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FoodDTOTable>? orderByList,
    FoodDTOInclude? include,
  }) {
    return FoodDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(FoodDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(FoodDTO.t),
      include: include,
    );
  }
}

class _Undefined {}

class _FoodDTOImpl extends FoodDTO {
  _FoodDTOImpl({
    int? id,
    required String uid,
    required String name,
    required double price,
    required String description,
    required int calories,
    required String imageUrl,
    required DateTime createdAt,
  }) : super._(
          id: id,
          uid: uid,
          name: name,
          price: price,
          description: description,
          calories: calories,
          imageUrl: imageUrl,
          createdAt: createdAt,
        );

  @override
  FoodDTO copyWith({
    Object? id = _Undefined,
    String? uid,
    String? name,
    double? price,
    String? description,
    int? calories,
    String? imageUrl,
    DateTime? createdAt,
  }) {
    return FoodDTO(
      id: id is int? ? id : this.id,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      calories: calories ?? this.calories,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class FoodDTOTable extends _i1.Table {
  FoodDTOTable({super.tableRelation}) : super(tableName: 'food') {
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
    calories = _i1.ColumnInt(
      'calories',
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

  late final _i1.ColumnInt calories;

  late final _i1.ColumnString imageUrl;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
        id,
        uid,
        name,
        price,
        description,
        calories,
        imageUrl,
        createdAt,
      ];
}

@Deprecated('Use FoodDTOTable.t instead.')
FoodDTOTable tFoodDTO = FoodDTOTable();

class FoodDTOInclude extends _i1.IncludeObject {
  FoodDTOInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => FoodDTO.t;
}

class FoodDTOIncludeList extends _i1.IncludeList {
  FoodDTOIncludeList._({
    _i1.WhereExpressionBuilder<FoodDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(FoodDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => FoodDTO.t;
}

class FoodDTORepository {
  const FoodDTORepository._();

  Future<List<FoodDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FoodDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FoodDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FoodDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.find<FoodDTO>(
      where: where?.call(FoodDTO.t),
      orderBy: orderBy?.call(FoodDTO.t),
      orderByList: orderByList?.call(FoodDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<FoodDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FoodDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<FoodDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FoodDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findFirstRow<FoodDTO>(
      where: where?.call(FoodDTO.t),
      orderBy: orderBy?.call(FoodDTO.t),
      orderByList: orderByList?.call(FoodDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<FoodDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findById<FoodDTO>(
      id,
      transaction: transaction,
    );
  }

  Future<List<FoodDTO>> insert(
    _i1.Session session,
    List<FoodDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<FoodDTO>(
      rows,
      transaction: transaction,
    );
  }

  Future<FoodDTO> insertRow(
    _i1.Session session,
    FoodDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<FoodDTO>(
      row,
      transaction: transaction,
    );
  }

  Future<List<FoodDTO>> update(
    _i1.Session session,
    List<FoodDTO> rows, {
    _i1.ColumnSelections<FoodDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<FoodDTO>(
      rows,
      columns: columns?.call(FoodDTO.t),
      transaction: transaction,
    );
  }

  Future<FoodDTO> updateRow(
    _i1.Session session,
    FoodDTO row, {
    _i1.ColumnSelections<FoodDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<FoodDTO>(
      row,
      columns: columns?.call(FoodDTO.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<FoodDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<FoodDTO>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    FoodDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<FoodDTO>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<FoodDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<FoodDTO>(
      where: where(FoodDTO.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FoodDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<FoodDTO>(
      where: where?.call(FoodDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

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

abstract class Food extends _i1.TableRow {
  Food._({
    int? id,
    required this.name,
    required this.price,
    required this.description,
    required this.calories,
    required this.imageUrl,
    required this.createdAt,
  }) : super(id);

  factory Food({
    int? id,
    required String name,
    required double price,
    required String description,
    required int calories,
    required String imageUrl,
    required DateTime createdAt,
  }) = _FoodImpl;

  factory Food.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Food(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
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

  static final t = FoodTable();

  static const db = FoodRepository._();

  String name;

  double price;

  String description;

  int calories;

  String imageUrl;

  DateTime createdAt;

  @override
  _i1.Table get table => t;

  Food copyWith({
    int? id,
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
  static Future<List<Food>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FoodTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Food>(
      where: where != null ? where(Food.t) : null,
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
  static Future<Food?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FoodTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Food>(
      where: where != null ? where(Food.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<Food?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Food>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<FoodTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Food>(
      where: where(Food.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    Food row, {
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
    Food row, {
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
    Food row, {
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
    _i1.WhereExpressionBuilder<FoodTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Food>(
      where: where != null ? where(Food.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static FoodInclude include() {
    return FoodInclude._();
  }

  static FoodIncludeList includeList({
    _i1.WhereExpressionBuilder<FoodTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FoodTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FoodTable>? orderByList,
    FoodInclude? include,
  }) {
    return FoodIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Food.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Food.t),
      include: include,
    );
  }
}

class _Undefined {}

class _FoodImpl extends Food {
  _FoodImpl({
    int? id,
    required String name,
    required double price,
    required String description,
    required int calories,
    required String imageUrl,
    required DateTime createdAt,
  }) : super._(
          id: id,
          name: name,
          price: price,
          description: description,
          calories: calories,
          imageUrl: imageUrl,
          createdAt: createdAt,
        );

  @override
  Food copyWith({
    Object? id = _Undefined,
    String? name,
    double? price,
    String? description,
    int? calories,
    String? imageUrl,
    DateTime? createdAt,
  }) {
    return Food(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      calories: calories ?? this.calories,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class FoodTable extends _i1.Table {
  FoodTable({super.tableRelation}) : super(tableName: 'food') {
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

  late final _i1.ColumnString name;

  late final _i1.ColumnDouble price;

  late final _i1.ColumnString description;

  late final _i1.ColumnInt calories;

  late final _i1.ColumnString imageUrl;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        price,
        description,
        calories,
        imageUrl,
        createdAt,
      ];
}

@Deprecated('Use FoodTable.t instead.')
FoodTable tFood = FoodTable();

class FoodInclude extends _i1.IncludeObject {
  FoodInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Food.t;
}

class FoodIncludeList extends _i1.IncludeList {
  FoodIncludeList._({
    _i1.WhereExpressionBuilder<FoodTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Food.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Food.t;
}

class FoodRepository {
  const FoodRepository._();

  Future<List<Food>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FoodTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FoodTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FoodTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.find<Food>(
      where: where?.call(Food.t),
      orderBy: orderBy?.call(Food.t),
      orderByList: orderByList?.call(Food.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Food?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FoodTable>? where,
    int? offset,
    _i1.OrderByBuilder<FoodTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FoodTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findFirstRow<Food>(
      where: where?.call(Food.t),
      orderBy: orderBy?.call(Food.t),
      orderByList: orderByList?.call(Food.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<Food?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findById<Food>(
      id,
      transaction: transaction,
    );
  }

  Future<List<Food>> insert(
    _i1.Session session,
    List<Food> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<Food>(
      rows,
      transaction: transaction,
    );
  }

  Future<Food> insertRow(
    _i1.Session session,
    Food row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<Food>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Food>> update(
    _i1.Session session,
    List<Food> rows, {
    _i1.ColumnSelections<FoodTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<Food>(
      rows,
      columns: columns?.call(Food.t),
      transaction: transaction,
    );
  }

  Future<Food> updateRow(
    _i1.Session session,
    Food row, {
    _i1.ColumnSelections<FoodTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<Food>(
      row,
      columns: columns?.call(Food.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<Food> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<Food>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    Food row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<Food>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<FoodTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<Food>(
      where: where(Food.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FoodTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<Food>(
      where: where?.call(Food.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

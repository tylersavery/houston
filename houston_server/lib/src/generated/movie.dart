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

abstract class MovieDTO extends _i1.TableRow {
  MovieDTO._({
    int? id,
    required this.uid,
    required this.title,
    required this.year,
    required this.imageUrl,
    required this.createdAt,
  }) : super(id);

  factory MovieDTO({
    int? id,
    required String uid,
    required String title,
    required int year,
    required String imageUrl,
    required DateTime createdAt,
  }) = _MovieDTOImpl;

  factory MovieDTO.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return MovieDTO(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      uid: serializationManager.deserialize<String>(jsonSerialization['uid']),
      title:
          serializationManager.deserialize<String>(jsonSerialization['title']),
      year: serializationManager.deserialize<int>(jsonSerialization['year']),
      imageUrl: serializationManager
          .deserialize<String>(jsonSerialization['imageUrl']),
      createdAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['createdAt']),
    );
  }

  static final t = MovieDTOTable();

  static const db = MovieDTORepository._();

  String uid;

  String title;

  int year;

  String imageUrl;

  DateTime createdAt;

  @override
  _i1.Table get table => t;

  MovieDTO copyWith({
    int? id,
    String? uid,
    String? title,
    int? year,
    String? imageUrl,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'uid': uid,
      'title': title,
      'year': year,
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
      'title': title,
      'year': year,
      'imageUrl': imageUrl,
      'createdAt': createdAt,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      if (id != null) 'id': id,
      'uid': uid,
      'title': title,
      'year': year,
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
      case 'title':
        title = value;
        return;
      case 'year':
        year = value;
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
  static Future<List<MovieDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MovieDTOTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<MovieDTO>(
      where: where != null ? where(MovieDTO.t) : null,
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
  static Future<MovieDTO?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MovieDTOTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<MovieDTO>(
      where: where != null ? where(MovieDTO.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<MovieDTO?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<MovieDTO>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MovieDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<MovieDTO>(
      where: where(MovieDTO.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    MovieDTO row, {
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
    MovieDTO row, {
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
    MovieDTO row, {
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
    _i1.WhereExpressionBuilder<MovieDTOTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<MovieDTO>(
      where: where != null ? where(MovieDTO.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static MovieDTOInclude include() {
    return MovieDTOInclude._();
  }

  static MovieDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<MovieDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MovieDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MovieDTOTable>? orderByList,
    MovieDTOInclude? include,
  }) {
    return MovieDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(MovieDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(MovieDTO.t),
      include: include,
    );
  }
}

class _Undefined {}

class _MovieDTOImpl extends MovieDTO {
  _MovieDTOImpl({
    int? id,
    required String uid,
    required String title,
    required int year,
    required String imageUrl,
    required DateTime createdAt,
  }) : super._(
          id: id,
          uid: uid,
          title: title,
          year: year,
          imageUrl: imageUrl,
          createdAt: createdAt,
        );

  @override
  MovieDTO copyWith({
    Object? id = _Undefined,
    String? uid,
    String? title,
    int? year,
    String? imageUrl,
    DateTime? createdAt,
  }) {
    return MovieDTO(
      id: id is int? ? id : this.id,
      uid: uid ?? this.uid,
      title: title ?? this.title,
      year: year ?? this.year,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class MovieDTOTable extends _i1.Table {
  MovieDTOTable({super.tableRelation}) : super(tableName: 'movie') {
    uid = _i1.ColumnString(
      'uid',
      this,
    );
    title = _i1.ColumnString(
      'title',
      this,
    );
    year = _i1.ColumnInt(
      'year',
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

  late final _i1.ColumnString title;

  late final _i1.ColumnInt year;

  late final _i1.ColumnString imageUrl;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
        id,
        uid,
        title,
        year,
        imageUrl,
        createdAt,
      ];
}

@Deprecated('Use MovieDTOTable.t instead.')
MovieDTOTable tMovieDTO = MovieDTOTable();

class MovieDTOInclude extends _i1.IncludeObject {
  MovieDTOInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => MovieDTO.t;
}

class MovieDTOIncludeList extends _i1.IncludeList {
  MovieDTOIncludeList._({
    _i1.WhereExpressionBuilder<MovieDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(MovieDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => MovieDTO.t;
}

class MovieDTORepository {
  const MovieDTORepository._();

  Future<List<MovieDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MovieDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MovieDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MovieDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.find<MovieDTO>(
      where: where?.call(MovieDTO.t),
      orderBy: orderBy?.call(MovieDTO.t),
      orderByList: orderByList?.call(MovieDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<MovieDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MovieDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<MovieDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MovieDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findFirstRow<MovieDTO>(
      where: where?.call(MovieDTO.t),
      orderBy: orderBy?.call(MovieDTO.t),
      orderByList: orderByList?.call(MovieDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<MovieDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findById<MovieDTO>(
      id,
      transaction: transaction,
    );
  }

  Future<List<MovieDTO>> insert(
    _i1.Session session,
    List<MovieDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<MovieDTO>(
      rows,
      transaction: transaction,
    );
  }

  Future<MovieDTO> insertRow(
    _i1.Session session,
    MovieDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<MovieDTO>(
      row,
      transaction: transaction,
    );
  }

  Future<List<MovieDTO>> update(
    _i1.Session session,
    List<MovieDTO> rows, {
    _i1.ColumnSelections<MovieDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<MovieDTO>(
      rows,
      columns: columns?.call(MovieDTO.t),
      transaction: transaction,
    );
  }

  Future<MovieDTO> updateRow(
    _i1.Session session,
    MovieDTO row, {
    _i1.ColumnSelections<MovieDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<MovieDTO>(
      row,
      columns: columns?.call(MovieDTO.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<MovieDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<MovieDTO>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    MovieDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<MovieDTO>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MovieDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<MovieDTO>(
      where: where(MovieDTO.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MovieDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<MovieDTO>(
      where: where?.call(MovieDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

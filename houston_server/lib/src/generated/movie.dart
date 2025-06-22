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

abstract class MovieDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  MovieDTO._({
    this.id,
    required this.uid,
    required this.title,
    required this.year,
    required this.imageUrl,
    required this.createdAt,
  });

  factory MovieDTO({
    int? id,
    required String uid,
    required String title,
    required int year,
    required String imageUrl,
    required DateTime createdAt,
  }) = _MovieDTOImpl;

  factory MovieDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return MovieDTO(
      id: jsonSerialization['id'] as int?,
      uid: jsonSerialization['uid'] as String,
      title: jsonSerialization['title'] as String,
      year: jsonSerialization['year'] as int,
      imageUrl: jsonSerialization['imageUrl'] as String,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = MovieDTOTable();

  static const db = MovieDTORepository._();

  @override
  int? id;

  String uid;

  String title;

  int year;

  String imageUrl;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [MovieDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'uid': uid,
      'title': title,
      'year': year,
      'imageUrl': imageUrl,
      'createdAt': createdAt.toJson(),
    };
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

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
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

  /// Returns a shallow copy of this [MovieDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
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

class MovieDTOTable extends _i1.Table<int?> {
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

class MovieDTOInclude extends _i1.IncludeObject {
  MovieDTOInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => MovieDTO.t;
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
  _i1.Table<int?> get table => MovieDTO.t;
}

class MovieDTORepository {
  const MovieDTORepository._();

  /// Returns a list of [MovieDTO]s matching the given query parameters.
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
    return session.db.find<MovieDTO>(
      where: where?.call(MovieDTO.t),
      orderBy: orderBy?.call(MovieDTO.t),
      orderByList: orderByList?.call(MovieDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [MovieDTO] matching the given query parameters.
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
  Future<MovieDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MovieDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<MovieDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MovieDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<MovieDTO>(
      where: where?.call(MovieDTO.t),
      orderBy: orderBy?.call(MovieDTO.t),
      orderByList: orderByList?.call(MovieDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [MovieDTO] by its [id] or null if no such row exists.
  Future<MovieDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<MovieDTO>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [MovieDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [MovieDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<MovieDTO>> insert(
    _i1.Session session,
    List<MovieDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<MovieDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [MovieDTO] and returns the inserted row.
  ///
  /// The returned [MovieDTO] will have its `id` field set.
  Future<MovieDTO> insertRow(
    _i1.Session session,
    MovieDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<MovieDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [MovieDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<MovieDTO>> update(
    _i1.Session session,
    List<MovieDTO> rows, {
    _i1.ColumnSelections<MovieDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<MovieDTO>(
      rows,
      columns: columns?.call(MovieDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [MovieDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<MovieDTO> updateRow(
    _i1.Session session,
    MovieDTO row, {
    _i1.ColumnSelections<MovieDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<MovieDTO>(
      row,
      columns: columns?.call(MovieDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [MovieDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<MovieDTO>> delete(
    _i1.Session session,
    List<MovieDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<MovieDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [MovieDTO].
  Future<MovieDTO> deleteRow(
    _i1.Session session,
    MovieDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<MovieDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<MovieDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MovieDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<MovieDTO>(
      where: where(MovieDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MovieDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<MovieDTO>(
      where: where?.call(MovieDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

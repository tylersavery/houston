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

abstract class ProfileDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ProfileDTO._({
    this.id,
    required this.uid,
    required this.userId,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    this.bio,
    required this.createdAt,
  });

  factory ProfileDTO({
    int? id,
    required String uid,
    required int userId,
    required String username,
    required String firstName,
    required String lastName,
    required String avatar,
    String? bio,
    required DateTime createdAt,
  }) = _ProfileDTOImpl;

  factory ProfileDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return ProfileDTO(
      id: jsonSerialization['id'] as int?,
      uid: jsonSerialization['uid'] as String,
      userId: jsonSerialization['userId'] as int,
      username: jsonSerialization['username'] as String,
      firstName: jsonSerialization['firstName'] as String,
      lastName: jsonSerialization['lastName'] as String,
      avatar: jsonSerialization['avatar'] as String,
      bio: jsonSerialization['bio'] as String?,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  static final t = ProfileDTOTable();

  static const db = ProfileDTORepository._();

  @override
  int? id;

  String uid;

  int userId;

  String username;

  String firstName;

  String lastName;

  String avatar;

  String? bio;

  DateTime createdAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ProfileDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProfileDTO copyWith({
    int? id,
    String? uid,
    int? userId,
    String? username,
    String? firstName,
    String? lastName,
    String? avatar,
    String? bio,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'uid': uid,
      'userId': userId,
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'avatar': avatar,
      if (bio != null) 'bio': bio,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'uid': uid,
      'userId': userId,
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'avatar': avatar,
      if (bio != null) 'bio': bio,
      'createdAt': createdAt.toJson(),
    };
  }

  static ProfileDTOInclude include() {
    return ProfileDTOInclude._();
  }

  static ProfileDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<ProfileDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProfileDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProfileDTOTable>? orderByList,
    ProfileDTOInclude? include,
  }) {
    return ProfileDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProfileDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ProfileDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProfileDTOImpl extends ProfileDTO {
  _ProfileDTOImpl({
    int? id,
    required String uid,
    required int userId,
    required String username,
    required String firstName,
    required String lastName,
    required String avatar,
    String? bio,
    required DateTime createdAt,
  }) : super._(
          id: id,
          uid: uid,
          userId: userId,
          username: username,
          firstName: firstName,
          lastName: lastName,
          avatar: avatar,
          bio: bio,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [ProfileDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProfileDTO copyWith({
    Object? id = _Undefined,
    String? uid,
    int? userId,
    String? username,
    String? firstName,
    String? lastName,
    String? avatar,
    Object? bio = _Undefined,
    DateTime? createdAt,
  }) {
    return ProfileDTO(
      id: id is int? ? id : this.id,
      uid: uid ?? this.uid,
      userId: userId ?? this.userId,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      avatar: avatar ?? this.avatar,
      bio: bio is String? ? bio : this.bio,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

class ProfileDTOTable extends _i1.Table<int?> {
  ProfileDTOTable({super.tableRelation}) : super(tableName: 'profile') {
    uid = _i1.ColumnString(
      'uid',
      this,
    );
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    username = _i1.ColumnString(
      'username',
      this,
    );
    firstName = _i1.ColumnString(
      'firstName',
      this,
    );
    lastName = _i1.ColumnString(
      'lastName',
      this,
    );
    avatar = _i1.ColumnString(
      'avatar',
      this,
    );
    bio = _i1.ColumnString(
      'bio',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final _i1.ColumnString uid;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnString username;

  late final _i1.ColumnString firstName;

  late final _i1.ColumnString lastName;

  late final _i1.ColumnString avatar;

  late final _i1.ColumnString bio;

  late final _i1.ColumnDateTime createdAt;

  @override
  List<_i1.Column> get columns => [
        id,
        uid,
        userId,
        username,
        firstName,
        lastName,
        avatar,
        bio,
        createdAt,
      ];
}

class ProfileDTOInclude extends _i1.IncludeObject {
  ProfileDTOInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => ProfileDTO.t;
}

class ProfileDTOIncludeList extends _i1.IncludeList {
  ProfileDTOIncludeList._({
    _i1.WhereExpressionBuilder<ProfileDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ProfileDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ProfileDTO.t;
}

class ProfileDTORepository {
  const ProfileDTORepository._();

  /// Returns a list of [ProfileDTO]s matching the given query parameters.
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
  Future<List<ProfileDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProfileDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProfileDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProfileDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<ProfileDTO>(
      where: where?.call(ProfileDTO.t),
      orderBy: orderBy?.call(ProfileDTO.t),
      orderByList: orderByList?.call(ProfileDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [ProfileDTO] matching the given query parameters.
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
  Future<ProfileDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProfileDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<ProfileDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProfileDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<ProfileDTO>(
      where: where?.call(ProfileDTO.t),
      orderBy: orderBy?.call(ProfileDTO.t),
      orderByList: orderByList?.call(ProfileDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [ProfileDTO] by its [id] or null if no such row exists.
  Future<ProfileDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<ProfileDTO>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [ProfileDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [ProfileDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ProfileDTO>> insert(
    _i1.Session session,
    List<ProfileDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ProfileDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ProfileDTO] and returns the inserted row.
  ///
  /// The returned [ProfileDTO] will have its `id` field set.
  Future<ProfileDTO> insertRow(
    _i1.Session session,
    ProfileDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ProfileDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ProfileDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ProfileDTO>> update(
    _i1.Session session,
    List<ProfileDTO> rows, {
    _i1.ColumnSelections<ProfileDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ProfileDTO>(
      rows,
      columns: columns?.call(ProfileDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ProfileDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ProfileDTO> updateRow(
    _i1.Session session,
    ProfileDTO row, {
    _i1.ColumnSelections<ProfileDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ProfileDTO>(
      row,
      columns: columns?.call(ProfileDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [ProfileDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ProfileDTO>> delete(
    _i1.Session session,
    List<ProfileDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ProfileDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ProfileDTO].
  Future<ProfileDTO> deleteRow(
    _i1.Session session,
    ProfileDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ProfileDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ProfileDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ProfileDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ProfileDTO>(
      where: where(ProfileDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProfileDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ProfileDTO>(
      where: where?.call(ProfileDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

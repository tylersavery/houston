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

abstract class ProfileDTO extends _i1.TableRow {
  ProfileDTO._({
    int? id,
    required this.uid,
    required this.userId,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    this.bio,
    required this.createdAt,
  }) : super(id);

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

  factory ProfileDTO.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return ProfileDTO(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      uid: serializationManager.deserialize<String>(jsonSerialization['uid']),
      userId:
          serializationManager.deserialize<int>(jsonSerialization['userId']),
      username: serializationManager
          .deserialize<String>(jsonSerialization['username']),
      firstName: serializationManager
          .deserialize<String>(jsonSerialization['firstName']),
      lastName: serializationManager
          .deserialize<String>(jsonSerialization['lastName']),
      avatar:
          serializationManager.deserialize<String>(jsonSerialization['avatar']),
      bio: serializationManager.deserialize<String?>(jsonSerialization['bio']),
      createdAt: serializationManager
          .deserialize<DateTime>(jsonSerialization['createdAt']),
    );
  }

  static final t = ProfileDTOTable();

  static const db = ProfileDTORepository._();

  String uid;

  int userId;

  String username;

  String firstName;

  String lastName;

  String avatar;

  String? bio;

  DateTime createdAt;

  @override
  _i1.Table get table => t;

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
  @Deprecated('Will be removed in 2.0.0')
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'uid': uid,
      'userId': userId,
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'avatar': avatar,
      'bio': bio,
      'createdAt': createdAt,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
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
      case 'userId':
        userId = value;
        return;
      case 'username':
        username = value;
        return;
      case 'firstName':
        firstName = value;
        return;
      case 'lastName':
        lastName = value;
        return;
      case 'avatar':
        avatar = value;
        return;
      case 'bio':
        bio = value;
        return;
      case 'createdAt':
        createdAt = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.find instead.')
  static Future<List<ProfileDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProfileDTOTable>? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<ProfileDTO>(
      where: where != null ? where(ProfileDTO.t) : null,
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
  static Future<ProfileDTO?> findSingleRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProfileDTOTable>? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<ProfileDTO>(
      where: where != null ? where(ProfileDTO.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.findById instead.')
  static Future<ProfileDTO?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<ProfileDTO>(id);
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteWhere instead.')
  static Future<int> delete(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ProfileDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ProfileDTO>(
      where: where(ProfileDTO.t),
      transaction: transaction,
    );
  }

  @Deprecated('Will be removed in 2.0.0. Use: db.deleteRow instead.')
  static Future<bool> deleteRow(
    _i1.Session session,
    ProfileDTO row, {
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
    ProfileDTO row, {
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
    ProfileDTO row, {
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
    _i1.WhereExpressionBuilder<ProfileDTOTable>? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ProfileDTO>(
      where: where != null ? where(ProfileDTO.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
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

class ProfileDTOTable extends _i1.Table {
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

@Deprecated('Use ProfileDTOTable.t instead.')
ProfileDTOTable tProfileDTO = ProfileDTOTable();

class ProfileDTOInclude extends _i1.IncludeObject {
  ProfileDTOInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => ProfileDTO.t;
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
  _i1.Table get table => ProfileDTO.t;
}

class ProfileDTORepository {
  const ProfileDTORepository._();

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
    return session.dbNext.find<ProfileDTO>(
      where: where?.call(ProfileDTO.t),
      orderBy: orderBy?.call(ProfileDTO.t),
      orderByList: orderByList?.call(ProfileDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<ProfileDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProfileDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<ProfileDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProfileDTOTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findFirstRow<ProfileDTO>(
      where: where?.call(ProfileDTO.t),
      orderBy: orderBy?.call(ProfileDTO.t),
      orderByList: orderByList?.call(ProfileDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  Future<ProfileDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.findById<ProfileDTO>(
      id,
      transaction: transaction,
    );
  }

  Future<List<ProfileDTO>> insert(
    _i1.Session session,
    List<ProfileDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insert<ProfileDTO>(
      rows,
      transaction: transaction,
    );
  }

  Future<ProfileDTO> insertRow(
    _i1.Session session,
    ProfileDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.insertRow<ProfileDTO>(
      row,
      transaction: transaction,
    );
  }

  Future<List<ProfileDTO>> update(
    _i1.Session session,
    List<ProfileDTO> rows, {
    _i1.ColumnSelections<ProfileDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.update<ProfileDTO>(
      rows,
      columns: columns?.call(ProfileDTO.t),
      transaction: transaction,
    );
  }

  Future<ProfileDTO> updateRow(
    _i1.Session session,
    ProfileDTO row, {
    _i1.ColumnSelections<ProfileDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.updateRow<ProfileDTO>(
      row,
      columns: columns?.call(ProfileDTO.t),
      transaction: transaction,
    );
  }

  Future<List<int>> delete(
    _i1.Session session,
    List<ProfileDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.delete<ProfileDTO>(
      rows,
      transaction: transaction,
    );
  }

  Future<int> deleteRow(
    _i1.Session session,
    ProfileDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteRow<ProfileDTO>(
      row,
      transaction: transaction,
    );
  }

  Future<List<int>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ProfileDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.deleteWhere<ProfileDTO>(
      where: where(ProfileDTO.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProfileDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.dbNext.count<ProfileDTO>(
      where: where?.call(ProfileDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

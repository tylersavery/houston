// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_system_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GameSystem _$GameSystemFromJson(Map<String, dynamic> json) {
  return _GameSystem.fromJson(json);
}

/// @nodoc
mixin _$GameSystem {
  @JsonKey(includeToJson: false)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: "image_url")
  String get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at", includeToJson: false)
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameSystemCopyWith<GameSystem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameSystemCopyWith<$Res> {
  factory $GameSystemCopyWith(
          GameSystem value, $Res Function(GameSystem) then) =
      _$GameSystemCopyWithImpl<$Res, GameSystem>;
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) int? id,
      @JsonKey(includeToJson: false) String uid,
      String name,
      double price,
      String description,
      @JsonKey(name: "image_url") String imageUrl,
      @JsonKey(name: "created_at", includeToJson: false) DateTime createdAt});
}

/// @nodoc
class _$GameSystemCopyWithImpl<$Res, $Val extends GameSystem>
    implements $GameSystemCopyWith<$Res> {
  _$GameSystemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uid = null,
    Object? name = null,
    Object? price = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameSystemImplCopyWith<$Res>
    implements $GameSystemCopyWith<$Res> {
  factory _$$GameSystemImplCopyWith(
          _$GameSystemImpl value, $Res Function(_$GameSystemImpl) then) =
      __$$GameSystemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) int? id,
      @JsonKey(includeToJson: false) String uid,
      String name,
      double price,
      String description,
      @JsonKey(name: "image_url") String imageUrl,
      @JsonKey(name: "created_at", includeToJson: false) DateTime createdAt});
}

/// @nodoc
class __$$GameSystemImplCopyWithImpl<$Res>
    extends _$GameSystemCopyWithImpl<$Res, _$GameSystemImpl>
    implements _$$GameSystemImplCopyWith<$Res> {
  __$$GameSystemImplCopyWithImpl(
      _$GameSystemImpl _value, $Res Function(_$GameSystemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uid = null,
    Object? name = null,
    Object? price = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? createdAt = null,
  }) {
    return _then(_$GameSystemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameSystemImpl extends _GameSystem {
  _$GameSystemImpl(
      {@JsonKey(includeToJson: false) this.id,
      @JsonKey(includeToJson: false) required this.uid,
      required this.name,
      required this.price,
      required this.description,
      @JsonKey(name: "image_url") required this.imageUrl,
      @JsonKey(name: "created_at", includeToJson: false)
      required this.createdAt})
      : super._();

  factory _$GameSystemImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameSystemImplFromJson(json);

  @override
  @JsonKey(includeToJson: false)
  final int? id;
  @override
  @JsonKey(includeToJson: false)
  final String uid;
  @override
  final String name;
  @override
  final double price;
  @override
  final String description;
  @override
  @JsonKey(name: "image_url")
  final String imageUrl;
  @override
  @JsonKey(name: "created_at", includeToJson: false)
  final DateTime createdAt;

  @override
  String toString() {
    return 'GameSystem(id: $id, uid: $uid, name: $name, price: $price, description: $description, imageUrl: $imageUrl, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameSystemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, uid, name, price, description, imageUrl, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameSystemImplCopyWith<_$GameSystemImpl> get copyWith =>
      __$$GameSystemImplCopyWithImpl<_$GameSystemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameSystemImplToJson(
      this,
    );
  }
}

abstract class _GameSystem extends GameSystem {
  factory _GameSystem(
      {@JsonKey(includeToJson: false) final int? id,
      @JsonKey(includeToJson: false) required final String uid,
      required final String name,
      required final double price,
      required final String description,
      @JsonKey(name: "image_url") required final String imageUrl,
      @JsonKey(name: "created_at", includeToJson: false)
      required final DateTime createdAt}) = _$GameSystemImpl;
  _GameSystem._() : super._();

  factory _GameSystem.fromJson(Map<String, dynamic> json) =
      _$GameSystemImpl.fromJson;

  @override
  @JsonKey(includeToJson: false)
  int? get id;
  @override
  @JsonKey(includeToJson: false)
  String get uid;
  @override
  String get name;
  @override
  double get price;
  @override
  String get description;
  @override
  @JsonKey(name: "image_url")
  String get imageUrl;
  @override
  @JsonKey(name: "created_at", includeToJson: false)
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$GameSystemImplCopyWith<_$GameSystemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

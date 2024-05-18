// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Game _$GameFromJson(Map<String, dynamic> json) {
  return _Game.fromJson(json);
}

/// @nodoc
mixin _$Game {
  @JsonKey(includeToJson: false)
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  String get uid => throw _privateConstructorUsedError;
  @JsonKey(name: "game_system", toJson: gameSystemToJson)
  GameSystem? get gameSystem => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get players => throw _privateConstructorUsedError;
  @JsonKey(name: "image_url")
  String get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at", includeToJson: false)
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GameCopyWith<Game> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameCopyWith<$Res> {
  factory $GameCopyWith(Game value, $Res Function(Game) then) =
      _$GameCopyWithImpl<$Res, Game>;
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) int? id,
      @JsonKey(includeToJson: false) String uid,
      @JsonKey(name: "game_system", toJson: gameSystemToJson)
      GameSystem? gameSystem,
      String name,
      double price,
      String description,
      int players,
      @JsonKey(name: "image_url") String imageUrl,
      @JsonKey(name: "created_at", includeToJson: false) DateTime createdAt});

  $GameSystemCopyWith<$Res>? get gameSystem;
}

/// @nodoc
class _$GameCopyWithImpl<$Res, $Val extends Game>
    implements $GameCopyWith<$Res> {
  _$GameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uid = null,
    Object? gameSystem = freezed,
    Object? name = null,
    Object? price = null,
    Object? description = null,
    Object? players = null,
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
      gameSystem: freezed == gameSystem
          ? _value.gameSystem
          : gameSystem // ignore: cast_nullable_to_non_nullable
              as GameSystem?,
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
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as int,
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

  @override
  @pragma('vm:prefer-inline')
  $GameSystemCopyWith<$Res>? get gameSystem {
    if (_value.gameSystem == null) {
      return null;
    }

    return $GameSystemCopyWith<$Res>(_value.gameSystem!, (value) {
      return _then(_value.copyWith(gameSystem: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GameImplCopyWith<$Res> implements $GameCopyWith<$Res> {
  factory _$$GameImplCopyWith(
          _$GameImpl value, $Res Function(_$GameImpl) then) =
      __$$GameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) int? id,
      @JsonKey(includeToJson: false) String uid,
      @JsonKey(name: "game_system", toJson: gameSystemToJson)
      GameSystem? gameSystem,
      String name,
      double price,
      String description,
      int players,
      @JsonKey(name: "image_url") String imageUrl,
      @JsonKey(name: "created_at", includeToJson: false) DateTime createdAt});

  @override
  $GameSystemCopyWith<$Res>? get gameSystem;
}

/// @nodoc
class __$$GameImplCopyWithImpl<$Res>
    extends _$GameCopyWithImpl<$Res, _$GameImpl>
    implements _$$GameImplCopyWith<$Res> {
  __$$GameImplCopyWithImpl(_$GameImpl _value, $Res Function(_$GameImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uid = null,
    Object? gameSystem = freezed,
    Object? name = null,
    Object? price = null,
    Object? description = null,
    Object? players = null,
    Object? imageUrl = null,
    Object? createdAt = null,
  }) {
    return _then(_$GameImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      gameSystem: freezed == gameSystem
          ? _value.gameSystem
          : gameSystem // ignore: cast_nullable_to_non_nullable
              as GameSystem?,
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
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$GameImpl extends _Game {
  _$GameImpl(
      {@JsonKey(includeToJson: false) this.id,
      @JsonKey(includeToJson: false) required this.uid,
      @JsonKey(name: "game_system", toJson: gameSystemToJson) this.gameSystem,
      required this.name,
      required this.price,
      required this.description,
      required this.players,
      @JsonKey(name: "image_url") required this.imageUrl,
      @JsonKey(name: "created_at", includeToJson: false)
      required this.createdAt})
      : super._();

  factory _$GameImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameImplFromJson(json);

  @override
  @JsonKey(includeToJson: false)
  final int? id;
  @override
  @JsonKey(includeToJson: false)
  final String uid;
  @override
  @JsonKey(name: "game_system", toJson: gameSystemToJson)
  final GameSystem? gameSystem;
  @override
  final String name;
  @override
  final double price;
  @override
  final String description;
  @override
  final int players;
  @override
  @JsonKey(name: "image_url")
  final String imageUrl;
  @override
  @JsonKey(name: "created_at", includeToJson: false)
  final DateTime createdAt;

  @override
  String toString() {
    return 'Game(id: $id, uid: $uid, gameSystem: $gameSystem, name: $name, price: $price, description: $description, players: $players, imageUrl: $imageUrl, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.gameSystem, gameSystem) ||
                other.gameSystem == gameSystem) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.players, players) || other.players == players) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, uid, gameSystem, name, price,
      description, players, imageUrl, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameImplCopyWith<_$GameImpl> get copyWith =>
      __$$GameImplCopyWithImpl<_$GameImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameImplToJson(
      this,
    );
  }
}

abstract class _Game extends Game {
  factory _Game(
      {@JsonKey(includeToJson: false) final int? id,
      @JsonKey(includeToJson: false) required final String uid,
      @JsonKey(name: "game_system", toJson: gameSystemToJson)
      final GameSystem? gameSystem,
      required final String name,
      required final double price,
      required final String description,
      required final int players,
      @JsonKey(name: "image_url") required final String imageUrl,
      @JsonKey(name: "created_at", includeToJson: false)
      required final DateTime createdAt}) = _$GameImpl;
  _Game._() : super._();

  factory _Game.fromJson(Map<String, dynamic> json) = _$GameImpl.fromJson;

  @override
  @JsonKey(includeToJson: false)
  int? get id;
  @override
  @JsonKey(includeToJson: false)
  String get uid;
  @override
  @JsonKey(name: "game_system", toJson: gameSystemToJson)
  GameSystem? get gameSystem;
  @override
  String get name;
  @override
  double get price;
  @override
  String get description;
  @override
  int get players;
  @override
  @JsonKey(name: "image_url")
  String get imageUrl;
  @override
  @JsonKey(name: "created_at", includeToJson: false)
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$GameImplCopyWith<_$GameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_paginated_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gamePaginatedListHash() => r'1366586bffe1837ebf758bafffa1431d8917462e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$GamePaginatedList
    extends BuildlessNotifier<GamePaginatedListState> {
  late final GameListVariant variant;
  late final String? arg;

  GamePaginatedListState build(
    GameListVariant variant, [
    String? arg,
  ]);
}

/// See also [GamePaginatedList].
@ProviderFor(GamePaginatedList)
const gamePaginatedListProvider = GamePaginatedListFamily();

/// See also [GamePaginatedList].
class GamePaginatedListFamily extends Family<GamePaginatedListState> {
  /// See also [GamePaginatedList].
  const GamePaginatedListFamily();

  /// See also [GamePaginatedList].
  GamePaginatedListProvider call(
    GameListVariant variant, [
    String? arg,
  ]) {
    return GamePaginatedListProvider(
      variant,
      arg,
    );
  }

  @override
  GamePaginatedListProvider getProviderOverride(
    covariant GamePaginatedListProvider provider,
  ) {
    return call(
      provider.variant,
      provider.arg,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'gamePaginatedListProvider';
}

/// See also [GamePaginatedList].
class GamePaginatedListProvider
    extends NotifierProviderImpl<GamePaginatedList, GamePaginatedListState> {
  /// See also [GamePaginatedList].
  GamePaginatedListProvider(
    GameListVariant variant, [
    String? arg,
  ]) : this._internal(
          () => GamePaginatedList()
            ..variant = variant
            ..arg = arg,
          from: gamePaginatedListProvider,
          name: r'gamePaginatedListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$gamePaginatedListHash,
          dependencies: GamePaginatedListFamily._dependencies,
          allTransitiveDependencies:
              GamePaginatedListFamily._allTransitiveDependencies,
          variant: variant,
          arg: arg,
        );

  GamePaginatedListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.variant,
    required this.arg,
  }) : super.internal();

  final GameListVariant variant;
  final String? arg;

  @override
  GamePaginatedListState runNotifierBuild(
    covariant GamePaginatedList notifier,
  ) {
    return notifier.build(
      variant,
      arg,
    );
  }

  @override
  Override overrideWith(GamePaginatedList Function() create) {
    return ProviderOverride(
      origin: this,
      override: GamePaginatedListProvider._internal(
        () => create()
          ..variant = variant
          ..arg = arg,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        variant: variant,
        arg: arg,
      ),
    );
  }

  @override
  NotifierProviderElement<GamePaginatedList, GamePaginatedListState>
      createElement() {
    return _GamePaginatedListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GamePaginatedListProvider &&
        other.variant == variant &&
        other.arg == arg;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, variant.hashCode);
    hash = _SystemHash.combine(hash, arg.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GamePaginatedListRef on NotifierProviderRef<GamePaginatedListState> {
  /// The parameter `variant` of this provider.
  GameListVariant get variant;

  /// The parameter `arg` of this provider.
  String? get arg;
}

class _GamePaginatedListProviderElement
    extends NotifierProviderElement<GamePaginatedList, GamePaginatedListState>
    with GamePaginatedListRef {
  _GamePaginatedListProviderElement(super.provider);

  @override
  GameListVariant get variant => (origin as GamePaginatedListProvider).variant;
  @override
  String? get arg => (origin as GamePaginatedListProvider).arg;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

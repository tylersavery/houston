// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_system_paginated_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gameSystemPaginatedListHash() =>
    r'1981d612819db962cbd142b5c3213f39fa650d10';

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

abstract class _$GameSystemPaginatedList
    extends BuildlessNotifier<GameSystemPaginatedListState> {
  late final GameSystemListVariant variant;
  late final String? arg;

  GameSystemPaginatedListState build(
    GameSystemListVariant variant, [
    String? arg,
  ]);
}

/// See also [GameSystemPaginatedList].
@ProviderFor(GameSystemPaginatedList)
const gameSystemPaginatedListProvider = GameSystemPaginatedListFamily();

/// See also [GameSystemPaginatedList].
class GameSystemPaginatedListFamily
    extends Family<GameSystemPaginatedListState> {
  /// See also [GameSystemPaginatedList].
  const GameSystemPaginatedListFamily();

  /// See also [GameSystemPaginatedList].
  GameSystemPaginatedListProvider call(
    GameSystemListVariant variant, [
    String? arg,
  ]) {
    return GameSystemPaginatedListProvider(variant, arg);
  }

  @override
  GameSystemPaginatedListProvider getProviderOverride(
    covariant GameSystemPaginatedListProvider provider,
  ) {
    return call(provider.variant, provider.arg);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'gameSystemPaginatedListProvider';
}

/// See also [GameSystemPaginatedList].
class GameSystemPaginatedListProvider
    extends
        NotifierProviderImpl<
          GameSystemPaginatedList,
          GameSystemPaginatedListState
        > {
  /// See also [GameSystemPaginatedList].
  GameSystemPaginatedListProvider(GameSystemListVariant variant, [String? arg])
    : this._internal(
        () =>
            GameSystemPaginatedList()
              ..variant = variant
              ..arg = arg,
        from: gameSystemPaginatedListProvider,
        name: r'gameSystemPaginatedListProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$gameSystemPaginatedListHash,
        dependencies: GameSystemPaginatedListFamily._dependencies,
        allTransitiveDependencies:
            GameSystemPaginatedListFamily._allTransitiveDependencies,
        variant: variant,
        arg: arg,
      );

  GameSystemPaginatedListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.variant,
    required this.arg,
  }) : super.internal();

  final GameSystemListVariant variant;
  final String? arg;

  @override
  GameSystemPaginatedListState runNotifierBuild(
    covariant GameSystemPaginatedList notifier,
  ) {
    return notifier.build(variant, arg);
  }

  @override
  Override overrideWith(GameSystemPaginatedList Function() create) {
    return ProviderOverride(
      origin: this,
      override: GameSystemPaginatedListProvider._internal(
        () =>
            create()
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
  NotifierProviderElement<GameSystemPaginatedList, GameSystemPaginatedListState>
  createElement() {
    return _GameSystemPaginatedListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GameSystemPaginatedListProvider &&
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

mixin GameSystemPaginatedListRef
    on NotifierProviderRef<GameSystemPaginatedListState> {
  /// The parameter `variant` of this provider.
  GameSystemListVariant get variant;

  /// The parameter `arg` of this provider.
  String? get arg;
}

class _GameSystemPaginatedListProviderElement
    extends
        NotifierProviderElement<
          GameSystemPaginatedList,
          GameSystemPaginatedListState
        >
    with GameSystemPaginatedListRef {
  _GameSystemPaginatedListProviderElement(super.provider);

  @override
  GameSystemListVariant get variant =>
      (origin as GameSystemPaginatedListProvider).variant;
  @override
  String? get arg => (origin as GameSystemPaginatedListProvider).arg;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

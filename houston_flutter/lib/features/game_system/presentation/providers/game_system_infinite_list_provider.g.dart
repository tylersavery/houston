// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_system_infinite_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gameSystemInfiniteListHash() =>
    r'76985f0a8093fe1907863673a515d42848e7e1e4';

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

abstract class _$GameSystemInfiniteList
    extends BuildlessNotifier<PagingStatus> {
  late final GameSystemListVariant variant;
  late final String? arg;

  PagingStatus build(GameSystemListVariant variant, [String? arg]);
}

/// See also [GameSystemInfiniteList].
@ProviderFor(GameSystemInfiniteList)
const gameSystemInfiniteListProvider = GameSystemInfiniteListFamily();

/// See also [GameSystemInfiniteList].
class GameSystemInfiniteListFamily extends Family<PagingStatus> {
  /// See also [GameSystemInfiniteList].
  const GameSystemInfiniteListFamily();

  /// See also [GameSystemInfiniteList].
  GameSystemInfiniteListProvider call(
    GameSystemListVariant variant, [
    String? arg,
  ]) {
    return GameSystemInfiniteListProvider(variant, arg);
  }

  @override
  GameSystemInfiniteListProvider getProviderOverride(
    covariant GameSystemInfiniteListProvider provider,
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
  String? get name => r'gameSystemInfiniteListProvider';
}

/// See also [GameSystemInfiniteList].
class GameSystemInfiniteListProvider
    extends NotifierProviderImpl<GameSystemInfiniteList, PagingStatus> {
  /// See also [GameSystemInfiniteList].
  GameSystemInfiniteListProvider(GameSystemListVariant variant, [String? arg])
    : this._internal(
        () =>
            GameSystemInfiniteList()
              ..variant = variant
              ..arg = arg,
        from: gameSystemInfiniteListProvider,
        name: r'gameSystemInfiniteListProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$gameSystemInfiniteListHash,
        dependencies: GameSystemInfiniteListFamily._dependencies,
        allTransitiveDependencies:
            GameSystemInfiniteListFamily._allTransitiveDependencies,
        variant: variant,
        arg: arg,
      );

  GameSystemInfiniteListProvider._internal(
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
  PagingStatus runNotifierBuild(covariant GameSystemInfiniteList notifier) {
    return notifier.build(variant, arg);
  }

  @override
  Override overrideWith(GameSystemInfiniteList Function() create) {
    return ProviderOverride(
      origin: this,
      override: GameSystemInfiniteListProvider._internal(
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
  NotifierProviderElement<GameSystemInfiniteList, PagingStatus>
  createElement() {
    return _GameSystemInfiniteListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GameSystemInfiniteListProvider &&
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

mixin GameSystemInfiniteListRef on NotifierProviderRef<PagingStatus> {
  /// The parameter `variant` of this provider.
  GameSystemListVariant get variant;

  /// The parameter `arg` of this provider.
  String? get arg;
}

class _GameSystemInfiniteListProviderElement
    extends NotifierProviderElement<GameSystemInfiniteList, PagingStatus>
    with GameSystemInfiniteListRef {
  _GameSystemInfiniteListProviderElement(super.provider);

  @override
  GameSystemListVariant get variant =>
      (origin as GameSystemInfiniteListProvider).variant;
  @override
  String? get arg => (origin as GameSystemInfiniteListProvider).arg;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

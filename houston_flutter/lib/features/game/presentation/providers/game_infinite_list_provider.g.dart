// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_infinite_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gameInfiniteListHash() => r'7a5e657025b7212a470a5075ec41f4f7637b146f';

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

abstract class _$GameInfiniteList extends BuildlessNotifier<PagingStatus> {
  late final GameListVariant variant;
  late final String? arg;

  PagingStatus build(GameListVariant variant, [String? arg]);
}

/// See also [GameInfiniteList].
@ProviderFor(GameInfiniteList)
const gameInfiniteListProvider = GameInfiniteListFamily();

/// See also [GameInfiniteList].
class GameInfiniteListFamily extends Family<PagingStatus> {
  /// See also [GameInfiniteList].
  const GameInfiniteListFamily();

  /// See also [GameInfiniteList].
  GameInfiniteListProvider call(GameListVariant variant, [String? arg]) {
    return GameInfiniteListProvider(variant, arg);
  }

  @override
  GameInfiniteListProvider getProviderOverride(
    covariant GameInfiniteListProvider provider,
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
  String? get name => r'gameInfiniteListProvider';
}

/// See also [GameInfiniteList].
class GameInfiniteListProvider
    extends NotifierProviderImpl<GameInfiniteList, PagingStatus> {
  /// See also [GameInfiniteList].
  GameInfiniteListProvider(GameListVariant variant, [String? arg])
    : this._internal(
        () =>
            GameInfiniteList()
              ..variant = variant
              ..arg = arg,
        from: gameInfiniteListProvider,
        name: r'gameInfiniteListProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$gameInfiniteListHash,
        dependencies: GameInfiniteListFamily._dependencies,
        allTransitiveDependencies:
            GameInfiniteListFamily._allTransitiveDependencies,
        variant: variant,
        arg: arg,
      );

  GameInfiniteListProvider._internal(
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
  PagingStatus runNotifierBuild(covariant GameInfiniteList notifier) {
    return notifier.build(variant, arg);
  }

  @override
  Override overrideWith(GameInfiniteList Function() create) {
    return ProviderOverride(
      origin: this,
      override: GameInfiniteListProvider._internal(
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
  NotifierProviderElement<GameInfiniteList, PagingStatus> createElement() {
    return _GameInfiniteListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GameInfiniteListProvider &&
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

mixin GameInfiniteListRef on NotifierProviderRef<PagingStatus> {
  /// The parameter `variant` of this provider.
  GameListVariant get variant;

  /// The parameter `arg` of this provider.
  String? get arg;
}

class _GameInfiniteListProviderElement
    extends NotifierProviderElement<GameInfiniteList, PagingStatus>
    with GameInfiniteListRef {
  _GameInfiniteListProviderElement(super.provider);

  @override
  GameListVariant get variant => (origin as GameInfiniteListProvider).variant;
  @override
  String? get arg => (origin as GameInfiniteListProvider).arg;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

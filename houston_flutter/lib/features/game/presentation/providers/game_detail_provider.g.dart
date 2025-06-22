// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gameDetailHash() => r'6272d1e2211a9bac22f35b3fdb15f3f43f4a0fd5';

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

/// See also [gameDetail].
@ProviderFor(gameDetail)
const gameDetailProvider = GameDetailFamily();

/// See also [gameDetail].
class GameDetailFamily extends Family<AsyncValue<Game>> {
  /// See also [gameDetail].
  const GameDetailFamily();

  /// See also [gameDetail].
  GameDetailProvider call(int id) {
    return GameDetailProvider(id);
  }

  @override
  GameDetailProvider getProviderOverride(
    covariant GameDetailProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'gameDetailProvider';
}

/// See also [gameDetail].
class GameDetailProvider extends AutoDisposeFutureProvider<Game> {
  /// See also [gameDetail].
  GameDetailProvider(int id)
    : this._internal(
        (ref) => gameDetail(ref as GameDetailRef, id),
        from: gameDetailProvider,
        name: r'gameDetailProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$gameDetailHash,
        dependencies: GameDetailFamily._dependencies,
        allTransitiveDependencies: GameDetailFamily._allTransitiveDependencies,
        id: id,
      );

  GameDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Game> Function(GameDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GameDetailProvider._internal(
        (ref) => create(ref as GameDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Game> createElement() {
    return _GameDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GameDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GameDetailRef on AutoDisposeFutureProviderRef<Game> {
  /// The parameter `id` of this provider.
  int get id;
}

class _GameDetailProviderElement extends AutoDisposeFutureProviderElement<Game>
    with GameDetailRef {
  _GameDetailProviderElement(super.provider);

  @override
  int get id => (origin as GameDetailProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

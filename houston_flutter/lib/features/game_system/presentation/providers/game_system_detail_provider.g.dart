// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_system_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gameSystemDetailHash() => r'60a20856e049a03b76322db72e79063c4a1763a9';

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

/// See also [gameSystemDetail].
@ProviderFor(gameSystemDetail)
const gameSystemDetailProvider = GameSystemDetailFamily();

/// See also [gameSystemDetail].
class GameSystemDetailFamily extends Family<AsyncValue<GameSystem>> {
  /// See also [gameSystemDetail].
  const GameSystemDetailFamily();

  /// See also [gameSystemDetail].
  GameSystemDetailProvider call(
    int id,
  ) {
    return GameSystemDetailProvider(
      id,
    );
  }

  @override
  GameSystemDetailProvider getProviderOverride(
    covariant GameSystemDetailProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'gameSystemDetailProvider';
}

/// See also [gameSystemDetail].
class GameSystemDetailProvider extends AutoDisposeFutureProvider<GameSystem> {
  /// See also [gameSystemDetail].
  GameSystemDetailProvider(
    int id,
  ) : this._internal(
          (ref) => gameSystemDetail(
            ref as GameSystemDetailRef,
            id,
          ),
          from: gameSystemDetailProvider,
          name: r'gameSystemDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$gameSystemDetailHash,
          dependencies: GameSystemDetailFamily._dependencies,
          allTransitiveDependencies:
              GameSystemDetailFamily._allTransitiveDependencies,
          id: id,
        );

  GameSystemDetailProvider._internal(
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
    FutureOr<GameSystem> Function(GameSystemDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GameSystemDetailProvider._internal(
        (ref) => create(ref as GameSystemDetailRef),
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
  AutoDisposeFutureProviderElement<GameSystem> createElement() {
    return _GameSystemDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GameSystemDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GameSystemDetailRef on AutoDisposeFutureProviderRef<GameSystem> {
  /// The parameter `id` of this provider.
  int get id;
}

class _GameSystemDetailProviderElement
    extends AutoDisposeFutureProviderElement<GameSystem>
    with GameSystemDetailRef {
  _GameSystemDetailProviderElement(super.provider);

  @override
  int get id => (origin as GameSystemDetailProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

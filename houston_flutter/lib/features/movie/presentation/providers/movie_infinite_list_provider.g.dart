// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_infinite_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$movieInfiniteListHash() => r'ca33a6731201edaa0d56ddb1588b0360619dc7ce';

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

abstract class _$MovieInfiniteList extends BuildlessNotifier<PagingStatus> {
  late final MovieListVariant variant;
  late final String? arg;

  PagingStatus build(MovieListVariant variant, [String? arg]);
}

/// See also [MovieInfiniteList].
@ProviderFor(MovieInfiniteList)
const movieInfiniteListProvider = MovieInfiniteListFamily();

/// See also [MovieInfiniteList].
class MovieInfiniteListFamily extends Family<PagingStatus> {
  /// See also [MovieInfiniteList].
  const MovieInfiniteListFamily();

  /// See also [MovieInfiniteList].
  MovieInfiniteListProvider call(MovieListVariant variant, [String? arg]) {
    return MovieInfiniteListProvider(variant, arg);
  }

  @override
  MovieInfiniteListProvider getProviderOverride(
    covariant MovieInfiniteListProvider provider,
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
  String? get name => r'movieInfiniteListProvider';
}

/// See also [MovieInfiniteList].
class MovieInfiniteListProvider
    extends NotifierProviderImpl<MovieInfiniteList, PagingStatus> {
  /// See also [MovieInfiniteList].
  MovieInfiniteListProvider(MovieListVariant variant, [String? arg])
    : this._internal(
        () =>
            MovieInfiniteList()
              ..variant = variant
              ..arg = arg,
        from: movieInfiniteListProvider,
        name: r'movieInfiniteListProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$movieInfiniteListHash,
        dependencies: MovieInfiniteListFamily._dependencies,
        allTransitiveDependencies:
            MovieInfiniteListFamily._allTransitiveDependencies,
        variant: variant,
        arg: arg,
      );

  MovieInfiniteListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.variant,
    required this.arg,
  }) : super.internal();

  final MovieListVariant variant;
  final String? arg;

  @override
  PagingStatus runNotifierBuild(covariant MovieInfiniteList notifier) {
    return notifier.build(variant, arg);
  }

  @override
  Override overrideWith(MovieInfiniteList Function() create) {
    return ProviderOverride(
      origin: this,
      override: MovieInfiniteListProvider._internal(
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
  NotifierProviderElement<MovieInfiniteList, PagingStatus> createElement() {
    return _MovieInfiniteListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MovieInfiniteListProvider &&
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

mixin MovieInfiniteListRef on NotifierProviderRef<PagingStatus> {
  /// The parameter `variant` of this provider.
  MovieListVariant get variant;

  /// The parameter `arg` of this provider.
  String? get arg;
}

class _MovieInfiniteListProviderElement
    extends NotifierProviderElement<MovieInfiniteList, PagingStatus>
    with MovieInfiniteListRef {
  _MovieInfiniteListProviderElement(super.provider);

  @override
  MovieListVariant get variant => (origin as MovieInfiniteListProvider).variant;
  @override
  String? get arg => (origin as MovieInfiniteListProvider).arg;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

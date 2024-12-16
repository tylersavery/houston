// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_paginated_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$moviePaginatedListHash() =>
    r'6f9ccfce6ca10987b0c0cb8d980362e03bda3264';

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

abstract class _$MoviePaginatedList
    extends BuildlessNotifier<MoviePaginatedListState> {
  late final MovieListVariant variant;
  late final String? arg;

  MoviePaginatedListState build(
    MovieListVariant variant, [
    String? arg,
  ]);
}

/// See also [MoviePaginatedList].
@ProviderFor(MoviePaginatedList)
const moviePaginatedListProvider = MoviePaginatedListFamily();

/// See also [MoviePaginatedList].
class MoviePaginatedListFamily extends Family<MoviePaginatedListState> {
  /// See also [MoviePaginatedList].
  const MoviePaginatedListFamily();

  /// See also [MoviePaginatedList].
  MoviePaginatedListProvider call(
    MovieListVariant variant, [
    String? arg,
  ]) {
    return MoviePaginatedListProvider(
      variant,
      arg,
    );
  }

  @override
  MoviePaginatedListProvider getProviderOverride(
    covariant MoviePaginatedListProvider provider,
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
  String? get name => r'moviePaginatedListProvider';
}

/// See also [MoviePaginatedList].
class MoviePaginatedListProvider
    extends NotifierProviderImpl<MoviePaginatedList, MoviePaginatedListState> {
  /// See also [MoviePaginatedList].
  MoviePaginatedListProvider(
    MovieListVariant variant, [
    String? arg,
  ]) : this._internal(
          () => MoviePaginatedList()
            ..variant = variant
            ..arg = arg,
          from: moviePaginatedListProvider,
          name: r'moviePaginatedListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$moviePaginatedListHash,
          dependencies: MoviePaginatedListFamily._dependencies,
          allTransitiveDependencies:
              MoviePaginatedListFamily._allTransitiveDependencies,
          variant: variant,
          arg: arg,
        );

  MoviePaginatedListProvider._internal(
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
  MoviePaginatedListState runNotifierBuild(
    covariant MoviePaginatedList notifier,
  ) {
    return notifier.build(
      variant,
      arg,
    );
  }

  @override
  Override overrideWith(MoviePaginatedList Function() create) {
    return ProviderOverride(
      origin: this,
      override: MoviePaginatedListProvider._internal(
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
  NotifierProviderElement<MoviePaginatedList, MoviePaginatedListState>
      createElement() {
    return _MoviePaginatedListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MoviePaginatedListProvider &&
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

mixin MoviePaginatedListRef on NotifierProviderRef<MoviePaginatedListState> {
  /// The parameter `variant` of this provider.
  MovieListVariant get variant;

  /// The parameter `arg` of this provider.
  String? get arg;
}

class _MoviePaginatedListProviderElement
    extends NotifierProviderElement<MoviePaginatedList, MoviePaginatedListState>
    with MoviePaginatedListRef {
  _MoviePaginatedListProviderElement(super.provider);

  @override
  MovieListVariant get variant =>
      (origin as MoviePaginatedListProvider).variant;
  @override
  String? get arg => (origin as MoviePaginatedListProvider).arg;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

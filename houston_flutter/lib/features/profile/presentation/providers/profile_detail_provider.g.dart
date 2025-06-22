// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$profileDetailHash() => r'cd8dfeae959ee4ad214346663e81eab5ec28bca9';

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

/// See also [profileDetail].
@ProviderFor(profileDetail)
const profileDetailProvider = ProfileDetailFamily();

/// See also [profileDetail].
class ProfileDetailFamily extends Family<AsyncValue<Profile>> {
  /// See also [profileDetail].
  const ProfileDetailFamily();

  /// See also [profileDetail].
  ProfileDetailProvider call(int id) {
    return ProfileDetailProvider(id);
  }

  @override
  ProfileDetailProvider getProviderOverride(
    covariant ProfileDetailProvider provider,
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
  String? get name => r'profileDetailProvider';
}

/// See also [profileDetail].
class ProfileDetailProvider extends AutoDisposeFutureProvider<Profile> {
  /// See also [profileDetail].
  ProfileDetailProvider(int id)
    : this._internal(
        (ref) => profileDetail(ref as ProfileDetailRef, id),
        from: profileDetailProvider,
        name: r'profileDetailProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$profileDetailHash,
        dependencies: ProfileDetailFamily._dependencies,
        allTransitiveDependencies:
            ProfileDetailFamily._allTransitiveDependencies,
        id: id,
      );

  ProfileDetailProvider._internal(
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
    FutureOr<Profile> Function(ProfileDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProfileDetailProvider._internal(
        (ref) => create(ref as ProfileDetailRef),
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
  AutoDisposeFutureProviderElement<Profile> createElement() {
    return _ProfileDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProfileDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProfileDetailRef on AutoDisposeFutureProviderRef<Profile> {
  /// The parameter `id` of this provider.
  int get id;
}

class _ProfileDetailProviderElement
    extends AutoDisposeFutureProviderElement<Profile>
    with ProfileDetailRef {
  _ProfileDetailProviderElement(super.provider);

  @override
  int get id => (origin as ProfileDetailProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

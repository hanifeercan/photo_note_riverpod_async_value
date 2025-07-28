// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_note_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$photoNoteDetailHash() => r'1984423058a90cb04dbb58a429f4778ac3d01eec';

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

abstract class _$PhotoNoteDetail
    extends BuildlessAutoDisposeAsyncNotifier<PhotoNote> {
  late final String id;

  FutureOr<PhotoNote> build(String id);
}

/// See also [PhotoNoteDetail].
@ProviderFor(PhotoNoteDetail)
const photoNoteDetailProvider = PhotoNoteDetailFamily();

/// See also [PhotoNoteDetail].
class PhotoNoteDetailFamily extends Family<AsyncValue<PhotoNote>> {
  /// See also [PhotoNoteDetail].
  const PhotoNoteDetailFamily();

  /// See also [PhotoNoteDetail].
  PhotoNoteDetailProvider call(String id) {
    return PhotoNoteDetailProvider(id);
  }

  @override
  PhotoNoteDetailProvider getProviderOverride(
    covariant PhotoNoteDetailProvider provider,
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
  String? get name => r'photoNoteDetailProvider';
}

/// See also [PhotoNoteDetail].
class PhotoNoteDetailProvider
    extends AutoDisposeAsyncNotifierProviderImpl<PhotoNoteDetail, PhotoNote> {
  /// See also [PhotoNoteDetail].
  PhotoNoteDetailProvider(String id)
    : this._internal(
        () => PhotoNoteDetail()..id = id,
        from: photoNoteDetailProvider,
        name: r'photoNoteDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$photoNoteDetailHash,
        dependencies: PhotoNoteDetailFamily._dependencies,
        allTransitiveDependencies:
            PhotoNoteDetailFamily._allTransitiveDependencies,
        id: id,
      );

  PhotoNoteDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  FutureOr<PhotoNote> runNotifierBuild(covariant PhotoNoteDetail notifier) {
    return notifier.build(id);
  }

  @override
  Override overrideWith(PhotoNoteDetail Function() create) {
    return ProviderOverride(
      origin: this,
      override: PhotoNoteDetailProvider._internal(
        () => create()..id = id,
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
  AutoDisposeAsyncNotifierProviderElement<PhotoNoteDetail, PhotoNote>
  createElement() {
    return _PhotoNoteDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PhotoNoteDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PhotoNoteDetailRef on AutoDisposeAsyncNotifierProviderRef<PhotoNote> {
  /// The parameter `id` of this provider.
  String get id;
}

class _PhotoNoteDetailProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<PhotoNoteDetail, PhotoNote>
    with PhotoNoteDetailRef {
  _PhotoNoteDetailProviderElement(super.provider);

  @override
  String get id => (origin as PhotoNoteDetailProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensors.repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sensorsRepository)
final sensorsRepositoryProvider = SensorsRepositoryProvider._();

final class SensorsRepositoryProvider
    extends
        $FunctionalProvider<
          SensorsRepository,
          SensorsRepository,
          SensorsRepository
        >
    with $Provider<SensorsRepository> {
  SensorsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sensorsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sensorsRepositoryHash();

  @$internal
  @override
  $ProviderElement<SensorsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SensorsRepository create(Ref ref) {
    return sensorsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SensorsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SensorsRepository>(value),
    );
  }
}

String _$sensorsRepositoryHash() => r'fb487b463f1bbe2065f57ce8275a033a7711bd78';

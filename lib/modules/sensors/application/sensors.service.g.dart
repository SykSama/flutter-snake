// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensors.service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sensorsService)
final sensorsServiceProvider = SensorsServiceProvider._();

final class SensorsServiceProvider
    extends $FunctionalProvider<SensorsService, SensorsService, SensorsService>
    with $Provider<SensorsService> {
  SensorsServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sensorsServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sensorsServiceHash();

  @$internal
  @override
  $ProviderElement<SensorsService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SensorsService create(Ref ref) {
    return sensorsService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SensorsService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SensorsService>(value),
    );
  }
}

String _$sensorsServiceHash() => r'3ffefcc2977c94537159ca0c0f293ca45d499b55';

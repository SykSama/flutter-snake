// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensors.providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(watchGyroscope)
final watchGyroscopeProvider = WatchGyroscopeProvider._();

final class WatchGyroscopeProvider
    extends
        $FunctionalProvider<
          AsyncValue<GyroscopeEvent>,
          GyroscopeEvent,
          Stream<GyroscopeEvent>
        >
    with $FutureModifier<GyroscopeEvent>, $StreamProvider<GyroscopeEvent> {
  WatchGyroscopeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchGyroscopeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchGyroscopeHash();

  @$internal
  @override
  $StreamProviderElement<GyroscopeEvent> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<GyroscopeEvent> create(Ref ref) {
    return watchGyroscope(ref);
  }
}

String _$watchGyroscopeHash() => r'6f2a7e1d80b28608684c30d4ae18075812d5bf1a';

@ProviderFor(watchAccelerometer)
final watchAccelerometerProvider = WatchAccelerometerProvider._();

final class WatchAccelerometerProvider
    extends
        $FunctionalProvider<
          AsyncValue<AccelerometerEvent>,
          AccelerometerEvent,
          Stream<AccelerometerEvent>
        >
    with
        $FutureModifier<AccelerometerEvent>,
        $StreamProvider<AccelerometerEvent> {
  WatchAccelerometerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchAccelerometerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchAccelerometerHash();

  @$internal
  @override
  $StreamProviderElement<AccelerometerEvent> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<AccelerometerEvent> create(Ref ref) {
    return watchAccelerometer(ref);
  }
}

String _$watchAccelerometerHash() =>
    r'94c5f111cb4f4ccea2125614a4916832b7e8b4b5';

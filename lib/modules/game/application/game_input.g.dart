// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_input.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tiltDirection)
final tiltDirectionProvider = TiltDirectionProvider._();

final class TiltDirectionProvider
    extends $FunctionalProvider<Direction?, Direction?, Direction?>
    with $Provider<Direction?> {
  TiltDirectionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tiltDirectionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tiltDirectionHash();

  @$internal
  @override
  $ProviderElement<Direction?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Direction? create(Ref ref) {
    return tiltDirection(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Direction? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Direction?>(value),
    );
  }
}

String _$tiltDirectionHash() => r'bee47ebf646ccf79f344206a86640984607d8901';

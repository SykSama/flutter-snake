// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_config.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(gameConfig)
final gameConfigProvider = GameConfigProvider._();

final class GameConfigProvider
    extends $FunctionalProvider<GameConfig, GameConfig, GameConfig>
    with $Provider<GameConfig> {
  GameConfigProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gameConfigProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gameConfigHash();

  @$internal
  @override
  $ProviderElement<GameConfig> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GameConfig create(Ref ref) {
    return gameConfig(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GameConfig value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GameConfig>(value),
    );
  }
}

String _$gameConfigHash() => r'a879d04e0f342a471b02ae03062edc7c2d2e8067';

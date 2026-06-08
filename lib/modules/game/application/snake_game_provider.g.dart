// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snake_game_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(snakeGame)
final snakeGameProvider = SnakeGameProvider._();

final class SnakeGameProvider
    extends $FunctionalProvider<SnakeGame, SnakeGame, SnakeGame>
    with $Provider<SnakeGame> {
  SnakeGameProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'snakeGameProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$snakeGameHash();

  @$internal
  @override
  $ProviderElement<SnakeGame> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SnakeGame create(Ref ref) {
    return snakeGame(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SnakeGame value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SnakeGame>(value),
    );
  }
}

String _$snakeGameHash() => r'd39b6cff58488fd71c4389f1db0eb8c2c0b3830e';

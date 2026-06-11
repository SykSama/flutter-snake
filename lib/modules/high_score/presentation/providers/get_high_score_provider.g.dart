// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_high_score_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getHighScore)
final getHighScoreProvider = GetHighScoreProvider._();

final class GetHighScoreProvider
    extends
        $FunctionalProvider<
          AsyncValue<HighScore>,
          HighScore,
          FutureOr<HighScore>
        >
    with $FutureModifier<HighScore>, $FutureProvider<HighScore> {
  GetHighScoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getHighScoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getHighScoreHash();

  @$internal
  @override
  $FutureProviderElement<HighScore> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<HighScore> create(Ref ref) {
    return getHighScore(ref);
  }
}

String _$getHighScoreHash() => r'23387ce33c4a0b89b49912c6a2c1a7938429df5d';

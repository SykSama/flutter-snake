// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'high_score.providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HighScore)
final highScoreProvider = HighScoreProvider._();

final class HighScoreProvider extends $AsyncNotifierProvider<HighScore, int> {
  HighScoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'highScoreProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$highScoreHash();

  @$internal
  @override
  HighScore create() => HighScore();
}

String _$highScoreHash() => r'b4754296e072ff3fe90d2b8721982e259e6ac6e2';

abstract class _$HighScore extends $AsyncNotifier<int> {
  FutureOr<int> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<int>, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<int>, int>,
              AsyncValue<int>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

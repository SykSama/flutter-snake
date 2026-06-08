// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'high_score.service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(highScoreService)
final highScoreServiceProvider = HighScoreServiceProvider._();

final class HighScoreServiceProvider
    extends
        $FunctionalProvider<
          HighScoreService,
          HighScoreService,
          HighScoreService
        >
    with $Provider<HighScoreService> {
  HighScoreServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'highScoreServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$highScoreServiceHash();

  @$internal
  @override
  $ProviderElement<HighScoreService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HighScoreService create(Ref ref) {
    return highScoreService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HighScoreService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HighScoreService>(value),
    );
  }
}

String _$highScoreServiceHash() => r'5ad293f6d225761447bdd82b355a01edb7414ef5';

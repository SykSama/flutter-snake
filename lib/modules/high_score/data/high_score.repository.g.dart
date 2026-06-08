// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'high_score.repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(highScoreRepository)
final highScoreRepositoryProvider = HighScoreRepositoryProvider._();

final class HighScoreRepositoryProvider
    extends
        $FunctionalProvider<
          HighScoreRepository,
          HighScoreRepository,
          HighScoreRepository
        >
    with $Provider<HighScoreRepository> {
  HighScoreRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'highScoreRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$highScoreRepositoryHash();

  @$internal
  @override
  $ProviderElement<HighScoreRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  HighScoreRepository create(Ref ref) {
    return highScoreRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HighScoreRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HighScoreRepository>(value),
    );
  }
}

String _$highScoreRepositoryHash() =>
    r'35b056dbafccaa8c000aadb42a697247fa1a775d';

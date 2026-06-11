// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_prefs_high_score_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(highScoreLocalDataSource)
final highScoreLocalDataSourceProvider = HighScoreLocalDataSourceProvider._();

final class HighScoreLocalDataSourceProvider
    extends
        $FunctionalProvider<
          SharedPrefsHighScoreDataSource,
          SharedPrefsHighScoreDataSource,
          SharedPrefsHighScoreDataSource
        >
    with $Provider<SharedPrefsHighScoreDataSource> {
  HighScoreLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'highScoreLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$highScoreLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<SharedPrefsHighScoreDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SharedPrefsHighScoreDataSource create(Ref ref) {
    return highScoreLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SharedPrefsHighScoreDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SharedPrefsHighScoreDataSource>(
        value,
      ),
    );
  }
}

String _$highScoreLocalDataSourceHash() =>
    r'9e9abb649c1cc5cd118b6da70d46ab71402a0003';

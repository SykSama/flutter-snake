// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ThemeProvider)
final themeProviderProvider = ThemeProviderProvider._();

final class ThemeProviderProvider
    extends $NotifierProvider<ThemeProvider, AppTheme> {
  ThemeProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeProviderProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeProviderHash();

  @$internal
  @override
  ThemeProvider create() => ThemeProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppTheme value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppTheme>(value),
    );
  }
}

String _$themeProviderHash() => r'aee12c7083d3c8f0778fae96add7c359c1cc2d54';

abstract class _$ThemeProvider extends $Notifier<AppTheme> {
  AppTheme build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AppTheme, AppTheme>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppTheme, AppTheme>,
              AppTheme,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

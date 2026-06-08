// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_session.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GameSession)
final gameSessionProvider = GameSessionProvider._();

final class GameSessionProvider
    extends $NotifierProvider<GameSession, GameSessionState> {
  GameSessionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gameSessionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gameSessionHash();

  @$internal
  @override
  GameSession create() => GameSession();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GameSessionState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GameSessionState>(value),
    );
  }
}

String _$gameSessionHash() => r'93277ee237d34fdd56eee59e13b3df96a1f5267a';

abstract class _$GameSession extends $Notifier<GameSessionState> {
  GameSessionState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<GameSessionState, GameSessionState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GameSessionState, GameSessionState>,
              GameSessionState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

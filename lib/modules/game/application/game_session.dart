import 'package:fnake/modules/game/domain/models/game_phase.dart';
import 'package:fnake/modules/high_score/data/high_score_repository_impl.dart';
import 'package:fnake/modules/high_score/domain/high_score.dart';
import 'package:fnake/modules/high_score/domain/use_cases/set_high_score_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_session.g.dart';

class GameSessionState {
  const GameSessionState({required this.score, required this.phase});

  final int score;
  final GamePhase phase;

  factory GameSessionState.initial() {
    return const GameSessionState(score: 0, phase: GamePhase.ready);
  }

  factory GameSessionState.restart() {
    return const GameSessionState(score: 0, phase: GamePhase.running);
  }

  GameSessionState copyWith({int? score, GamePhase? phase}) {
    return GameSessionState(
      score: score ?? this.score,
      phase: phase ?? this.phase,
    );
  }
}

@riverpod
class GameSession extends _$GameSession {
  @override
  GameSessionState build() => GameSessionState.initial();

  void start() {
    if (state.phase == GamePhase.ready) {
      state = state.copyWith(phase: GamePhase.running);
    }
  }

  void restart() {
    state = GameSessionState.restart();
  }

  void pause() {
    if (state.phase == GamePhase.running) {
      state = state.copyWith(phase: GamePhase.paused);
    }
  }

  void resume() {
    if (state.phase == GamePhase.paused) {
      state = state.copyWith(phase: GamePhase.running);
    }
  }

  void addPoint() {
    state = state.copyWith(score: state.score + 1);
  }

  Future<void> gameOver() async {
    await SetHighScoreUseCase(
      highScoreRepository: ref.read(highScoreRepositoryProvider),
    )(HighScore(score: state.score));

    state = state.copyWith(phase: GamePhase.gameOver);
  }
}

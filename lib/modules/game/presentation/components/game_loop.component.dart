import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fnake/modules/game/application/game_input.dart';
import 'package:fnake/modules/game/application/game_session.dart';
import 'package:fnake/modules/game/domain/models/direction.dart';
import 'package:fnake/modules/game/domain/models/game_config.dart';
import 'package:fnake/modules/game/domain/models/game_phase.dart';
import 'package:fnake/modules/game/domain/models/snake_simulation.dart';

class GameLoopComponent extends Component with RiverpodComponentMixin {
  GameLoopComponent({required this.simulation});

  final SnakeSimulation simulation;
  double _elapsed = 0;

  @override
  FutureOr<void> onLoad() {
    addToGameWidgetBuild(() {
      ref.listen<Direction?>(tiltDirectionProvider, (_, next) {
        if (next == null) return;
        simulation.queueDirection(next);
        ref.read(gameSessionProvider.notifier).start();
      });

      ref.listen<GamePhase>(
        gameSessionProvider.select((state) => state.phase),
        (previous, next) {
          if (next == GamePhase.running && previous == GamePhase.gameOver) {
            simulation.reset();
            _elapsed = 0;
          }
        },
      );
    });

    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (ref.read(gameSessionProvider).phase != GamePhase.running) return;

    _elapsed += dt;
    final secondsPerMove = 1 / ref.read(gameConfigProvider).movesPerSecond;
    while (_elapsed >= secondsPerMove) {
      _elapsed -= secondsPerMove;
      final result = simulation.step();

      if (result.gameOver) {
        ref.read(gameSessionProvider.notifier).gameOver();
        return;
      }

      if (result.ateFood) {
        ref.read(gameSessionProvider.notifier).addPoint();
      }
    }
  }
}

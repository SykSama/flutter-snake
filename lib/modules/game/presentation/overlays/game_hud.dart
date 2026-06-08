import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fnake/app/widgets/score_pill.widget.dart';
import 'package:fnake/modules/game/application/game_session.dart';
import 'package:fnake/modules/game/domain/models/game_phase.dart';
import 'package:fnake/modules/high_score/presentation/best_score_pill_watcher.dart';

class GameHud extends StatelessWidget {
  const GameHud({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              const _ScorePillWatcher(),
              const SizedBox(width: 8),
              const BestScorePillWatcher(),
              const Spacer(),
              const _GameControlsWatcher(),
            ],
          ),
          const Spacer(),
          const _PhasePanelWatcher(),
        ],
      ),
    );
  }
}

class _PhasePanelWatcher extends ConsumerWidget {
  const _PhasePanelWatcher();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phase = ref.watch(gameSessionProvider.select((state) => state.phase));

    return Visibility(
      visible: phase != GamePhase.running,
      child: _PhasePanel(phase),
    );
  }
}

class _ScorePillWatcher extends ConsumerWidget {
  const _ScorePillWatcher();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final score = ref.watch(gameSessionProvider.select((state) => state.score));
    return ScorePill(label: 'Score', value: score);
  }
}

class _GameControlsWatcher extends ConsumerWidget {
  const _GameControlsWatcher();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phase = ref.watch(gameSessionProvider.select((state) => state.phase));
    final notifier = ref.read(gameSessionProvider.notifier);

    return switch (phase) {
      GamePhase.running => IconButton.filledTonal(
        onPressed: notifier.pause,
        icon: const Icon(Icons.pause),
      ),
      GamePhase.paused => IconButton.filledTonal(
        onPressed: notifier.resume,
        icon: const Icon(Icons.play_arrow),
      ),
      GamePhase.ready || GamePhase.gameOver => IconButton.filledTonal(
        onPressed: notifier.restart,
        icon: const Icon(Icons.refresh),
      ),
    };
  }
}

class _PhasePanel extends ConsumerWidget {
  const _PhasePanel(this.phase);

  final GamePhase phase;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = switch (phase) {
      GamePhase.ready => 'Tilt to start',
      GamePhase.paused => 'Paused',
      GamePhase.gameOver => 'Game over',
      GamePhase.running => '',
    };

    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xE6101820),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0x33FFFFFF)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed: ref.read(gameSessionProvider.notifier).restart,
              icon: const Icon(Icons.refresh),
              label: Text(phase == GamePhase.ready ? 'Start' : 'Restart'),
            ),
          ],
        ),
      ),
    );
  }
}

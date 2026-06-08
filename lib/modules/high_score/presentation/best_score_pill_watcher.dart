import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fnake/app/widgets/score_pill.widget.dart';
import 'package:fnake/modules/high_score/presentation/providers/high_score.providers.dart';

class BestScorePillWatcher extends ConsumerWidget {
  const BestScorePillWatcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final highScore$ = ref.watch(highScoreProvider);

    return switch (highScore$) {
      AsyncLoading<int>() => const Text('Skimmer effect ...'),
      AsyncData<int>(:final value) => ScorePill(
        label: 'Best Score',
        value: value,
      ),
      AsyncError<int>() => const Text('Error loading'),
    };
  }
}

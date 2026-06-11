import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fnake/app/widgets/async_value_widget.dart';
import 'package:fnake/app/widgets/score_pill.widget.dart';
import 'package:fnake/modules/high_score/presentation/providers/get_high_score_provider.dart';

class BestScorePillWatcher extends ConsumerWidget {
  const BestScorePillWatcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final highScore$ = ref.watch(getHighScoreProvider);

    return AsyncValueWidget(
      value: highScore$,
      dataBuilder: (score) =>
          ScorePill(label: 'Best score', value: score.score),
    );
  }
}

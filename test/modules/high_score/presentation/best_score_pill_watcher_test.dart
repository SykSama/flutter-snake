import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fnake/app/widgets/score_pill.widget.dart';
import 'package:fnake/modules/high_score/data/high_score_repository_impl.dart';
import 'package:fnake/modules/high_score/domain/high_score.dart';
import 'package:fnake/modules/high_score/domain/hight_score_repository.dart';
import 'package:fnake/modules/high_score/presentation/best_score_pill_watcher.dart';
import 'package:mocktail/mocktail.dart';

class _MockHighScoreRepository extends Mock implements HighScoreRepository {}

void main() {
  late HighScoreRepository repository;

  setUp(() {
    repository = _MockHighScoreRepository();
  });

  Widget buildSubject() {
    return ProviderScope(
      retry: (retryCount, error) => null,
      overrides: [highScoreRepositoryProvider.overrideWithValue(repository)],
      child: const MaterialApp(home: Scaffold(body: BestScorePillWatcher())),
    );
  }

  group('BestScorePillWatcher', () {
    testWidgets('shows a loading indicator while the high score loads', (
      tester,
    ) async {
      when(
        () => repository.load(),
      ).thenAnswer((_) async => const HighScore(score: 42));

      await tester.pumpWidget(buildSubject());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('shows the best score once loaded', (tester) async {
      when(
        () => repository.load(),
      ).thenAnswer((_) async => const HighScore(score: 42));

      await tester.pumpWidget(buildSubject());
      await tester.pump();

      expect(find.text('Best score 42'), findsOneWidget);
      expect(find.byType(ScorePill), findsOneWidget);
    });

    testWidgets('shows the error state when loading fails', (tester) async {
      when(
        () => repository.load(),
      ).thenAnswer((_) async => throw Exception('storage failure'));

      await tester.pumpWidget(buildSubject());
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.textContaining('storage failure'), findsOneWidget);
    });
  });
}

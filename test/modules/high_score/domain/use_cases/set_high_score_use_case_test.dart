import 'package:flutter_test/flutter_test.dart';
import 'package:fnake/modules/high_score/domain/high_score.dart';
import 'package:fnake/modules/high_score/domain/hight_score_repository.dart';
import 'package:fnake/modules/high_score/domain/use_cases/set_high_score_use_case.dart';
import 'package:mocktail/mocktail.dart';

class _MockHighScoreRepository extends Mock implements HighScoreRepository {}

class _FakeHighScore extends Fake implements HighScore {}

void main() {
  late HighScoreRepository mockHighScoreRepository;
  late SetHighScoreUseCase setHighScoreUseCase;

  setUpAll(() {
    registerFallbackValue(_FakeHighScore());
  });

  setUp(() {
    mockHighScoreRepository = _MockHighScoreRepository();
    setHighScoreUseCase = SetHighScoreUseCase(
      highScoreRepository: mockHighScoreRepository,
    );

    when(() => mockHighScoreRepository.save(any())).thenAnswer((_) async {});
  });

  group('SetHighScoreUseCase', () {
    test('saves the score when it beats the current high score', () async {
      when(
        () => mockHighScoreRepository.load(),
      ).thenAnswer((_) async => const HighScore(score: 10));

      await setHighScoreUseCase(const HighScore(score: 11));

      verify(
        () => mockHighScoreRepository.save(const HighScore(score: 11)),
      ).called(1);
    });

    test(
      'does not save when the score is lower than the current high score',
      () async {
        when(
          () => mockHighScoreRepository.load(),
        ).thenAnswer((_) async => const HighScore(score: 10));

        await setHighScoreUseCase(const HighScore(score: 9));

        verifyNever(() => mockHighScoreRepository.save(any()));
      },
    );

    test(
      'does not save when the score equals the current high score',
      () async {
        when(
          () => mockHighScoreRepository.load(),
        ).thenAnswer((_) async => const HighScore(score: 10));

        await setHighScoreUseCase(const HighScore(score: 10));

        verifyNever(() => mockHighScoreRepository.save(any()));
      },
    );

    test('saves the first score when no high score exists yet', () async {
      when(
        () => mockHighScoreRepository.load(),
      ).thenAnswer((_) async => const HighScore(score: 0));

      await setHighScoreUseCase(const HighScore(score: 1));

      verify(
        () => mockHighScoreRepository.save(const HighScore(score: 1)),
      ).called(1);
    });
  });
}

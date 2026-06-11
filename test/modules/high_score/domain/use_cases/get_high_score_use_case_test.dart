import 'package:flutter_test/flutter_test.dart';
import 'package:fnake/modules/high_score/domain/high_score.dart';
import 'package:fnake/modules/high_score/domain/hight_score_repository.dart';
import 'package:fnake/modules/high_score/domain/use_cases/get_high_score_use_case.dart';
import 'package:mocktail/mocktail.dart';

class _MockHighScoreRepository extends Mock implements HighScoreRepository {}

void main() {
  late HighScoreRepository mockHighScoreRepository;
  late GetHighScoreUseCase getHighScoreUseCase;

  setUp(() {
    mockHighScoreRepository = _MockHighScoreRepository();
    getHighScoreUseCase = GetHighScoreUseCase(
      highScoreRepository: mockHighScoreRepository,
    );
  });

  group('GetHighScoreUseCase', () {
    test('returns the high score from the repository', () async {
      const highScore = HighScore(score: 42);
      when(
        () => mockHighScoreRepository.load(),
      ).thenAnswer((_) async => highScore);

      final result = await getHighScoreUseCase();

      expect(result, highScore);
      verify(() => mockHighScoreRepository.load()).called(1);
    });

    test('propagates repository errors', () async {
      when(
        () => mockHighScoreRepository.load(),
      ).thenAnswer((_) async => throw Exception('storage failure'));

      expect(() => getHighScoreUseCase(), throwsA(isA<Exception>()));
    });
  });
}

import 'package:fnake/modules/high_score/domain/high_score.dart';
import 'package:fnake/modules/high_score/domain/hight_score_repository.dart';

class SetHighScoreUseCase {
  final HighScoreRepository _highScoreRepository;

  const SetHighScoreUseCase({required this._highScoreRepository});

  Future<void> call(HighScore score) async {
    final current = await _highScoreRepository.load();

    if (score.score > current.score) {
      return _highScoreRepository.save(score);
    }
  }
}

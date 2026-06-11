import 'package:fnake/modules/high_score/domain/high_score.dart';
import 'package:fnake/modules/high_score/domain/hight_score_repository.dart';

class GetHighScoreUseCase {
  final HighScoreRepository _highScoreRepository;

  const GetHighScoreUseCase({required this._highScoreRepository});

  Future<HighScore> call() {
    return _highScoreRepository.load();
  }
}

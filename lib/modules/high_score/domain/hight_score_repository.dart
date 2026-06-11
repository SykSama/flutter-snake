import 'package:fnake/modules/high_score/domain/high_score.dart';

abstract class HighScoreRepository {
  Future<HighScore> load();
  Future<void> save(HighScore score);
}

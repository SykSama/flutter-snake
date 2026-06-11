import 'package:fnake/modules/high_score/data/dtos/high_score_dto.dart';

abstract class HighScoreLocalDataSource {
  Future<HighScoreDto> load();
  Future<void> save(HighScoreDto score);
}

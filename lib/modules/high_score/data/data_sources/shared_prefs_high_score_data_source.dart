import 'package:fnake/modules/high_score/data/data_sources/high_score_local_data_source.dart';
import 'package:fnake/modules/high_score/data/dtos/high_score_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_prefs_high_score_data_source.g.dart';

@riverpod
SharedPrefsHighScoreDataSource highScoreLocalDataSource(Ref ref) {
  return SharedPrefsHighScoreDataSource();
}

class SharedPrefsHighScoreDataSource implements HighScoreLocalDataSource {
  static const _key = 'high_score';

  @override
  Future<HighScoreDto> load() async {
    final prefs = await SharedPreferences.getInstance();
    return HighScoreDto(score: prefs.getInt(_key) ?? 0);
  }

  @override
  Future<void> save(HighScoreDto score) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_key, score.score);
  }
}

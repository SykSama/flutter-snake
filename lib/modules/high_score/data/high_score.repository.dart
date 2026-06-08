import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'high_score.repository.g.dart';

abstract class HighScoreRepository {
  Future<int> load();
  Future<void> save(int score);
}

@riverpod
HighScoreRepository highScoreRepository(Ref ref) {
  return SharedPrefsHighScoreRepository();
}

class SharedPrefsHighScoreRepository implements HighScoreRepository {
  static const _key = 'high_score';

  @override
  Future<int> load() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_key) ?? 0;
  }

  @override
  Future<void> save(int score) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_key, score);
  }
}

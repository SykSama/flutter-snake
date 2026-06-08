import 'package:fnake/modules/high_score/application/high_score.service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'high_score.providers.g.dart';

@riverpod
class HighScore extends _$HighScore {
  @override
  FutureOr<int> build() => ref.watch(highScoreServiceProvider).load();

  Future<void> updateScore(int score) async {
    final current = await future;
    if (score > current) {
      await ref.read(highScoreServiceProvider).save(score);
      state = AsyncData(score);
    }
  }
}

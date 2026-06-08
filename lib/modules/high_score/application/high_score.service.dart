import 'package:fnake/modules/high_score/data/high_score.repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'high_score.service.g.dart';

@riverpod
HighScoreService highScoreService(Ref ref) {
  return HighScoreService(
    repository: ref.watch(highScoreRepositoryProvider),
  );
}

class HighScoreService {
  const HighScoreService({required this.repository});

  final HighScoreRepository repository;

  Future<int> load() => repository.load();

  Future<void> save(int score) => repository.save(score);
}

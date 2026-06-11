import 'package:fnake/modules/high_score/data/high_score_repository_impl.dart';
import 'package:fnake/modules/high_score/domain/high_score.dart';
import 'package:fnake/modules/high_score/domain/use_cases/get_high_score_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_high_score_provider.g.dart';

@riverpod
FutureOr<HighScore> getHighScore(Ref ref) {
  return GetHighScoreUseCase(
    highScoreRepository: ref.read(highScoreRepositoryProvider),
  )();
}

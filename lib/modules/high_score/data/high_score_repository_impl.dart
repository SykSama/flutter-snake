import 'package:fnake/modules/high_score/data/data_sources/high_score_local_data_source.dart';
import 'package:fnake/modules/high_score/data/data_sources/shared_prefs_high_score_data_source.dart';
import 'package:fnake/modules/high_score/data/dtos/high_score_dto.dart';
import 'package:fnake/modules/high_score/domain/high_score.dart';
import 'package:fnake/modules/high_score/domain/hight_score_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'high_score_repository_impl.g.dart';

@riverpod
HighScoreRepository highScoreRepository(Ref ref) {
  return HighScoreRepositoryImpl(
    localDataSource: ref.watch(highScoreLocalDataSourceProvider),
  );
}

class HighScoreRepositoryImpl implements HighScoreRepository {
  final HighScoreLocalDataSource _localDataSource;

  const HighScoreRepositoryImpl({required this._localDataSource});

  @override
  Future<HighScore> load() async {
    final highScoreDto = await _localDataSource.load();
    return highScoreDto.toDomain();
  }

  @override
  Future<void> save(HighScore score) async {
    await _localDataSource.save(HighScoreDtoAdapter.fromDomain(score));
  }
}

import 'package:fnake/modules/high_score/domain/high_score.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'high_score_dto.freezed.dart';
part 'high_score_dto.g.dart';

@freezed
abstract class HighScoreDto with _$HighScoreDto {
  const factory HighScoreDto({required int score}) = _HighScoreDto;

  factory HighScoreDto.fromJson(Map<String, dynamic> json) =>
      _$HighScoreDtoFromJson(json);
}

extension HighScoreDtoAdapter on HighScoreDto {
  HighScore toDomain() => HighScore(score: score);

  static HighScoreDto fromDomain(HighScore score) {
    return HighScoreDto(score: score.score);
  }
}

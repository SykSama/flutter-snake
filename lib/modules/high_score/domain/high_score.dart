import 'package:freezed_annotation/freezed_annotation.dart';

part 'high_score.freezed.dart';

@freezed
abstract class HighScore with _$HighScore {
  const factory HighScore({required int score}) = _HighScore;
}

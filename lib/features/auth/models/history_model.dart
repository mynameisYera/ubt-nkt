import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_model.freezed.dart';
part 'history_model.g.dart';

@freezed
abstract class HistoryResponse with _$HistoryResponse {
  const factory HistoryResponse({
    required List<HistoryAttempt> attempts,
  }) = _HistoryResponse;

  factory HistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$HistoryResponseFromJson(json);
}

@freezed
abstract class HistoryAttempt with _$HistoryAttempt {
  const factory HistoryAttempt({
    required int id,
    @JsonKey(name: 'exam_type') required String examType,
    required String status,
    required String label,
    @JsonKey(name: 'started_at') required String startedAt,
    @JsonKey(name: 'finished_at') String? finishedAt,
    @JsonKey(name: 'time_limit_minutes') required int timeLimitMinutes,
    @JsonKey(name: 'total_score') required int totalScore,
    @JsonKey(name: 'max_score') required int maxScore,
    required List<HistorySubject> subjects,
  }) = _HistoryAttempt;

  factory HistoryAttempt.fromJson(Map<String, dynamic> json) =>
      _$HistoryAttemptFromJson(json);
}

@freezed
abstract class HistorySubject with _$HistorySubject {
  const factory HistorySubject({
    required String name,
    required int score,
    @JsonKey(name: 'max_score') required int maxScore,
  }) = _HistorySubject;

  factory HistorySubject.fromJson(Map<String, dynamic> json) =>
      _$HistorySubjectFromJson(json);
}

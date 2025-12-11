import 'package:freezed_annotation/freezed_annotation.dart';
part 'test_model.freezed.dart';
part 'test_model.g.dart';

@freezed
abstract class ExamAttempt with _$ExamAttempt {
  const factory ExamAttempt({
    required int id,
    @JsonKey(name: 'exam_type') required String examType,
    required String status,
    @JsonKey(name: 'time_limit_minutes') required int timeLimitMinutes,
    @JsonKey(name: 'started_at') String? startedAt,
    @JsonKey(name: 'expires_at') required String expiresAt,
    @JsonKey(name: 'remaining_seconds') required int remainingSeconds,
    @JsonKey(name: 'ent_pair_id') int? entPairId,
    @JsonKey(name: 'nkt_subject_id') int? nktSubjectId,
    @JsonKey(name: 'total_score') int? totalScore,
    @JsonKey(name: 'max_score') int? maxScore,
    required List<SubjectAttempt> subjects,
  }) = _ExamAttempt;

  factory ExamAttempt.fromJson(Map<String, dynamic> json) =>
      _$ExamAttemptFromJson(json);
}


@freezed
abstract class SubjectAttempt with _$SubjectAttempt {
  const factory SubjectAttempt({
    required int id,
    required int subject,
    @JsonKey(name: 'display_name') required String displayName,
    required String bucket,
    @JsonKey(name: 'sequence_index') required int sequenceIndex,
    @JsonKey(name: 'question_count') int? questionCount,
    @JsonKey(name: 'max_score') int? maxScore,
    int? score,
    List<dynamic>? questions,
  }) = _SubjectAttempt;

  factory SubjectAttempt.fromJson(Map<String, dynamic> json) =>
      _$SubjectAttemptFromJson(json);
}

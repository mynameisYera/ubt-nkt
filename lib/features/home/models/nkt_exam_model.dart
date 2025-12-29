// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:brand_test/features/home/models/exam_model.dart';
part 'nkt_exam_model.freezed.dart';
part 'nkt_exam_model.g.dart';

@freezed
abstract class NktExamModel with _$NktExamModel {
  const factory NktExamModel({
    @JsonKey(name: 'exam_type') required String examType,
    required List<NktSubject> subjects,
    @JsonKey(name: 'ordering_rules') required List<String> orderingRules,
    required List<String> tools,
    @JsonKey(name: 'time_limit_minutes') required NktTimeLimit timeLimitMinutes,
    required int quota,
    InProgressAttempt? in_progress_attempt,
  }) = _NktExamModel;

  factory NktExamModel.fromJson(Map<String, dynamic> json) =>
      _$NktExamModelFromJson(json);
}

@freezed
abstract class NktSubject with _$NktSubject {
  const factory NktSubject({
    required int id,
    required String code,
    required String name,
    required String bucket,
    @JsonKey(name: 'question_quota') required int questionQuota,
    @JsonKey(name: 'is_active') required bool isActive,
  }) = _NktSubject;

  factory NktSubject.fromJson(Map<String, dynamic> json) =>
      _$NktSubjectFromJson(json);
}

@freezed
abstract class NktTimeLimit with _$NktTimeLimit {
  const factory NktTimeLimit({
    @JsonKey(name: 'default') required int default_,
    required int extended,
    @JsonKey(name: 'extended_subject_codes')
        required List<String> extendedSubjectCodes,
  }) = _NktTimeLimit;

  factory NktTimeLimit.fromJson(Map<String, dynamic> json) =>
      _$NktTimeLimitFromJson(json);
}

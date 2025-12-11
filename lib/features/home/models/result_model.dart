// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_model.freezed.dart';
part 'result_model.g.dart';

@freezed
abstract class ResultModel with _$ResultModel {
  const factory ResultModel({
    required int id,
    @JsonKey(name: 'exam_type') required String examType,
    required String status,
    @JsonKey(name: 'total_score') required int totalScore,
    @JsonKey(name: 'max_score') required int maxScore,
    required List<ResultSubjectModel> subjects,
  }) = _ResultModel;

  factory ResultModel.fromJson(Map<String, dynamic> json) =>
      _$ResultModelFromJson(json);
}

@freezed
abstract class ResultSubjectModel with _$ResultSubjectModel {
  const factory ResultSubjectModel({
    @JsonKey(name: 'subject_attempt_id') required int subjectAttemptId,
    required String name,
    required int score,
    @JsonKey(name: 'max_score') required int maxScore,
    required List<ResultQuestionModel> questions,
  }) = _ResultSubjectModel;

  factory ResultSubjectModel.fromJson(Map<String, dynamic> json) =>
      _$ResultSubjectModelFromJson(json);
}

@freezed
abstract class ResultQuestionModel with _$ResultQuestionModel {
  const factory ResultQuestionModel({
    @JsonKey(name: 'attempt_question_id') required int attemptQuestionId,
    required int sequence,
    @JsonKey(name: 'question_type') required String questionType,
    @JsonKey(name: 'score_awarded') required int scoreAwarded,
    @JsonKey(name: 'max_score') required int maxScore,
    required bool answered,
  }) = _ResultQuestionModel;

  factory ResultQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$ResultQuestionModelFromJson(json);
}

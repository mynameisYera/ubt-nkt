import 'package:freezed_annotation/freezed_annotation.dart';
part 'exam_model.freezed.dart';
part 'exam_model.g.dart';

@freezed
abstract class ExamModel with _$ExamModel {
  const factory ExamModel({
    required String exam_type,
    required int time_limit_minutes,
    required List<BlockSubject> block1_subjects,
    required List<Pair> pairs,
    required List<QuestionType> question_types,
    required List<String> ordering_rules,
    required List<String> tools,
    required int quota,
  }) = _ExamModel;

  factory ExamModel.fromJson(Map<String, dynamic> json) =>
      _$ExamModelFromJson(json);
}

@freezed
abstract class BlockSubject with _$BlockSubject {
  const factory BlockSubject({
    required String code,
    required String name,
    required int question_count,
  }) = _BlockSubject;

  factory BlockSubject.fromJson(Map<String, dynamic> json) =>
      _$BlockSubjectFromJson(json);
}

@freezed
abstract class Pair with _$Pair {
  const factory Pair({
    required int id,
    required String code,
    required String label,
    required bool is_active,
    required Subject first_subject,
    required Subject second_subject,
  }) = _Pair;

  factory Pair.fromJson(Map<String, dynamic> json) =>
      _$PairFromJson(json);
}

@freezed
abstract class Subject with _$Subject {
  const factory Subject({
    required int id,
    required String code,
    required String name,
    required String bucket,
    required int question_quota,
    required bool is_active,
  }) = _Subject;

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);
}

@freezed
abstract class QuestionType with _$QuestionType {
  const factory QuestionType({
    required String label,
    required String scoring,
  }) = _QuestionType;

  factory QuestionType.fromJson(Map<String, dynamic> json) =>
      _$QuestionTypeFromJson(json);
}

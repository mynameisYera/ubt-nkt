// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResultModel _$ResultModelFromJson(Map<String, dynamic> json) => _ResultModel(
  id: (json['id'] as num).toInt(),
  examType: json['exam_type'] as String,
  status: json['status'] as String,
  totalScore: (json['total_score'] as num).toInt(),
  maxScore: (json['max_score'] as num).toInt(),
  subjects: (json['subjects'] as List<dynamic>)
      .map((e) => ResultSubjectModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ResultModelToJson(_ResultModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exam_type': instance.examType,
      'status': instance.status,
      'total_score': instance.totalScore,
      'max_score': instance.maxScore,
      'subjects': instance.subjects,
    };

_ResultSubjectModel _$ResultSubjectModelFromJson(Map<String, dynamic> json) =>
    _ResultSubjectModel(
      subjectAttemptId: (json['subject_attempt_id'] as num).toInt(),
      name: json['name'] as String,
      score: (json['score'] as num).toInt(),
      maxScore: (json['max_score'] as num).toInt(),
      questions: (json['questions'] as List<dynamic>)
          .map((e) => ResultQuestionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultSubjectModelToJson(_ResultSubjectModel instance) =>
    <String, dynamic>{
      'subject_attempt_id': instance.subjectAttemptId,
      'name': instance.name,
      'score': instance.score,
      'max_score': instance.maxScore,
      'questions': instance.questions,
    };

_ResultQuestionModel _$ResultQuestionModelFromJson(Map<String, dynamic> json) =>
    _ResultQuestionModel(
      attemptQuestionId: (json['attempt_question_id'] as num).toInt(),
      sequence: (json['sequence'] as num).toInt(),
      questionType: json['question_type'] as String,
      scoreAwarded: (json['score_awarded'] as num).toInt(),
      maxScore: (json['max_score'] as num).toInt(),
      answered: json['answered'] as bool,
    );

Map<String, dynamic> _$ResultQuestionModelToJson(
  _ResultQuestionModel instance,
) => <String, dynamic>{
  'attempt_question_id': instance.attemptQuestionId,
  'sequence': instance.sequence,
  'question_type': instance.questionType,
  'score_awarded': instance.scoreAwarded,
  'max_score': instance.maxScore,
  'answered': instance.answered,
};

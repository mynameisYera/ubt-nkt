// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExamAttempt _$ExamAttemptFromJson(Map<String, dynamic> json) => _ExamAttempt(
  id: (json['id'] as num).toInt(),
  examType: json['exam_type'] as String,
  status: json['status'] as String,
  timeLimitMinutes: (json['time_limit_minutes'] as num).toInt(),
  startedAt: json['started_at'] as String?,
  expiresAt: json['expires_at'] as String,
  remainingSeconds: (json['remaining_seconds'] as num).toInt(),
  entPairId: (json['ent_pair_id'] as num?)?.toInt(),
  nktSubjectId: (json['nkt_subject_id'] as num?)?.toInt(),
  totalScore: (json['total_score'] as num?)?.toInt(),
  maxScore: (json['max_score'] as num?)?.toInt(),
  subjects: (json['subjects'] as List<dynamic>)
      .map((e) => SubjectAttempt.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ExamAttemptToJson(_ExamAttempt instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exam_type': instance.examType,
      'status': instance.status,
      'time_limit_minutes': instance.timeLimitMinutes,
      'started_at': instance.startedAt,
      'expires_at': instance.expiresAt,
      'remaining_seconds': instance.remainingSeconds,
      'ent_pair_id': instance.entPairId,
      'nkt_subject_id': instance.nktSubjectId,
      'total_score': instance.totalScore,
      'max_score': instance.maxScore,
      'subjects': instance.subjects,
    };

_AnswerPayload _$AnswerPayloadFromJson(Map<String, dynamic> json) =>
    _AnswerPayload(selectedOptionId: json['selected_option_id'] as String);

Map<String, dynamic> _$AnswerPayloadToJson(_AnswerPayload instance) =>
    <String, dynamic>{'selected_option_id': instance.selectedOptionId};

_Answer _$AnswerFromJson(Map<String, dynamic> json) => _Answer(
  answerPayload: AnswerPayload.fromJson(
    json['answer_payload'] as Map<String, dynamic>,
  ),
  isAnswered: json['is_answered'] as bool,
  scoreAwarded: (json['score_awarded'] as num).toInt(),
  updatedAt: json['updated_at'] as String,
);

Map<String, dynamic> _$AnswerToJson(_Answer instance) => <String, dynamic>{
  'answer_payload': instance.answerPayload,
  'is_answered': instance.isAnswered,
  'score_awarded': instance.scoreAwarded,
  'updated_at': instance.updatedAt,
};

_SubjectAttempt _$SubjectAttemptFromJson(Map<String, dynamic> json) =>
    _SubjectAttempt(
      id: (json['id'] as num).toInt(),
      subject: (json['subject'] as num).toInt(),
      displayName: json['display_name'] as String,
      bucket: json['bucket'] as String,
      sequenceIndex: (json['sequence_index'] as num).toInt(),
      questionCount: (json['question_count'] as num?)?.toInt(),
      maxScore: (json['max_score'] as num?)?.toInt(),
      score: (json['score'] as num?)?.toInt(),
      questions: json['questions'] as List<dynamic>?,
      contextPayload: json['context_payload'],
      answer: json['answer'] == null
          ? null
          : Answer.fromJson(json['answer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubjectAttemptToJson(_SubjectAttempt instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subject': instance.subject,
      'display_name': instance.displayName,
      'bucket': instance.bucket,
      'sequence_index': instance.sequenceIndex,
      'question_count': instance.questionCount,
      'max_score': instance.maxScore,
      'score': instance.score,
      'questions': instance.questions,
      'context_payload': instance.contextPayload,
      'answer': instance.answer,
    };

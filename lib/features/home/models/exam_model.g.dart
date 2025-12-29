// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExamModel _$ExamModelFromJson(Map<String, dynamic> json) => _ExamModel(
  exam_type: json['exam_type'] as String,
  time_limit_minutes: (json['time_limit_minutes'] as num).toInt(),
  block1_subjects: (json['block1_subjects'] as List<dynamic>)
      .map((e) => BlockSubject.fromJson(e as Map<String, dynamic>))
      .toList(),
  pairs: (json['pairs'] as List<dynamic>)
      .map((e) => Pair.fromJson(e as Map<String, dynamic>))
      .toList(),
  question_types: (json['question_types'] as List<dynamic>)
      .map((e) => QuestionType.fromJson(e as Map<String, dynamic>))
      .toList(),
  ordering_rules: (json['ordering_rules'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  tools: (json['tools'] as List<dynamic>).map((e) => e as String).toList(),
  quota: (json['quota'] as num).toInt(),
  in_progress_attempt: json['in_progress_attempt'] == null
      ? null
      : InProgressAttempt.fromJson(
          json['in_progress_attempt'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ExamModelToJson(_ExamModel instance) =>
    <String, dynamic>{
      'exam_type': instance.exam_type,
      'time_limit_minutes': instance.time_limit_minutes,
      'block1_subjects': instance.block1_subjects,
      'pairs': instance.pairs,
      'question_types': instance.question_types,
      'ordering_rules': instance.ordering_rules,
      'tools': instance.tools,
      'quota': instance.quota,
      'in_progress_attempt': instance.in_progress_attempt,
    };

_BlockSubject _$BlockSubjectFromJson(Map<String, dynamic> json) =>
    _BlockSubject(
      code: json['code'] as String,
      name: json['name'] as String,
      question_count: (json['question_count'] as num).toInt(),
    );

Map<String, dynamic> _$BlockSubjectToJson(_BlockSubject instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'question_count': instance.question_count,
    };

_Pair _$PairFromJson(Map<String, dynamic> json) => _Pair(
  id: (json['id'] as num).toInt(),
  code: json['code'] as String,
  label: json['label'] as String,
  is_active: json['is_active'] as bool,
  first_subject: Subject.fromJson(
    json['first_subject'] as Map<String, dynamic>,
  ),
  second_subject: Subject.fromJson(
    json['second_subject'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$PairToJson(_Pair instance) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'label': instance.label,
  'is_active': instance.is_active,
  'first_subject': instance.first_subject,
  'second_subject': instance.second_subject,
};

_Subject _$SubjectFromJson(Map<String, dynamic> json) => _Subject(
  id: (json['id'] as num).toInt(),
  code: json['code'] as String,
  name: json['name'] as String,
  bucket: json['bucket'] as String,
  question_quota: (json['question_quota'] as num).toInt(),
  is_active: json['is_active'] as bool,
);

Map<String, dynamic> _$SubjectToJson(_Subject instance) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'name': instance.name,
  'bucket': instance.bucket,
  'question_quota': instance.question_quota,
  'is_active': instance.is_active,
};

_QuestionType _$QuestionTypeFromJson(Map<String, dynamic> json) =>
    _QuestionType(
      label: json['label'] as String,
      scoring: json['scoring'] as String,
    );

Map<String, dynamic> _$QuestionTypeToJson(_QuestionType instance) =>
    <String, dynamic>{'label': instance.label, 'scoring': instance.scoring};

_InProgressAttempt _$InProgressAttemptFromJson(Map<String, dynamic> json) =>
    _InProgressAttempt(
      id: (json['id'] as num).toInt(),
      exam_type: json['exam_type'] as String,
      status: json['status'] as String,
      time_limit_minutes: (json['time_limit_minutes'] as num).toInt(),
      started_at: json['started_at'] as String,
      expires_at: json['expires_at'] as String,
      remaining_seconds: (json['remaining_seconds'] as num).toInt(),
      ent_pair: json['ent_pair'] == null
          ? null
          : EntPair.fromJson(json['ent_pair'] as Map<String, dynamic>),
      nkt_subject: json['nkt_subject'],
    );

Map<String, dynamic> _$InProgressAttemptToJson(_InProgressAttempt instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exam_type': instance.exam_type,
      'status': instance.status,
      'time_limit_minutes': instance.time_limit_minutes,
      'started_at': instance.started_at,
      'expires_at': instance.expires_at,
      'remaining_seconds': instance.remaining_seconds,
      'ent_pair': instance.ent_pair,
      'nkt_subject': instance.nkt_subject,
    };

_EntPair _$EntPairFromJson(Map<String, dynamic> json) =>
    _EntPair(id: (json['id'] as num).toInt(), label: json['label'] as String);

Map<String, dynamic> _$EntPairToJson(_EntPair instance) => <String, dynamic>{
  'id': instance.id,
  'label': instance.label,
};

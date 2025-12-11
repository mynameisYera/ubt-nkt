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
  quota: Quota.fromJson(json['quota'] as Map<String, dynamic>),
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

_Quota _$QuotaFromJson(Map<String, dynamic> json) =>
    _Quota(ent_remaining: (json['ent_remaining'] as num).toInt());

Map<String, dynamic> _$QuotaToJson(_Quota instance) => <String, dynamic>{
  'ent_remaining': instance.ent_remaining,
};

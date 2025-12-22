// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nkt_exam_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NktExamModel _$NktExamModelFromJson(Map<String, dynamic> json) =>
    _NktExamModel(
      examType: json['exam_type'] as String,
      subjects: (json['subjects'] as List<dynamic>)
          .map((e) => NktSubject.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderingRules: (json['ordering_rules'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      tools: (json['tools'] as List<dynamic>).map((e) => e as String).toList(),
      timeLimitMinutes: NktTimeLimit.fromJson(
        json['time_limit_minutes'] as Map<String, dynamic>,
      ),
      quota: (json['quota'] as num).toInt(),
    );

Map<String, dynamic> _$NktExamModelToJson(_NktExamModel instance) =>
    <String, dynamic>{
      'exam_type': instance.examType,
      'subjects': instance.subjects,
      'ordering_rules': instance.orderingRules,
      'tools': instance.tools,
      'time_limit_minutes': instance.timeLimitMinutes,
      'quota': instance.quota,
    };

_NktSubject _$NktSubjectFromJson(Map<String, dynamic> json) => _NktSubject(
  id: (json['id'] as num).toInt(),
  code: json['code'] as String,
  name: json['name'] as String,
  bucket: json['bucket'] as String,
  questionQuota: (json['question_quota'] as num).toInt(),
  isActive: json['is_active'] as bool,
);

Map<String, dynamic> _$NktSubjectToJson(_NktSubject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'bucket': instance.bucket,
      'question_quota': instance.questionQuota,
      'is_active': instance.isActive,
    };

_NktTimeLimit _$NktTimeLimitFromJson(Map<String, dynamic> json) =>
    _NktTimeLimit(
      default_: (json['default'] as num).toInt(),
      extended: (json['extended'] as num).toInt(),
      extendedSubjectCodes: (json['extended_subject_codes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$NktTimeLimitToJson(_NktTimeLimit instance) =>
    <String, dynamic>{
      'default': instance.default_,
      'extended': instance.extended,
      'extended_subject_codes': instance.extendedSubjectCodes,
    };

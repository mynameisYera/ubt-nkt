// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) =>
    _ProfileModel(
      school: SchoolModel.fromJson(json['school'] as Map<String, dynamic>),
      group: json['group'],
      quota: QuotaModel.fromJson(json['quota'] as Map<String, dynamic>),
      attempts: (json['attempts'] as List<dynamic>)
          .map((e) => AttemptModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProfileModelToJson(_ProfileModel instance) =>
    <String, dynamic>{
      'school': instance.school,
      'group': instance.group,
      'quota': instance.quota,
      'attempts': instance.attempts,
    };

_QuotaModel _$QuotaModelFromJson(Map<String, dynamic> json) => _QuotaModel(
  entQuota: (json['ent_quota'] as num?)?.toInt(),
  nktQuota: (json['nkt_quota'] as num?)?.toInt(),
);

Map<String, dynamic> _$QuotaModelToJson(_QuotaModel instance) =>
    <String, dynamic>{
      'ent_quota': instance.entQuota,
      'nkt_quota': instance.nktQuota,
    };

_AttemptModel _$AttemptModelFromJson(Map<String, dynamic> json) =>
    _AttemptModel(
      id: (json['id'] as num).toInt(),
      examType: json['exam_type'] as String,
      status: json['status'] as String,
      label: json['label'] as String,
      startedAt: json['started_at'] as String,
      finishedAt: json['finished_at'] as String,
      timeLimitMinutes: (json['time_limit_minutes'] as num).toInt(),
      totalScore: (json['total_score'] as num).toInt(),
      maxScore: (json['max_score'] as num).toInt(),
      subjects: (json['subjects'] as List<dynamic>)
          .map((e) => SubjectScoreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AttemptModelToJson(_AttemptModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'exam_type': instance.examType,
      'status': instance.status,
      'label': instance.label,
      'started_at': instance.startedAt,
      'finished_at': instance.finishedAt,
      'time_limit_minutes': instance.timeLimitMinutes,
      'total_score': instance.totalScore,
      'max_score': instance.maxScore,
      'subjects': instance.subjects,
    };

_SubjectScoreModel _$SubjectScoreModelFromJson(Map<String, dynamic> json) =>
    _SubjectScoreModel(
      name: json['name'] as String,
      score: (json['score'] as num).toInt(),
      maxScore: (json['max_score'] as num).toInt(),
    );

Map<String, dynamic> _$SubjectScoreModelToJson(_SubjectScoreModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'score': instance.score,
      'max_score': instance.maxScore,
    };

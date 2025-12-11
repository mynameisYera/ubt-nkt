// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HistoryResponse _$HistoryResponseFromJson(Map<String, dynamic> json) =>
    _HistoryResponse(
      attempts: (json['attempts'] as List<dynamic>)
          .map((e) => HistoryAttempt.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HistoryResponseToJson(_HistoryResponse instance) =>
    <String, dynamic>{'attempts': instance.attempts};

_HistoryAttempt _$HistoryAttemptFromJson(Map<String, dynamic> json) =>
    _HistoryAttempt(
      id: (json['id'] as num).toInt(),
      examType: json['exam_type'] as String,
      status: json['status'] as String,
      label: json['label'] as String,
      startedAt: json['started_at'] as String,
      finishedAt: json['finished_at'] as String?,
      timeLimitMinutes: (json['time_limit_minutes'] as num).toInt(),
      totalScore: (json['total_score'] as num).toInt(),
      maxScore: (json['max_score'] as num).toInt(),
      subjects: (json['subjects'] as List<dynamic>)
          .map((e) => HistorySubject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HistoryAttemptToJson(_HistoryAttempt instance) =>
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

_HistorySubject _$HistorySubjectFromJson(Map<String, dynamic> json) =>
    _HistorySubject(
      name: json['name'] as String,
      score: (json['score'] as num).toInt(),
      maxScore: (json['max_score'] as num).toInt(),
    );

Map<String, dynamic> _$HistorySubjectToJson(_HistorySubject instance) =>
    <String, dynamic>{
      'name': instance.name,
      'score': instance.score,
      'max_score': instance.maxScore,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finish_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FinishRequestModel _$FinishRequestModelFromJson(Map<String, dynamic> json) =>
    _FinishRequestModel(
      subjects: (json['subjects'] as List<dynamic>)
          .map((e) => FinishSubjectModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      challenge: ChallengeModel.fromJson(
        json['challenge'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$FinishRequestModelToJson(_FinishRequestModel instance) =>
    <String, dynamic>{
      'subjects': instance.subjects,
      'challenge': instance.challenge,
    };

_FinishSubjectModel _$FinishSubjectModelFromJson(Map<String, dynamic> json) =>
    _FinishSubjectModel(
      subjectAttemptId: (json['subject_attempt_id'] as num).toInt(),
      name: json['name'] as String,
      answered: (json['answered'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$FinishSubjectModelToJson(_FinishSubjectModel instance) =>
    <String, dynamic>{
      'subject_attempt_id': instance.subjectAttemptId,
      'name': instance.name,
      'answered': instance.answered,
      'total': instance.total,
    };

_ChallengeModel _$ChallengeModelFromJson(Map<String, dynamic> json) =>
    _ChallengeModel(
      left: (json['left'] as num).toInt(),
      right: (json['right'] as num).toInt(),
    );

Map<String, dynamic> _$ChallengeModelToJson(_ChallengeModel instance) =>
    <String, dynamic>{'left': instance.left, 'right': instance.right};

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../auth/models/user_login_model.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
abstract class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    required SchoolModel school,
    dynamic group,
    required QuotaModel quota,
    required List<AttemptModel> attempts,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}

@freezed
abstract class QuotaModel with _$QuotaModel {
  const factory QuotaModel({
    @JsonKey(name: 'ent_quota') int? entQuota,
    @JsonKey(name: 'nkt_quota') int? nktQuota,
  }) = _QuotaModel;

  factory QuotaModel.fromJson(Map<String, dynamic> json) =>
      _$QuotaModelFromJson(json);
}

@freezed
abstract class AttemptModel with _$AttemptModel {
  const factory AttemptModel({
    required int id,
    @JsonKey(name: 'exam_type') required String examType,
    required String status,
    required String label,
    @JsonKey(name: 'started_at') required String startedAt,
    @JsonKey(name: 'finished_at') required String finishedAt,
    @JsonKey(name: 'time_limit_minutes') required int timeLimitMinutes,
    @JsonKey(name: 'total_score') required int totalScore,
    @JsonKey(name: 'max_score') required int maxScore,
    required List<SubjectScoreModel> subjects,
  }) = _AttemptModel;

  factory AttemptModel.fromJson(Map<String, dynamic> json) =>
      _$AttemptModelFromJson(json);
}

@freezed
abstract class SubjectScoreModel with _$SubjectScoreModel {
  const factory SubjectScoreModel({
    required String name,
    required int score,
    @JsonKey(name: 'max_score') required int maxScore,
  }) = _SubjectScoreModel;

  factory SubjectScoreModel.fromJson(Map<String, dynamic> json) =>
      _$SubjectScoreModelFromJson(json);
}


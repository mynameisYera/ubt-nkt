// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'finish_request_model.freezed.dart';
part 'finish_request_model.g.dart';

@freezed
abstract class FinishRequestModel with _$FinishRequestModel {
  const factory FinishRequestModel({
    required List<FinishSubjectModel> subjects,
    required ChallengeModel challenge,
  }) = _FinishRequestModel;

  factory FinishRequestModel.fromJson(Map<String, dynamic> json) =>
      _$FinishRequestModelFromJson(json);
}

@freezed
abstract class FinishSubjectModel with _$FinishSubjectModel {
  const factory FinishSubjectModel({
    @JsonKey(name: 'subject_attempt_id') required int subjectAttemptId,
    required String name,
    required int answered,
    required int total,
  }) = _FinishSubjectModel;

  factory FinishSubjectModel.fromJson(Map<String, dynamic> json) =>
      _$FinishSubjectModelFromJson(json);
}

@freezed
abstract class ChallengeModel with _$ChallengeModel {
  const factory ChallengeModel({
    required int left,
    required int right,
  }) = _ChallengeModel;

  factory ChallengeModel.fromJson(Map<String, dynamic> json) =>
      _$ChallengeModelFromJson(json);
}

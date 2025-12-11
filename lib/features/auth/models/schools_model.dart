import 'package:freezed_annotation/freezed_annotation.dart';
part 'schools_model.freezed.dart';
part 'schools_model.g.dart';

@freezed
abstract class SchoolResponse with _$SchoolResponse {
  const factory SchoolResponse({
    required int count,
    String? next,
    String? previous,
    required List<School> results,
  }) = _SchoolResponse;

  factory SchoolResponse.fromJson(Map<String, dynamic> json) =>
      _$SchoolResponseFromJson(json);
}

@freezed
abstract class School with _$School {
  const factory School({
    required int id,
    required String name,
  }) = _School;

  factory School.fromJson(Map<String, dynamic> json) =>
      _$SchoolFromJson(json);
}
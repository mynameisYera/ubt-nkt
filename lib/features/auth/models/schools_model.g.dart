// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schools_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SchoolResponse _$SchoolResponseFromJson(Map<String, dynamic> json) =>
    _SchoolResponse(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => School.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SchoolResponseToJson(_SchoolResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

_School _$SchoolFromJson(Map<String, dynamic> json) =>
    _School(id: (json['id'] as num).toInt(), name: json['name'] as String);

Map<String, dynamic> _$SchoolToJson(_School instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
};

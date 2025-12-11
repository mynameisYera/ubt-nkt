// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExamAttempt {

 int get id;@JsonKey(name: 'exam_type') String get examType; String get status;@JsonKey(name: 'time_limit_minutes') int get timeLimitMinutes;@JsonKey(name: 'started_at') String? get startedAt;@JsonKey(name: 'expires_at') String get expiresAt;@JsonKey(name: 'remaining_seconds') int get remainingSeconds;@JsonKey(name: 'ent_pair_id') int? get entPairId;@JsonKey(name: 'nkt_subject_id') int? get nktSubjectId;@JsonKey(name: 'total_score') int? get totalScore;@JsonKey(name: 'max_score') int? get maxScore; List<SubjectAttempt> get subjects;
/// Create a copy of ExamAttempt
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExamAttemptCopyWith<ExamAttempt> get copyWith => _$ExamAttemptCopyWithImpl<ExamAttempt>(this as ExamAttempt, _$identity);

  /// Serializes this ExamAttempt to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExamAttempt&&(identical(other.id, id) || other.id == id)&&(identical(other.examType, examType) || other.examType == examType)&&(identical(other.status, status) || other.status == status)&&(identical(other.timeLimitMinutes, timeLimitMinutes) || other.timeLimitMinutes == timeLimitMinutes)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.remainingSeconds, remainingSeconds) || other.remainingSeconds == remainingSeconds)&&(identical(other.entPairId, entPairId) || other.entPairId == entPairId)&&(identical(other.nktSubjectId, nktSubjectId) || other.nktSubjectId == nktSubjectId)&&(identical(other.totalScore, totalScore) || other.totalScore == totalScore)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&const DeepCollectionEquality().equals(other.subjects, subjects));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,examType,status,timeLimitMinutes,startedAt,expiresAt,remainingSeconds,entPairId,nktSubjectId,totalScore,maxScore,const DeepCollectionEquality().hash(subjects));

@override
String toString() {
  return 'ExamAttempt(id: $id, examType: $examType, status: $status, timeLimitMinutes: $timeLimitMinutes, startedAt: $startedAt, expiresAt: $expiresAt, remainingSeconds: $remainingSeconds, entPairId: $entPairId, nktSubjectId: $nktSubjectId, totalScore: $totalScore, maxScore: $maxScore, subjects: $subjects)';
}


}

/// @nodoc
abstract mixin class $ExamAttemptCopyWith<$Res>  {
  factory $ExamAttemptCopyWith(ExamAttempt value, $Res Function(ExamAttempt) _then) = _$ExamAttemptCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'exam_type') String examType, String status,@JsonKey(name: 'time_limit_minutes') int timeLimitMinutes,@JsonKey(name: 'started_at') String? startedAt,@JsonKey(name: 'expires_at') String expiresAt,@JsonKey(name: 'remaining_seconds') int remainingSeconds,@JsonKey(name: 'ent_pair_id') int? entPairId,@JsonKey(name: 'nkt_subject_id') int? nktSubjectId,@JsonKey(name: 'total_score') int? totalScore,@JsonKey(name: 'max_score') int? maxScore, List<SubjectAttempt> subjects
});




}
/// @nodoc
class _$ExamAttemptCopyWithImpl<$Res>
    implements $ExamAttemptCopyWith<$Res> {
  _$ExamAttemptCopyWithImpl(this._self, this._then);

  final ExamAttempt _self;
  final $Res Function(ExamAttempt) _then;

/// Create a copy of ExamAttempt
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? examType = null,Object? status = null,Object? timeLimitMinutes = null,Object? startedAt = freezed,Object? expiresAt = null,Object? remainingSeconds = null,Object? entPairId = freezed,Object? nktSubjectId = freezed,Object? totalScore = freezed,Object? maxScore = freezed,Object? subjects = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,examType: null == examType ? _self.examType : examType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,timeLimitMinutes: null == timeLimitMinutes ? _self.timeLimitMinutes : timeLimitMinutes // ignore: cast_nullable_to_non_nullable
as int,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as String?,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String,remainingSeconds: null == remainingSeconds ? _self.remainingSeconds : remainingSeconds // ignore: cast_nullable_to_non_nullable
as int,entPairId: freezed == entPairId ? _self.entPairId : entPairId // ignore: cast_nullable_to_non_nullable
as int?,nktSubjectId: freezed == nktSubjectId ? _self.nktSubjectId : nktSubjectId // ignore: cast_nullable_to_non_nullable
as int?,totalScore: freezed == totalScore ? _self.totalScore : totalScore // ignore: cast_nullable_to_non_nullable
as int?,maxScore: freezed == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as int?,subjects: null == subjects ? _self.subjects : subjects // ignore: cast_nullable_to_non_nullable
as List<SubjectAttempt>,
  ));
}

}


/// Adds pattern-matching-related methods to [ExamAttempt].
extension ExamAttemptPatterns on ExamAttempt {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExamAttempt value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExamAttempt() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExamAttempt value)  $default,){
final _that = this;
switch (_that) {
case _ExamAttempt():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExamAttempt value)?  $default,){
final _that = this;
switch (_that) {
case _ExamAttempt() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'exam_type')  String examType,  String status, @JsonKey(name: 'time_limit_minutes')  int timeLimitMinutes, @JsonKey(name: 'started_at')  String? startedAt, @JsonKey(name: 'expires_at')  String expiresAt, @JsonKey(name: 'remaining_seconds')  int remainingSeconds, @JsonKey(name: 'ent_pair_id')  int? entPairId, @JsonKey(name: 'nkt_subject_id')  int? nktSubjectId, @JsonKey(name: 'total_score')  int? totalScore, @JsonKey(name: 'max_score')  int? maxScore,  List<SubjectAttempt> subjects)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExamAttempt() when $default != null:
return $default(_that.id,_that.examType,_that.status,_that.timeLimitMinutes,_that.startedAt,_that.expiresAt,_that.remainingSeconds,_that.entPairId,_that.nktSubjectId,_that.totalScore,_that.maxScore,_that.subjects);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'exam_type')  String examType,  String status, @JsonKey(name: 'time_limit_minutes')  int timeLimitMinutes, @JsonKey(name: 'started_at')  String? startedAt, @JsonKey(name: 'expires_at')  String expiresAt, @JsonKey(name: 'remaining_seconds')  int remainingSeconds, @JsonKey(name: 'ent_pair_id')  int? entPairId, @JsonKey(name: 'nkt_subject_id')  int? nktSubjectId, @JsonKey(name: 'total_score')  int? totalScore, @JsonKey(name: 'max_score')  int? maxScore,  List<SubjectAttempt> subjects)  $default,) {final _that = this;
switch (_that) {
case _ExamAttempt():
return $default(_that.id,_that.examType,_that.status,_that.timeLimitMinutes,_that.startedAt,_that.expiresAt,_that.remainingSeconds,_that.entPairId,_that.nktSubjectId,_that.totalScore,_that.maxScore,_that.subjects);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'exam_type')  String examType,  String status, @JsonKey(name: 'time_limit_minutes')  int timeLimitMinutes, @JsonKey(name: 'started_at')  String? startedAt, @JsonKey(name: 'expires_at')  String expiresAt, @JsonKey(name: 'remaining_seconds')  int remainingSeconds, @JsonKey(name: 'ent_pair_id')  int? entPairId, @JsonKey(name: 'nkt_subject_id')  int? nktSubjectId, @JsonKey(name: 'total_score')  int? totalScore, @JsonKey(name: 'max_score')  int? maxScore,  List<SubjectAttempt> subjects)?  $default,) {final _that = this;
switch (_that) {
case _ExamAttempt() when $default != null:
return $default(_that.id,_that.examType,_that.status,_that.timeLimitMinutes,_that.startedAt,_that.expiresAt,_that.remainingSeconds,_that.entPairId,_that.nktSubjectId,_that.totalScore,_that.maxScore,_that.subjects);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExamAttempt implements ExamAttempt {
  const _ExamAttempt({required this.id, @JsonKey(name: 'exam_type') required this.examType, required this.status, @JsonKey(name: 'time_limit_minutes') required this.timeLimitMinutes, @JsonKey(name: 'started_at') this.startedAt, @JsonKey(name: 'expires_at') required this.expiresAt, @JsonKey(name: 'remaining_seconds') required this.remainingSeconds, @JsonKey(name: 'ent_pair_id') this.entPairId, @JsonKey(name: 'nkt_subject_id') this.nktSubjectId, @JsonKey(name: 'total_score') this.totalScore, @JsonKey(name: 'max_score') this.maxScore, required final  List<SubjectAttempt> subjects}): _subjects = subjects;
  factory _ExamAttempt.fromJson(Map<String, dynamic> json) => _$ExamAttemptFromJson(json);

@override final  int id;
@override@JsonKey(name: 'exam_type') final  String examType;
@override final  String status;
@override@JsonKey(name: 'time_limit_minutes') final  int timeLimitMinutes;
@override@JsonKey(name: 'started_at') final  String? startedAt;
@override@JsonKey(name: 'expires_at') final  String expiresAt;
@override@JsonKey(name: 'remaining_seconds') final  int remainingSeconds;
@override@JsonKey(name: 'ent_pair_id') final  int? entPairId;
@override@JsonKey(name: 'nkt_subject_id') final  int? nktSubjectId;
@override@JsonKey(name: 'total_score') final  int? totalScore;
@override@JsonKey(name: 'max_score') final  int? maxScore;
 final  List<SubjectAttempt> _subjects;
@override List<SubjectAttempt> get subjects {
  if (_subjects is EqualUnmodifiableListView) return _subjects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subjects);
}


/// Create a copy of ExamAttempt
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExamAttemptCopyWith<_ExamAttempt> get copyWith => __$ExamAttemptCopyWithImpl<_ExamAttempt>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExamAttemptToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExamAttempt&&(identical(other.id, id) || other.id == id)&&(identical(other.examType, examType) || other.examType == examType)&&(identical(other.status, status) || other.status == status)&&(identical(other.timeLimitMinutes, timeLimitMinutes) || other.timeLimitMinutes == timeLimitMinutes)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.remainingSeconds, remainingSeconds) || other.remainingSeconds == remainingSeconds)&&(identical(other.entPairId, entPairId) || other.entPairId == entPairId)&&(identical(other.nktSubjectId, nktSubjectId) || other.nktSubjectId == nktSubjectId)&&(identical(other.totalScore, totalScore) || other.totalScore == totalScore)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&const DeepCollectionEquality().equals(other._subjects, _subjects));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,examType,status,timeLimitMinutes,startedAt,expiresAt,remainingSeconds,entPairId,nktSubjectId,totalScore,maxScore,const DeepCollectionEquality().hash(_subjects));

@override
String toString() {
  return 'ExamAttempt(id: $id, examType: $examType, status: $status, timeLimitMinutes: $timeLimitMinutes, startedAt: $startedAt, expiresAt: $expiresAt, remainingSeconds: $remainingSeconds, entPairId: $entPairId, nktSubjectId: $nktSubjectId, totalScore: $totalScore, maxScore: $maxScore, subjects: $subjects)';
}


}

/// @nodoc
abstract mixin class _$ExamAttemptCopyWith<$Res> implements $ExamAttemptCopyWith<$Res> {
  factory _$ExamAttemptCopyWith(_ExamAttempt value, $Res Function(_ExamAttempt) _then) = __$ExamAttemptCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'exam_type') String examType, String status,@JsonKey(name: 'time_limit_minutes') int timeLimitMinutes,@JsonKey(name: 'started_at') String? startedAt,@JsonKey(name: 'expires_at') String expiresAt,@JsonKey(name: 'remaining_seconds') int remainingSeconds,@JsonKey(name: 'ent_pair_id') int? entPairId,@JsonKey(name: 'nkt_subject_id') int? nktSubjectId,@JsonKey(name: 'total_score') int? totalScore,@JsonKey(name: 'max_score') int? maxScore, List<SubjectAttempt> subjects
});




}
/// @nodoc
class __$ExamAttemptCopyWithImpl<$Res>
    implements _$ExamAttemptCopyWith<$Res> {
  __$ExamAttemptCopyWithImpl(this._self, this._then);

  final _ExamAttempt _self;
  final $Res Function(_ExamAttempt) _then;

/// Create a copy of ExamAttempt
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? examType = null,Object? status = null,Object? timeLimitMinutes = null,Object? startedAt = freezed,Object? expiresAt = null,Object? remainingSeconds = null,Object? entPairId = freezed,Object? nktSubjectId = freezed,Object? totalScore = freezed,Object? maxScore = freezed,Object? subjects = null,}) {
  return _then(_ExamAttempt(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,examType: null == examType ? _self.examType : examType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,timeLimitMinutes: null == timeLimitMinutes ? _self.timeLimitMinutes : timeLimitMinutes // ignore: cast_nullable_to_non_nullable
as int,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as String?,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String,remainingSeconds: null == remainingSeconds ? _self.remainingSeconds : remainingSeconds // ignore: cast_nullable_to_non_nullable
as int,entPairId: freezed == entPairId ? _self.entPairId : entPairId // ignore: cast_nullable_to_non_nullable
as int?,nktSubjectId: freezed == nktSubjectId ? _self.nktSubjectId : nktSubjectId // ignore: cast_nullable_to_non_nullable
as int?,totalScore: freezed == totalScore ? _self.totalScore : totalScore // ignore: cast_nullable_to_non_nullable
as int?,maxScore: freezed == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as int?,subjects: null == subjects ? _self._subjects : subjects // ignore: cast_nullable_to_non_nullable
as List<SubjectAttempt>,
  ));
}


}


/// @nodoc
mixin _$SubjectAttempt {

 int get id; int get subject;@JsonKey(name: 'display_name') String get displayName; String get bucket;@JsonKey(name: 'sequence_index') int get sequenceIndex;@JsonKey(name: 'question_count') int? get questionCount;@JsonKey(name: 'max_score') int? get maxScore; int? get score; List<dynamic>? get questions;
/// Create a copy of SubjectAttempt
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubjectAttemptCopyWith<SubjectAttempt> get copyWith => _$SubjectAttemptCopyWithImpl<SubjectAttempt>(this as SubjectAttempt, _$identity);

  /// Serializes this SubjectAttempt to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubjectAttempt&&(identical(other.id, id) || other.id == id)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.bucket, bucket) || other.bucket == bucket)&&(identical(other.sequenceIndex, sequenceIndex) || other.sequenceIndex == sequenceIndex)&&(identical(other.questionCount, questionCount) || other.questionCount == questionCount)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&(identical(other.score, score) || other.score == score)&&const DeepCollectionEquality().equals(other.questions, questions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,subject,displayName,bucket,sequenceIndex,questionCount,maxScore,score,const DeepCollectionEquality().hash(questions));

@override
String toString() {
  return 'SubjectAttempt(id: $id, subject: $subject, displayName: $displayName, bucket: $bucket, sequenceIndex: $sequenceIndex, questionCount: $questionCount, maxScore: $maxScore, score: $score, questions: $questions)';
}


}

/// @nodoc
abstract mixin class $SubjectAttemptCopyWith<$Res>  {
  factory $SubjectAttemptCopyWith(SubjectAttempt value, $Res Function(SubjectAttempt) _then) = _$SubjectAttemptCopyWithImpl;
@useResult
$Res call({
 int id, int subject,@JsonKey(name: 'display_name') String displayName, String bucket,@JsonKey(name: 'sequence_index') int sequenceIndex,@JsonKey(name: 'question_count') int? questionCount,@JsonKey(name: 'max_score') int? maxScore, int? score, List<dynamic>? questions
});




}
/// @nodoc
class _$SubjectAttemptCopyWithImpl<$Res>
    implements $SubjectAttemptCopyWith<$Res> {
  _$SubjectAttemptCopyWithImpl(this._self, this._then);

  final SubjectAttempt _self;
  final $Res Function(SubjectAttempt) _then;

/// Create a copy of SubjectAttempt
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? subject = null,Object? displayName = null,Object? bucket = null,Object? sequenceIndex = null,Object? questionCount = freezed,Object? maxScore = freezed,Object? score = freezed,Object? questions = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as int,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,bucket: null == bucket ? _self.bucket : bucket // ignore: cast_nullable_to_non_nullable
as String,sequenceIndex: null == sequenceIndex ? _self.sequenceIndex : sequenceIndex // ignore: cast_nullable_to_non_nullable
as int,questionCount: freezed == questionCount ? _self.questionCount : questionCount // ignore: cast_nullable_to_non_nullable
as int?,maxScore: freezed == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as int?,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int?,questions: freezed == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [SubjectAttempt].
extension SubjectAttemptPatterns on SubjectAttempt {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubjectAttempt value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubjectAttempt() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubjectAttempt value)  $default,){
final _that = this;
switch (_that) {
case _SubjectAttempt():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubjectAttempt value)?  $default,){
final _that = this;
switch (_that) {
case _SubjectAttempt() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int subject, @JsonKey(name: 'display_name')  String displayName,  String bucket, @JsonKey(name: 'sequence_index')  int sequenceIndex, @JsonKey(name: 'question_count')  int? questionCount, @JsonKey(name: 'max_score')  int? maxScore,  int? score,  List<dynamic>? questions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubjectAttempt() when $default != null:
return $default(_that.id,_that.subject,_that.displayName,_that.bucket,_that.sequenceIndex,_that.questionCount,_that.maxScore,_that.score,_that.questions);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int subject, @JsonKey(name: 'display_name')  String displayName,  String bucket, @JsonKey(name: 'sequence_index')  int sequenceIndex, @JsonKey(name: 'question_count')  int? questionCount, @JsonKey(name: 'max_score')  int? maxScore,  int? score,  List<dynamic>? questions)  $default,) {final _that = this;
switch (_that) {
case _SubjectAttempt():
return $default(_that.id,_that.subject,_that.displayName,_that.bucket,_that.sequenceIndex,_that.questionCount,_that.maxScore,_that.score,_that.questions);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int subject, @JsonKey(name: 'display_name')  String displayName,  String bucket, @JsonKey(name: 'sequence_index')  int sequenceIndex, @JsonKey(name: 'question_count')  int? questionCount, @JsonKey(name: 'max_score')  int? maxScore,  int? score,  List<dynamic>? questions)?  $default,) {final _that = this;
switch (_that) {
case _SubjectAttempt() when $default != null:
return $default(_that.id,_that.subject,_that.displayName,_that.bucket,_that.sequenceIndex,_that.questionCount,_that.maxScore,_that.score,_that.questions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubjectAttempt implements SubjectAttempt {
  const _SubjectAttempt({required this.id, required this.subject, @JsonKey(name: 'display_name') required this.displayName, required this.bucket, @JsonKey(name: 'sequence_index') required this.sequenceIndex, @JsonKey(name: 'question_count') this.questionCount, @JsonKey(name: 'max_score') this.maxScore, this.score, final  List<dynamic>? questions}): _questions = questions;
  factory _SubjectAttempt.fromJson(Map<String, dynamic> json) => _$SubjectAttemptFromJson(json);

@override final  int id;
@override final  int subject;
@override@JsonKey(name: 'display_name') final  String displayName;
@override final  String bucket;
@override@JsonKey(name: 'sequence_index') final  int sequenceIndex;
@override@JsonKey(name: 'question_count') final  int? questionCount;
@override@JsonKey(name: 'max_score') final  int? maxScore;
@override final  int? score;
 final  List<dynamic>? _questions;
@override List<dynamic>? get questions {
  final value = _questions;
  if (value == null) return null;
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of SubjectAttempt
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubjectAttemptCopyWith<_SubjectAttempt> get copyWith => __$SubjectAttemptCopyWithImpl<_SubjectAttempt>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubjectAttemptToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubjectAttempt&&(identical(other.id, id) || other.id == id)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.bucket, bucket) || other.bucket == bucket)&&(identical(other.sequenceIndex, sequenceIndex) || other.sequenceIndex == sequenceIndex)&&(identical(other.questionCount, questionCount) || other.questionCount == questionCount)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&(identical(other.score, score) || other.score == score)&&const DeepCollectionEquality().equals(other._questions, _questions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,subject,displayName,bucket,sequenceIndex,questionCount,maxScore,score,const DeepCollectionEquality().hash(_questions));

@override
String toString() {
  return 'SubjectAttempt(id: $id, subject: $subject, displayName: $displayName, bucket: $bucket, sequenceIndex: $sequenceIndex, questionCount: $questionCount, maxScore: $maxScore, score: $score, questions: $questions)';
}


}

/// @nodoc
abstract mixin class _$SubjectAttemptCopyWith<$Res> implements $SubjectAttemptCopyWith<$Res> {
  factory _$SubjectAttemptCopyWith(_SubjectAttempt value, $Res Function(_SubjectAttempt) _then) = __$SubjectAttemptCopyWithImpl;
@override @useResult
$Res call({
 int id, int subject,@JsonKey(name: 'display_name') String displayName, String bucket,@JsonKey(name: 'sequence_index') int sequenceIndex,@JsonKey(name: 'question_count') int? questionCount,@JsonKey(name: 'max_score') int? maxScore, int? score, List<dynamic>? questions
});




}
/// @nodoc
class __$SubjectAttemptCopyWithImpl<$Res>
    implements _$SubjectAttemptCopyWith<$Res> {
  __$SubjectAttemptCopyWithImpl(this._self, this._then);

  final _SubjectAttempt _self;
  final $Res Function(_SubjectAttempt) _then;

/// Create a copy of SubjectAttempt
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? subject = null,Object? displayName = null,Object? bucket = null,Object? sequenceIndex = null,Object? questionCount = freezed,Object? maxScore = freezed,Object? score = freezed,Object? questions = freezed,}) {
  return _then(_SubjectAttempt(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as int,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,bucket: null == bucket ? _self.bucket : bucket // ignore: cast_nullable_to_non_nullable
as String,sequenceIndex: null == sequenceIndex ? _self.sequenceIndex : sequenceIndex // ignore: cast_nullable_to_non_nullable
as int,questionCount: freezed == questionCount ? _self.questionCount : questionCount // ignore: cast_nullable_to_non_nullable
as int?,maxScore: freezed == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as int?,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int?,questions: freezed == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HistoryResponse {

 List<HistoryAttempt> get attempts;
/// Create a copy of HistoryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryResponseCopyWith<HistoryResponse> get copyWith => _$HistoryResponseCopyWithImpl<HistoryResponse>(this as HistoryResponse, _$identity);

  /// Serializes this HistoryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryResponse&&const DeepCollectionEquality().equals(other.attempts, attempts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(attempts));

@override
String toString() {
  return 'HistoryResponse(attempts: $attempts)';
}


}

/// @nodoc
abstract mixin class $HistoryResponseCopyWith<$Res>  {
  factory $HistoryResponseCopyWith(HistoryResponse value, $Res Function(HistoryResponse) _then) = _$HistoryResponseCopyWithImpl;
@useResult
$Res call({
 List<HistoryAttempt> attempts
});




}
/// @nodoc
class _$HistoryResponseCopyWithImpl<$Res>
    implements $HistoryResponseCopyWith<$Res> {
  _$HistoryResponseCopyWithImpl(this._self, this._then);

  final HistoryResponse _self;
  final $Res Function(HistoryResponse) _then;

/// Create a copy of HistoryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? attempts = null,}) {
  return _then(_self.copyWith(
attempts: null == attempts ? _self.attempts : attempts // ignore: cast_nullable_to_non_nullable
as List<HistoryAttempt>,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryResponse].
extension HistoryResponsePatterns on HistoryResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryResponse value)  $default,){
final _that = this;
switch (_that) {
case _HistoryResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryResponse value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<HistoryAttempt> attempts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryResponse() when $default != null:
return $default(_that.attempts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<HistoryAttempt> attempts)  $default,) {final _that = this;
switch (_that) {
case _HistoryResponse():
return $default(_that.attempts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<HistoryAttempt> attempts)?  $default,) {final _that = this;
switch (_that) {
case _HistoryResponse() when $default != null:
return $default(_that.attempts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HistoryResponse implements HistoryResponse {
  const _HistoryResponse({required final  List<HistoryAttempt> attempts}): _attempts = attempts;
  factory _HistoryResponse.fromJson(Map<String, dynamic> json) => _$HistoryResponseFromJson(json);

 final  List<HistoryAttempt> _attempts;
@override List<HistoryAttempt> get attempts {
  if (_attempts is EqualUnmodifiableListView) return _attempts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attempts);
}


/// Create a copy of HistoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryResponseCopyWith<_HistoryResponse> get copyWith => __$HistoryResponseCopyWithImpl<_HistoryResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryResponse&&const DeepCollectionEquality().equals(other._attempts, _attempts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_attempts));

@override
String toString() {
  return 'HistoryResponse(attempts: $attempts)';
}


}

/// @nodoc
abstract mixin class _$HistoryResponseCopyWith<$Res> implements $HistoryResponseCopyWith<$Res> {
  factory _$HistoryResponseCopyWith(_HistoryResponse value, $Res Function(_HistoryResponse) _then) = __$HistoryResponseCopyWithImpl;
@override @useResult
$Res call({
 List<HistoryAttempt> attempts
});




}
/// @nodoc
class __$HistoryResponseCopyWithImpl<$Res>
    implements _$HistoryResponseCopyWith<$Res> {
  __$HistoryResponseCopyWithImpl(this._self, this._then);

  final _HistoryResponse _self;
  final $Res Function(_HistoryResponse) _then;

/// Create a copy of HistoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? attempts = null,}) {
  return _then(_HistoryResponse(
attempts: null == attempts ? _self._attempts : attempts // ignore: cast_nullable_to_non_nullable
as List<HistoryAttempt>,
  ));
}


}


/// @nodoc
mixin _$HistoryAttempt {

 int get id;@JsonKey(name: 'exam_type') String get examType; String get status; String get label;@JsonKey(name: 'started_at') String get startedAt;@JsonKey(name: 'finished_at') String? get finishedAt;@JsonKey(name: 'time_limit_minutes') int get timeLimitMinutes;@JsonKey(name: 'total_score') int get totalScore;@JsonKey(name: 'max_score') int get maxScore; List<HistorySubject> get subjects;
/// Create a copy of HistoryAttempt
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryAttemptCopyWith<HistoryAttempt> get copyWith => _$HistoryAttemptCopyWithImpl<HistoryAttempt>(this as HistoryAttempt, _$identity);

  /// Serializes this HistoryAttempt to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryAttempt&&(identical(other.id, id) || other.id == id)&&(identical(other.examType, examType) || other.examType == examType)&&(identical(other.status, status) || other.status == status)&&(identical(other.label, label) || other.label == label)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.finishedAt, finishedAt) || other.finishedAt == finishedAt)&&(identical(other.timeLimitMinutes, timeLimitMinutes) || other.timeLimitMinutes == timeLimitMinutes)&&(identical(other.totalScore, totalScore) || other.totalScore == totalScore)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&const DeepCollectionEquality().equals(other.subjects, subjects));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,examType,status,label,startedAt,finishedAt,timeLimitMinutes,totalScore,maxScore,const DeepCollectionEquality().hash(subjects));

@override
String toString() {
  return 'HistoryAttempt(id: $id, examType: $examType, status: $status, label: $label, startedAt: $startedAt, finishedAt: $finishedAt, timeLimitMinutes: $timeLimitMinutes, totalScore: $totalScore, maxScore: $maxScore, subjects: $subjects)';
}


}

/// @nodoc
abstract mixin class $HistoryAttemptCopyWith<$Res>  {
  factory $HistoryAttemptCopyWith(HistoryAttempt value, $Res Function(HistoryAttempt) _then) = _$HistoryAttemptCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'exam_type') String examType, String status, String label,@JsonKey(name: 'started_at') String startedAt,@JsonKey(name: 'finished_at') String? finishedAt,@JsonKey(name: 'time_limit_minutes') int timeLimitMinutes,@JsonKey(name: 'total_score') int totalScore,@JsonKey(name: 'max_score') int maxScore, List<HistorySubject> subjects
});




}
/// @nodoc
class _$HistoryAttemptCopyWithImpl<$Res>
    implements $HistoryAttemptCopyWith<$Res> {
  _$HistoryAttemptCopyWithImpl(this._self, this._then);

  final HistoryAttempt _self;
  final $Res Function(HistoryAttempt) _then;

/// Create a copy of HistoryAttempt
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? examType = null,Object? status = null,Object? label = null,Object? startedAt = null,Object? finishedAt = freezed,Object? timeLimitMinutes = null,Object? totalScore = null,Object? maxScore = null,Object? subjects = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,examType: null == examType ? _self.examType : examType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as String,finishedAt: freezed == finishedAt ? _self.finishedAt : finishedAt // ignore: cast_nullable_to_non_nullable
as String?,timeLimitMinutes: null == timeLimitMinutes ? _self.timeLimitMinutes : timeLimitMinutes // ignore: cast_nullable_to_non_nullable
as int,totalScore: null == totalScore ? _self.totalScore : totalScore // ignore: cast_nullable_to_non_nullable
as int,maxScore: null == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as int,subjects: null == subjects ? _self.subjects : subjects // ignore: cast_nullable_to_non_nullable
as List<HistorySubject>,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryAttempt].
extension HistoryAttemptPatterns on HistoryAttempt {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryAttempt value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryAttempt() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryAttempt value)  $default,){
final _that = this;
switch (_that) {
case _HistoryAttempt():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryAttempt value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryAttempt() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'exam_type')  String examType,  String status,  String label, @JsonKey(name: 'started_at')  String startedAt, @JsonKey(name: 'finished_at')  String? finishedAt, @JsonKey(name: 'time_limit_minutes')  int timeLimitMinutes, @JsonKey(name: 'total_score')  int totalScore, @JsonKey(name: 'max_score')  int maxScore,  List<HistorySubject> subjects)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryAttempt() when $default != null:
return $default(_that.id,_that.examType,_that.status,_that.label,_that.startedAt,_that.finishedAt,_that.timeLimitMinutes,_that.totalScore,_that.maxScore,_that.subjects);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'exam_type')  String examType,  String status,  String label, @JsonKey(name: 'started_at')  String startedAt, @JsonKey(name: 'finished_at')  String? finishedAt, @JsonKey(name: 'time_limit_minutes')  int timeLimitMinutes, @JsonKey(name: 'total_score')  int totalScore, @JsonKey(name: 'max_score')  int maxScore,  List<HistorySubject> subjects)  $default,) {final _that = this;
switch (_that) {
case _HistoryAttempt():
return $default(_that.id,_that.examType,_that.status,_that.label,_that.startedAt,_that.finishedAt,_that.timeLimitMinutes,_that.totalScore,_that.maxScore,_that.subjects);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'exam_type')  String examType,  String status,  String label, @JsonKey(name: 'started_at')  String startedAt, @JsonKey(name: 'finished_at')  String? finishedAt, @JsonKey(name: 'time_limit_minutes')  int timeLimitMinutes, @JsonKey(name: 'total_score')  int totalScore, @JsonKey(name: 'max_score')  int maxScore,  List<HistorySubject> subjects)?  $default,) {final _that = this;
switch (_that) {
case _HistoryAttempt() when $default != null:
return $default(_that.id,_that.examType,_that.status,_that.label,_that.startedAt,_that.finishedAt,_that.timeLimitMinutes,_that.totalScore,_that.maxScore,_that.subjects);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HistoryAttempt implements HistoryAttempt {
  const _HistoryAttempt({required this.id, @JsonKey(name: 'exam_type') required this.examType, required this.status, required this.label, @JsonKey(name: 'started_at') required this.startedAt, @JsonKey(name: 'finished_at') this.finishedAt, @JsonKey(name: 'time_limit_minutes') required this.timeLimitMinutes, @JsonKey(name: 'total_score') required this.totalScore, @JsonKey(name: 'max_score') required this.maxScore, required final  List<HistorySubject> subjects}): _subjects = subjects;
  factory _HistoryAttempt.fromJson(Map<String, dynamic> json) => _$HistoryAttemptFromJson(json);

@override final  int id;
@override@JsonKey(name: 'exam_type') final  String examType;
@override final  String status;
@override final  String label;
@override@JsonKey(name: 'started_at') final  String startedAt;
@override@JsonKey(name: 'finished_at') final  String? finishedAt;
@override@JsonKey(name: 'time_limit_minutes') final  int timeLimitMinutes;
@override@JsonKey(name: 'total_score') final  int totalScore;
@override@JsonKey(name: 'max_score') final  int maxScore;
 final  List<HistorySubject> _subjects;
@override List<HistorySubject> get subjects {
  if (_subjects is EqualUnmodifiableListView) return _subjects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subjects);
}


/// Create a copy of HistoryAttempt
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryAttemptCopyWith<_HistoryAttempt> get copyWith => __$HistoryAttemptCopyWithImpl<_HistoryAttempt>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryAttemptToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryAttempt&&(identical(other.id, id) || other.id == id)&&(identical(other.examType, examType) || other.examType == examType)&&(identical(other.status, status) || other.status == status)&&(identical(other.label, label) || other.label == label)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.finishedAt, finishedAt) || other.finishedAt == finishedAt)&&(identical(other.timeLimitMinutes, timeLimitMinutes) || other.timeLimitMinutes == timeLimitMinutes)&&(identical(other.totalScore, totalScore) || other.totalScore == totalScore)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&const DeepCollectionEquality().equals(other._subjects, _subjects));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,examType,status,label,startedAt,finishedAt,timeLimitMinutes,totalScore,maxScore,const DeepCollectionEquality().hash(_subjects));

@override
String toString() {
  return 'HistoryAttempt(id: $id, examType: $examType, status: $status, label: $label, startedAt: $startedAt, finishedAt: $finishedAt, timeLimitMinutes: $timeLimitMinutes, totalScore: $totalScore, maxScore: $maxScore, subjects: $subjects)';
}


}

/// @nodoc
abstract mixin class _$HistoryAttemptCopyWith<$Res> implements $HistoryAttemptCopyWith<$Res> {
  factory _$HistoryAttemptCopyWith(_HistoryAttempt value, $Res Function(_HistoryAttempt) _then) = __$HistoryAttemptCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'exam_type') String examType, String status, String label,@JsonKey(name: 'started_at') String startedAt,@JsonKey(name: 'finished_at') String? finishedAt,@JsonKey(name: 'time_limit_minutes') int timeLimitMinutes,@JsonKey(name: 'total_score') int totalScore,@JsonKey(name: 'max_score') int maxScore, List<HistorySubject> subjects
});




}
/// @nodoc
class __$HistoryAttemptCopyWithImpl<$Res>
    implements _$HistoryAttemptCopyWith<$Res> {
  __$HistoryAttemptCopyWithImpl(this._self, this._then);

  final _HistoryAttempt _self;
  final $Res Function(_HistoryAttempt) _then;

/// Create a copy of HistoryAttempt
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? examType = null,Object? status = null,Object? label = null,Object? startedAt = null,Object? finishedAt = freezed,Object? timeLimitMinutes = null,Object? totalScore = null,Object? maxScore = null,Object? subjects = null,}) {
  return _then(_HistoryAttempt(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,examType: null == examType ? _self.examType : examType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as String,finishedAt: freezed == finishedAt ? _self.finishedAt : finishedAt // ignore: cast_nullable_to_non_nullable
as String?,timeLimitMinutes: null == timeLimitMinutes ? _self.timeLimitMinutes : timeLimitMinutes // ignore: cast_nullable_to_non_nullable
as int,totalScore: null == totalScore ? _self.totalScore : totalScore // ignore: cast_nullable_to_non_nullable
as int,maxScore: null == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as int,subjects: null == subjects ? _self._subjects : subjects // ignore: cast_nullable_to_non_nullable
as List<HistorySubject>,
  ));
}


}


/// @nodoc
mixin _$HistorySubject {

 String get name; int get score;@JsonKey(name: 'max_score') int get maxScore;
/// Create a copy of HistorySubject
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistorySubjectCopyWith<HistorySubject> get copyWith => _$HistorySubjectCopyWithImpl<HistorySubject>(this as HistorySubject, _$identity);

  /// Serializes this HistorySubject to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistorySubject&&(identical(other.name, name) || other.name == name)&&(identical(other.score, score) || other.score == score)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,score,maxScore);

@override
String toString() {
  return 'HistorySubject(name: $name, score: $score, maxScore: $maxScore)';
}


}

/// @nodoc
abstract mixin class $HistorySubjectCopyWith<$Res>  {
  factory $HistorySubjectCopyWith(HistorySubject value, $Res Function(HistorySubject) _then) = _$HistorySubjectCopyWithImpl;
@useResult
$Res call({
 String name, int score,@JsonKey(name: 'max_score') int maxScore
});




}
/// @nodoc
class _$HistorySubjectCopyWithImpl<$Res>
    implements $HistorySubjectCopyWith<$Res> {
  _$HistorySubjectCopyWithImpl(this._self, this._then);

  final HistorySubject _self;
  final $Res Function(HistorySubject) _then;

/// Create a copy of HistorySubject
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? score = null,Object? maxScore = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,maxScore: null == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [HistorySubject].
extension HistorySubjectPatterns on HistorySubject {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistorySubject value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistorySubject() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistorySubject value)  $default,){
final _that = this;
switch (_that) {
case _HistorySubject():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistorySubject value)?  $default,){
final _that = this;
switch (_that) {
case _HistorySubject() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int score, @JsonKey(name: 'max_score')  int maxScore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistorySubject() when $default != null:
return $default(_that.name,_that.score,_that.maxScore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int score, @JsonKey(name: 'max_score')  int maxScore)  $default,) {final _that = this;
switch (_that) {
case _HistorySubject():
return $default(_that.name,_that.score,_that.maxScore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int score, @JsonKey(name: 'max_score')  int maxScore)?  $default,) {final _that = this;
switch (_that) {
case _HistorySubject() when $default != null:
return $default(_that.name,_that.score,_that.maxScore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HistorySubject implements HistorySubject {
  const _HistorySubject({required this.name, required this.score, @JsonKey(name: 'max_score') required this.maxScore});
  factory _HistorySubject.fromJson(Map<String, dynamic> json) => _$HistorySubjectFromJson(json);

@override final  String name;
@override final  int score;
@override@JsonKey(name: 'max_score') final  int maxScore;

/// Create a copy of HistorySubject
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistorySubjectCopyWith<_HistorySubject> get copyWith => __$HistorySubjectCopyWithImpl<_HistorySubject>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistorySubjectToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistorySubject&&(identical(other.name, name) || other.name == name)&&(identical(other.score, score) || other.score == score)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,score,maxScore);

@override
String toString() {
  return 'HistorySubject(name: $name, score: $score, maxScore: $maxScore)';
}


}

/// @nodoc
abstract mixin class _$HistorySubjectCopyWith<$Res> implements $HistorySubjectCopyWith<$Res> {
  factory _$HistorySubjectCopyWith(_HistorySubject value, $Res Function(_HistorySubject) _then) = __$HistorySubjectCopyWithImpl;
@override @useResult
$Res call({
 String name, int score,@JsonKey(name: 'max_score') int maxScore
});




}
/// @nodoc
class __$HistorySubjectCopyWithImpl<$Res>
    implements _$HistorySubjectCopyWith<$Res> {
  __$HistorySubjectCopyWithImpl(this._self, this._then);

  final _HistorySubject _self;
  final $Res Function(_HistorySubject) _then;

/// Create a copy of HistorySubject
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? score = null,Object? maxScore = null,}) {
  return _then(_HistorySubject(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,maxScore: null == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

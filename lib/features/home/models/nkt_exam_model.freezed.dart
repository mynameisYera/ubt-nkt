// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nkt_exam_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NktExamModel {

@JsonKey(name: 'exam_type') String get examType; List<NktSubject> get subjects;@JsonKey(name: 'ordering_rules') List<String> get orderingRules; List<String> get tools;@JsonKey(name: 'time_limit_minutes') NktTimeLimit get timeLimitMinutes; int get quota; InProgressAttempt? get in_progress_attempt;
/// Create a copy of NktExamModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NktExamModelCopyWith<NktExamModel> get copyWith => _$NktExamModelCopyWithImpl<NktExamModel>(this as NktExamModel, _$identity);

  /// Serializes this NktExamModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NktExamModel&&(identical(other.examType, examType) || other.examType == examType)&&const DeepCollectionEquality().equals(other.subjects, subjects)&&const DeepCollectionEquality().equals(other.orderingRules, orderingRules)&&const DeepCollectionEquality().equals(other.tools, tools)&&(identical(other.timeLimitMinutes, timeLimitMinutes) || other.timeLimitMinutes == timeLimitMinutes)&&(identical(other.quota, quota) || other.quota == quota)&&(identical(other.in_progress_attempt, in_progress_attempt) || other.in_progress_attempt == in_progress_attempt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,examType,const DeepCollectionEquality().hash(subjects),const DeepCollectionEquality().hash(orderingRules),const DeepCollectionEquality().hash(tools),timeLimitMinutes,quota,in_progress_attempt);

@override
String toString() {
  return 'NktExamModel(examType: $examType, subjects: $subjects, orderingRules: $orderingRules, tools: $tools, timeLimitMinutes: $timeLimitMinutes, quota: $quota, in_progress_attempt: $in_progress_attempt)';
}


}

/// @nodoc
abstract mixin class $NktExamModelCopyWith<$Res>  {
  factory $NktExamModelCopyWith(NktExamModel value, $Res Function(NktExamModel) _then) = _$NktExamModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'exam_type') String examType, List<NktSubject> subjects,@JsonKey(name: 'ordering_rules') List<String> orderingRules, List<String> tools,@JsonKey(name: 'time_limit_minutes') NktTimeLimit timeLimitMinutes, int quota, InProgressAttempt? in_progress_attempt
});


$NktTimeLimitCopyWith<$Res> get timeLimitMinutes;$InProgressAttemptCopyWith<$Res>? get in_progress_attempt;

}
/// @nodoc
class _$NktExamModelCopyWithImpl<$Res>
    implements $NktExamModelCopyWith<$Res> {
  _$NktExamModelCopyWithImpl(this._self, this._then);

  final NktExamModel _self;
  final $Res Function(NktExamModel) _then;

/// Create a copy of NktExamModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? examType = null,Object? subjects = null,Object? orderingRules = null,Object? tools = null,Object? timeLimitMinutes = null,Object? quota = null,Object? in_progress_attempt = freezed,}) {
  return _then(_self.copyWith(
examType: null == examType ? _self.examType : examType // ignore: cast_nullable_to_non_nullable
as String,subjects: null == subjects ? _self.subjects : subjects // ignore: cast_nullable_to_non_nullable
as List<NktSubject>,orderingRules: null == orderingRules ? _self.orderingRules : orderingRules // ignore: cast_nullable_to_non_nullable
as List<String>,tools: null == tools ? _self.tools : tools // ignore: cast_nullable_to_non_nullable
as List<String>,timeLimitMinutes: null == timeLimitMinutes ? _self.timeLimitMinutes : timeLimitMinutes // ignore: cast_nullable_to_non_nullable
as NktTimeLimit,quota: null == quota ? _self.quota : quota // ignore: cast_nullable_to_non_nullable
as int,in_progress_attempt: freezed == in_progress_attempt ? _self.in_progress_attempt : in_progress_attempt // ignore: cast_nullable_to_non_nullable
as InProgressAttempt?,
  ));
}
/// Create a copy of NktExamModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NktTimeLimitCopyWith<$Res> get timeLimitMinutes {
  
  return $NktTimeLimitCopyWith<$Res>(_self.timeLimitMinutes, (value) {
    return _then(_self.copyWith(timeLimitMinutes: value));
  });
}/// Create a copy of NktExamModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InProgressAttemptCopyWith<$Res>? get in_progress_attempt {
    if (_self.in_progress_attempt == null) {
    return null;
  }

  return $InProgressAttemptCopyWith<$Res>(_self.in_progress_attempt!, (value) {
    return _then(_self.copyWith(in_progress_attempt: value));
  });
}
}


/// Adds pattern-matching-related methods to [NktExamModel].
extension NktExamModelPatterns on NktExamModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NktExamModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NktExamModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NktExamModel value)  $default,){
final _that = this;
switch (_that) {
case _NktExamModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NktExamModel value)?  $default,){
final _that = this;
switch (_that) {
case _NktExamModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'exam_type')  String examType,  List<NktSubject> subjects, @JsonKey(name: 'ordering_rules')  List<String> orderingRules,  List<String> tools, @JsonKey(name: 'time_limit_minutes')  NktTimeLimit timeLimitMinutes,  int quota,  InProgressAttempt? in_progress_attempt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NktExamModel() when $default != null:
return $default(_that.examType,_that.subjects,_that.orderingRules,_that.tools,_that.timeLimitMinutes,_that.quota,_that.in_progress_attempt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'exam_type')  String examType,  List<NktSubject> subjects, @JsonKey(name: 'ordering_rules')  List<String> orderingRules,  List<String> tools, @JsonKey(name: 'time_limit_minutes')  NktTimeLimit timeLimitMinutes,  int quota,  InProgressAttempt? in_progress_attempt)  $default,) {final _that = this;
switch (_that) {
case _NktExamModel():
return $default(_that.examType,_that.subjects,_that.orderingRules,_that.tools,_that.timeLimitMinutes,_that.quota,_that.in_progress_attempt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'exam_type')  String examType,  List<NktSubject> subjects, @JsonKey(name: 'ordering_rules')  List<String> orderingRules,  List<String> tools, @JsonKey(name: 'time_limit_minutes')  NktTimeLimit timeLimitMinutes,  int quota,  InProgressAttempt? in_progress_attempt)?  $default,) {final _that = this;
switch (_that) {
case _NktExamModel() when $default != null:
return $default(_that.examType,_that.subjects,_that.orderingRules,_that.tools,_that.timeLimitMinutes,_that.quota,_that.in_progress_attempt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NktExamModel implements NktExamModel {
  const _NktExamModel({@JsonKey(name: 'exam_type') required this.examType, required final  List<NktSubject> subjects, @JsonKey(name: 'ordering_rules') required final  List<String> orderingRules, required final  List<String> tools, @JsonKey(name: 'time_limit_minutes') required this.timeLimitMinutes, required this.quota, this.in_progress_attempt}): _subjects = subjects,_orderingRules = orderingRules,_tools = tools;
  factory _NktExamModel.fromJson(Map<String, dynamic> json) => _$NktExamModelFromJson(json);

@override@JsonKey(name: 'exam_type') final  String examType;
 final  List<NktSubject> _subjects;
@override List<NktSubject> get subjects {
  if (_subjects is EqualUnmodifiableListView) return _subjects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subjects);
}

 final  List<String> _orderingRules;
@override@JsonKey(name: 'ordering_rules') List<String> get orderingRules {
  if (_orderingRules is EqualUnmodifiableListView) return _orderingRules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_orderingRules);
}

 final  List<String> _tools;
@override List<String> get tools {
  if (_tools is EqualUnmodifiableListView) return _tools;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tools);
}

@override@JsonKey(name: 'time_limit_minutes') final  NktTimeLimit timeLimitMinutes;
@override final  int quota;
@override final  InProgressAttempt? in_progress_attempt;

/// Create a copy of NktExamModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NktExamModelCopyWith<_NktExamModel> get copyWith => __$NktExamModelCopyWithImpl<_NktExamModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NktExamModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NktExamModel&&(identical(other.examType, examType) || other.examType == examType)&&const DeepCollectionEquality().equals(other._subjects, _subjects)&&const DeepCollectionEquality().equals(other._orderingRules, _orderingRules)&&const DeepCollectionEquality().equals(other._tools, _tools)&&(identical(other.timeLimitMinutes, timeLimitMinutes) || other.timeLimitMinutes == timeLimitMinutes)&&(identical(other.quota, quota) || other.quota == quota)&&(identical(other.in_progress_attempt, in_progress_attempt) || other.in_progress_attempt == in_progress_attempt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,examType,const DeepCollectionEquality().hash(_subjects),const DeepCollectionEquality().hash(_orderingRules),const DeepCollectionEquality().hash(_tools),timeLimitMinutes,quota,in_progress_attempt);

@override
String toString() {
  return 'NktExamModel(examType: $examType, subjects: $subjects, orderingRules: $orderingRules, tools: $tools, timeLimitMinutes: $timeLimitMinutes, quota: $quota, in_progress_attempt: $in_progress_attempt)';
}


}

/// @nodoc
abstract mixin class _$NktExamModelCopyWith<$Res> implements $NktExamModelCopyWith<$Res> {
  factory _$NktExamModelCopyWith(_NktExamModel value, $Res Function(_NktExamModel) _then) = __$NktExamModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'exam_type') String examType, List<NktSubject> subjects,@JsonKey(name: 'ordering_rules') List<String> orderingRules, List<String> tools,@JsonKey(name: 'time_limit_minutes') NktTimeLimit timeLimitMinutes, int quota, InProgressAttempt? in_progress_attempt
});


@override $NktTimeLimitCopyWith<$Res> get timeLimitMinutes;@override $InProgressAttemptCopyWith<$Res>? get in_progress_attempt;

}
/// @nodoc
class __$NktExamModelCopyWithImpl<$Res>
    implements _$NktExamModelCopyWith<$Res> {
  __$NktExamModelCopyWithImpl(this._self, this._then);

  final _NktExamModel _self;
  final $Res Function(_NktExamModel) _then;

/// Create a copy of NktExamModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? examType = null,Object? subjects = null,Object? orderingRules = null,Object? tools = null,Object? timeLimitMinutes = null,Object? quota = null,Object? in_progress_attempt = freezed,}) {
  return _then(_NktExamModel(
examType: null == examType ? _self.examType : examType // ignore: cast_nullable_to_non_nullable
as String,subjects: null == subjects ? _self._subjects : subjects // ignore: cast_nullable_to_non_nullable
as List<NktSubject>,orderingRules: null == orderingRules ? _self._orderingRules : orderingRules // ignore: cast_nullable_to_non_nullable
as List<String>,tools: null == tools ? _self._tools : tools // ignore: cast_nullable_to_non_nullable
as List<String>,timeLimitMinutes: null == timeLimitMinutes ? _self.timeLimitMinutes : timeLimitMinutes // ignore: cast_nullable_to_non_nullable
as NktTimeLimit,quota: null == quota ? _self.quota : quota // ignore: cast_nullable_to_non_nullable
as int,in_progress_attempt: freezed == in_progress_attempt ? _self.in_progress_attempt : in_progress_attempt // ignore: cast_nullable_to_non_nullable
as InProgressAttempt?,
  ));
}

/// Create a copy of NktExamModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NktTimeLimitCopyWith<$Res> get timeLimitMinutes {
  
  return $NktTimeLimitCopyWith<$Res>(_self.timeLimitMinutes, (value) {
    return _then(_self.copyWith(timeLimitMinutes: value));
  });
}/// Create a copy of NktExamModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InProgressAttemptCopyWith<$Res>? get in_progress_attempt {
    if (_self.in_progress_attempt == null) {
    return null;
  }

  return $InProgressAttemptCopyWith<$Res>(_self.in_progress_attempt!, (value) {
    return _then(_self.copyWith(in_progress_attempt: value));
  });
}
}


/// @nodoc
mixin _$NktSubject {

 int get id; String get code; String get name; String get bucket;@JsonKey(name: 'question_quota') int get questionQuota;@JsonKey(name: 'is_active') bool get isActive;
/// Create a copy of NktSubject
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NktSubjectCopyWith<NktSubject> get copyWith => _$NktSubjectCopyWithImpl<NktSubject>(this as NktSubject, _$identity);

  /// Serializes this NktSubject to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NktSubject&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.bucket, bucket) || other.bucket == bucket)&&(identical(other.questionQuota, questionQuota) || other.questionQuota == questionQuota)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,name,bucket,questionQuota,isActive);

@override
String toString() {
  return 'NktSubject(id: $id, code: $code, name: $name, bucket: $bucket, questionQuota: $questionQuota, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $NktSubjectCopyWith<$Res>  {
  factory $NktSubjectCopyWith(NktSubject value, $Res Function(NktSubject) _then) = _$NktSubjectCopyWithImpl;
@useResult
$Res call({
 int id, String code, String name, String bucket,@JsonKey(name: 'question_quota') int questionQuota,@JsonKey(name: 'is_active') bool isActive
});




}
/// @nodoc
class _$NktSubjectCopyWithImpl<$Res>
    implements $NktSubjectCopyWith<$Res> {
  _$NktSubjectCopyWithImpl(this._self, this._then);

  final NktSubject _self;
  final $Res Function(NktSubject) _then;

/// Create a copy of NktSubject
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? name = null,Object? bucket = null,Object? questionQuota = null,Object? isActive = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,bucket: null == bucket ? _self.bucket : bucket // ignore: cast_nullable_to_non_nullable
as String,questionQuota: null == questionQuota ? _self.questionQuota : questionQuota // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [NktSubject].
extension NktSubjectPatterns on NktSubject {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NktSubject value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NktSubject() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NktSubject value)  $default,){
final _that = this;
switch (_that) {
case _NktSubject():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NktSubject value)?  $default,){
final _that = this;
switch (_that) {
case _NktSubject() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String code,  String name,  String bucket, @JsonKey(name: 'question_quota')  int questionQuota, @JsonKey(name: 'is_active')  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NktSubject() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.bucket,_that.questionQuota,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String code,  String name,  String bucket, @JsonKey(name: 'question_quota')  int questionQuota, @JsonKey(name: 'is_active')  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _NktSubject():
return $default(_that.id,_that.code,_that.name,_that.bucket,_that.questionQuota,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String code,  String name,  String bucket, @JsonKey(name: 'question_quota')  int questionQuota, @JsonKey(name: 'is_active')  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _NktSubject() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.bucket,_that.questionQuota,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NktSubject implements NktSubject {
  const _NktSubject({required this.id, required this.code, required this.name, required this.bucket, @JsonKey(name: 'question_quota') required this.questionQuota, @JsonKey(name: 'is_active') required this.isActive});
  factory _NktSubject.fromJson(Map<String, dynamic> json) => _$NktSubjectFromJson(json);

@override final  int id;
@override final  String code;
@override final  String name;
@override final  String bucket;
@override@JsonKey(name: 'question_quota') final  int questionQuota;
@override@JsonKey(name: 'is_active') final  bool isActive;

/// Create a copy of NktSubject
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NktSubjectCopyWith<_NktSubject> get copyWith => __$NktSubjectCopyWithImpl<_NktSubject>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NktSubjectToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NktSubject&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.bucket, bucket) || other.bucket == bucket)&&(identical(other.questionQuota, questionQuota) || other.questionQuota == questionQuota)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,name,bucket,questionQuota,isActive);

@override
String toString() {
  return 'NktSubject(id: $id, code: $code, name: $name, bucket: $bucket, questionQuota: $questionQuota, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$NktSubjectCopyWith<$Res> implements $NktSubjectCopyWith<$Res> {
  factory _$NktSubjectCopyWith(_NktSubject value, $Res Function(_NktSubject) _then) = __$NktSubjectCopyWithImpl;
@override @useResult
$Res call({
 int id, String code, String name, String bucket,@JsonKey(name: 'question_quota') int questionQuota,@JsonKey(name: 'is_active') bool isActive
});




}
/// @nodoc
class __$NktSubjectCopyWithImpl<$Res>
    implements _$NktSubjectCopyWith<$Res> {
  __$NktSubjectCopyWithImpl(this._self, this._then);

  final _NktSubject _self;
  final $Res Function(_NktSubject) _then;

/// Create a copy of NktSubject
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? name = null,Object? bucket = null,Object? questionQuota = null,Object? isActive = null,}) {
  return _then(_NktSubject(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,bucket: null == bucket ? _self.bucket : bucket // ignore: cast_nullable_to_non_nullable
as String,questionQuota: null == questionQuota ? _self.questionQuota : questionQuota // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$NktTimeLimit {

@JsonKey(name: 'default') int get default_; int get extended;@JsonKey(name: 'extended_subject_codes') List<String> get extendedSubjectCodes;
/// Create a copy of NktTimeLimit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NktTimeLimitCopyWith<NktTimeLimit> get copyWith => _$NktTimeLimitCopyWithImpl<NktTimeLimit>(this as NktTimeLimit, _$identity);

  /// Serializes this NktTimeLimit to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NktTimeLimit&&(identical(other.default_, default_) || other.default_ == default_)&&(identical(other.extended, extended) || other.extended == extended)&&const DeepCollectionEquality().equals(other.extendedSubjectCodes, extendedSubjectCodes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,default_,extended,const DeepCollectionEquality().hash(extendedSubjectCodes));

@override
String toString() {
  return 'NktTimeLimit(default_: $default_, extended: $extended, extendedSubjectCodes: $extendedSubjectCodes)';
}


}

/// @nodoc
abstract mixin class $NktTimeLimitCopyWith<$Res>  {
  factory $NktTimeLimitCopyWith(NktTimeLimit value, $Res Function(NktTimeLimit) _then) = _$NktTimeLimitCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'default') int default_, int extended,@JsonKey(name: 'extended_subject_codes') List<String> extendedSubjectCodes
});




}
/// @nodoc
class _$NktTimeLimitCopyWithImpl<$Res>
    implements $NktTimeLimitCopyWith<$Res> {
  _$NktTimeLimitCopyWithImpl(this._self, this._then);

  final NktTimeLimit _self;
  final $Res Function(NktTimeLimit) _then;

/// Create a copy of NktTimeLimit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? default_ = null,Object? extended = null,Object? extendedSubjectCodes = null,}) {
  return _then(_self.copyWith(
default_: null == default_ ? _self.default_ : default_ // ignore: cast_nullable_to_non_nullable
as int,extended: null == extended ? _self.extended : extended // ignore: cast_nullable_to_non_nullable
as int,extendedSubjectCodes: null == extendedSubjectCodes ? _self.extendedSubjectCodes : extendedSubjectCodes // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [NktTimeLimit].
extension NktTimeLimitPatterns on NktTimeLimit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NktTimeLimit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NktTimeLimit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NktTimeLimit value)  $default,){
final _that = this;
switch (_that) {
case _NktTimeLimit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NktTimeLimit value)?  $default,){
final _that = this;
switch (_that) {
case _NktTimeLimit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'default')  int default_,  int extended, @JsonKey(name: 'extended_subject_codes')  List<String> extendedSubjectCodes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NktTimeLimit() when $default != null:
return $default(_that.default_,_that.extended,_that.extendedSubjectCodes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'default')  int default_,  int extended, @JsonKey(name: 'extended_subject_codes')  List<String> extendedSubjectCodes)  $default,) {final _that = this;
switch (_that) {
case _NktTimeLimit():
return $default(_that.default_,_that.extended,_that.extendedSubjectCodes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'default')  int default_,  int extended, @JsonKey(name: 'extended_subject_codes')  List<String> extendedSubjectCodes)?  $default,) {final _that = this;
switch (_that) {
case _NktTimeLimit() when $default != null:
return $default(_that.default_,_that.extended,_that.extendedSubjectCodes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NktTimeLimit implements NktTimeLimit {
  const _NktTimeLimit({@JsonKey(name: 'default') required this.default_, required this.extended, @JsonKey(name: 'extended_subject_codes') required final  List<String> extendedSubjectCodes}): _extendedSubjectCodes = extendedSubjectCodes;
  factory _NktTimeLimit.fromJson(Map<String, dynamic> json) => _$NktTimeLimitFromJson(json);

@override@JsonKey(name: 'default') final  int default_;
@override final  int extended;
 final  List<String> _extendedSubjectCodes;
@override@JsonKey(name: 'extended_subject_codes') List<String> get extendedSubjectCodes {
  if (_extendedSubjectCodes is EqualUnmodifiableListView) return _extendedSubjectCodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_extendedSubjectCodes);
}


/// Create a copy of NktTimeLimit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NktTimeLimitCopyWith<_NktTimeLimit> get copyWith => __$NktTimeLimitCopyWithImpl<_NktTimeLimit>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NktTimeLimitToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NktTimeLimit&&(identical(other.default_, default_) || other.default_ == default_)&&(identical(other.extended, extended) || other.extended == extended)&&const DeepCollectionEquality().equals(other._extendedSubjectCodes, _extendedSubjectCodes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,default_,extended,const DeepCollectionEquality().hash(_extendedSubjectCodes));

@override
String toString() {
  return 'NktTimeLimit(default_: $default_, extended: $extended, extendedSubjectCodes: $extendedSubjectCodes)';
}


}

/// @nodoc
abstract mixin class _$NktTimeLimitCopyWith<$Res> implements $NktTimeLimitCopyWith<$Res> {
  factory _$NktTimeLimitCopyWith(_NktTimeLimit value, $Res Function(_NktTimeLimit) _then) = __$NktTimeLimitCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'default') int default_, int extended,@JsonKey(name: 'extended_subject_codes') List<String> extendedSubjectCodes
});




}
/// @nodoc
class __$NktTimeLimitCopyWithImpl<$Res>
    implements _$NktTimeLimitCopyWith<$Res> {
  __$NktTimeLimitCopyWithImpl(this._self, this._then);

  final _NktTimeLimit _self;
  final $Res Function(_NktTimeLimit) _then;

/// Create a copy of NktTimeLimit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? default_ = null,Object? extended = null,Object? extendedSubjectCodes = null,}) {
  return _then(_NktTimeLimit(
default_: null == default_ ? _self.default_ : default_ // ignore: cast_nullable_to_non_nullable
as int,extended: null == extended ? _self.extended : extended // ignore: cast_nullable_to_non_nullable
as int,extendedSubjectCodes: null == extendedSubjectCodes ? _self._extendedSubjectCodes : extendedSubjectCodes // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on

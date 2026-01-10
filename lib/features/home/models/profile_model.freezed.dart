// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileModel {

 SchoolModel get school; dynamic get group; QuotaModel get quota; List<AttemptModel> get attempts;
/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileModelCopyWith<ProfileModel> get copyWith => _$ProfileModelCopyWithImpl<ProfileModel>(this as ProfileModel, _$identity);

  /// Serializes this ProfileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileModel&&(identical(other.school, school) || other.school == school)&&const DeepCollectionEquality().equals(other.group, group)&&(identical(other.quota, quota) || other.quota == quota)&&const DeepCollectionEquality().equals(other.attempts, attempts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,school,const DeepCollectionEquality().hash(group),quota,const DeepCollectionEquality().hash(attempts));

@override
String toString() {
  return 'ProfileModel(school: $school, group: $group, quota: $quota, attempts: $attempts)';
}


}

/// @nodoc
abstract mixin class $ProfileModelCopyWith<$Res>  {
  factory $ProfileModelCopyWith(ProfileModel value, $Res Function(ProfileModel) _then) = _$ProfileModelCopyWithImpl;
@useResult
$Res call({
 SchoolModel school, dynamic group, QuotaModel quota, List<AttemptModel> attempts
});


$SchoolModelCopyWith<$Res> get school;$QuotaModelCopyWith<$Res> get quota;

}
/// @nodoc
class _$ProfileModelCopyWithImpl<$Res>
    implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._self, this._then);

  final ProfileModel _self;
  final $Res Function(ProfileModel) _then;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? school = null,Object? group = freezed,Object? quota = null,Object? attempts = null,}) {
  return _then(_self.copyWith(
school: null == school ? _self.school : school // ignore: cast_nullable_to_non_nullable
as SchoolModel,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as dynamic,quota: null == quota ? _self.quota : quota // ignore: cast_nullable_to_non_nullable
as QuotaModel,attempts: null == attempts ? _self.attempts : attempts // ignore: cast_nullable_to_non_nullable
as List<AttemptModel>,
  ));
}
/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SchoolModelCopyWith<$Res> get school {
  
  return $SchoolModelCopyWith<$Res>(_self.school, (value) {
    return _then(_self.copyWith(school: value));
  });
}/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuotaModelCopyWith<$Res> get quota {
  
  return $QuotaModelCopyWith<$Res>(_self.quota, (value) {
    return _then(_self.copyWith(quota: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileModel].
extension ProfileModelPatterns on ProfileModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfileModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SchoolModel school,  dynamic group,  QuotaModel quota,  List<AttemptModel> attempts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that.school,_that.group,_that.quota,_that.attempts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SchoolModel school,  dynamic group,  QuotaModel quota,  List<AttemptModel> attempts)  $default,) {final _that = this;
switch (_that) {
case _ProfileModel():
return $default(_that.school,_that.group,_that.quota,_that.attempts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SchoolModel school,  dynamic group,  QuotaModel quota,  List<AttemptModel> attempts)?  $default,) {final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that.school,_that.group,_that.quota,_that.attempts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileModel implements ProfileModel {
  const _ProfileModel({required this.school, this.group, required this.quota, required final  List<AttemptModel> attempts}): _attempts = attempts;
  factory _ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);

@override final  SchoolModel school;
@override final  dynamic group;
@override final  QuotaModel quota;
 final  List<AttemptModel> _attempts;
@override List<AttemptModel> get attempts {
  if (_attempts is EqualUnmodifiableListView) return _attempts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attempts);
}


/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileModelCopyWith<_ProfileModel> get copyWith => __$ProfileModelCopyWithImpl<_ProfileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileModel&&(identical(other.school, school) || other.school == school)&&const DeepCollectionEquality().equals(other.group, group)&&(identical(other.quota, quota) || other.quota == quota)&&const DeepCollectionEquality().equals(other._attempts, _attempts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,school,const DeepCollectionEquality().hash(group),quota,const DeepCollectionEquality().hash(_attempts));

@override
String toString() {
  return 'ProfileModel(school: $school, group: $group, quota: $quota, attempts: $attempts)';
}


}

/// @nodoc
abstract mixin class _$ProfileModelCopyWith<$Res> implements $ProfileModelCopyWith<$Res> {
  factory _$ProfileModelCopyWith(_ProfileModel value, $Res Function(_ProfileModel) _then) = __$ProfileModelCopyWithImpl;
@override @useResult
$Res call({
 SchoolModel school, dynamic group, QuotaModel quota, List<AttemptModel> attempts
});


@override $SchoolModelCopyWith<$Res> get school;@override $QuotaModelCopyWith<$Res> get quota;

}
/// @nodoc
class __$ProfileModelCopyWithImpl<$Res>
    implements _$ProfileModelCopyWith<$Res> {
  __$ProfileModelCopyWithImpl(this._self, this._then);

  final _ProfileModel _self;
  final $Res Function(_ProfileModel) _then;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? school = null,Object? group = freezed,Object? quota = null,Object? attempts = null,}) {
  return _then(_ProfileModel(
school: null == school ? _self.school : school // ignore: cast_nullable_to_non_nullable
as SchoolModel,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as dynamic,quota: null == quota ? _self.quota : quota // ignore: cast_nullable_to_non_nullable
as QuotaModel,attempts: null == attempts ? _self._attempts : attempts // ignore: cast_nullable_to_non_nullable
as List<AttemptModel>,
  ));
}

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SchoolModelCopyWith<$Res> get school {
  
  return $SchoolModelCopyWith<$Res>(_self.school, (value) {
    return _then(_self.copyWith(school: value));
  });
}/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuotaModelCopyWith<$Res> get quota {
  
  return $QuotaModelCopyWith<$Res>(_self.quota, (value) {
    return _then(_self.copyWith(quota: value));
  });
}
}


/// @nodoc
mixin _$QuotaModel {

@JsonKey(name: 'ent_quota') int? get entQuota;@JsonKey(name: 'nkt_quota') int? get nktQuota;
/// Create a copy of QuotaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuotaModelCopyWith<QuotaModel> get copyWith => _$QuotaModelCopyWithImpl<QuotaModel>(this as QuotaModel, _$identity);

  /// Serializes this QuotaModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuotaModel&&(identical(other.entQuota, entQuota) || other.entQuota == entQuota)&&(identical(other.nktQuota, nktQuota) || other.nktQuota == nktQuota));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,entQuota,nktQuota);

@override
String toString() {
  return 'QuotaModel(entQuota: $entQuota, nktQuota: $nktQuota)';
}


}

/// @nodoc
abstract mixin class $QuotaModelCopyWith<$Res>  {
  factory $QuotaModelCopyWith(QuotaModel value, $Res Function(QuotaModel) _then) = _$QuotaModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'ent_quota') int? entQuota,@JsonKey(name: 'nkt_quota') int? nktQuota
});




}
/// @nodoc
class _$QuotaModelCopyWithImpl<$Res>
    implements $QuotaModelCopyWith<$Res> {
  _$QuotaModelCopyWithImpl(this._self, this._then);

  final QuotaModel _self;
  final $Res Function(QuotaModel) _then;

/// Create a copy of QuotaModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? entQuota = freezed,Object? nktQuota = freezed,}) {
  return _then(_self.copyWith(
entQuota: freezed == entQuota ? _self.entQuota : entQuota // ignore: cast_nullable_to_non_nullable
as int?,nktQuota: freezed == nktQuota ? _self.nktQuota : nktQuota // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [QuotaModel].
extension QuotaModelPatterns on QuotaModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuotaModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuotaModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuotaModel value)  $default,){
final _that = this;
switch (_that) {
case _QuotaModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuotaModel value)?  $default,){
final _that = this;
switch (_that) {
case _QuotaModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'ent_quota')  int? entQuota, @JsonKey(name: 'nkt_quota')  int? nktQuota)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuotaModel() when $default != null:
return $default(_that.entQuota,_that.nktQuota);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'ent_quota')  int? entQuota, @JsonKey(name: 'nkt_quota')  int? nktQuota)  $default,) {final _that = this;
switch (_that) {
case _QuotaModel():
return $default(_that.entQuota,_that.nktQuota);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'ent_quota')  int? entQuota, @JsonKey(name: 'nkt_quota')  int? nktQuota)?  $default,) {final _that = this;
switch (_that) {
case _QuotaModel() when $default != null:
return $default(_that.entQuota,_that.nktQuota);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuotaModel implements QuotaModel {
  const _QuotaModel({@JsonKey(name: 'ent_quota') this.entQuota, @JsonKey(name: 'nkt_quota') this.nktQuota});
  factory _QuotaModel.fromJson(Map<String, dynamic> json) => _$QuotaModelFromJson(json);

@override@JsonKey(name: 'ent_quota') final  int? entQuota;
@override@JsonKey(name: 'nkt_quota') final  int? nktQuota;

/// Create a copy of QuotaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuotaModelCopyWith<_QuotaModel> get copyWith => __$QuotaModelCopyWithImpl<_QuotaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuotaModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuotaModel&&(identical(other.entQuota, entQuota) || other.entQuota == entQuota)&&(identical(other.nktQuota, nktQuota) || other.nktQuota == nktQuota));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,entQuota,nktQuota);

@override
String toString() {
  return 'QuotaModel(entQuota: $entQuota, nktQuota: $nktQuota)';
}


}

/// @nodoc
abstract mixin class _$QuotaModelCopyWith<$Res> implements $QuotaModelCopyWith<$Res> {
  factory _$QuotaModelCopyWith(_QuotaModel value, $Res Function(_QuotaModel) _then) = __$QuotaModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'ent_quota') int? entQuota,@JsonKey(name: 'nkt_quota') int? nktQuota
});




}
/// @nodoc
class __$QuotaModelCopyWithImpl<$Res>
    implements _$QuotaModelCopyWith<$Res> {
  __$QuotaModelCopyWithImpl(this._self, this._then);

  final _QuotaModel _self;
  final $Res Function(_QuotaModel) _then;

/// Create a copy of QuotaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? entQuota = freezed,Object? nktQuota = freezed,}) {
  return _then(_QuotaModel(
entQuota: freezed == entQuota ? _self.entQuota : entQuota // ignore: cast_nullable_to_non_nullable
as int?,nktQuota: freezed == nktQuota ? _self.nktQuota : nktQuota // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$AttemptModel {

 int get id;@JsonKey(name: 'exam_type') String get examType; String get status; String get label;@JsonKey(name: 'started_at') String get startedAt;@JsonKey(name: 'finished_at') String get finishedAt;@JsonKey(name: 'time_limit_minutes') int get timeLimitMinutes;@JsonKey(name: 'total_score') int get totalScore;@JsonKey(name: 'max_score') int get maxScore; List<SubjectScoreModel> get subjects;
/// Create a copy of AttemptModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttemptModelCopyWith<AttemptModel> get copyWith => _$AttemptModelCopyWithImpl<AttemptModel>(this as AttemptModel, _$identity);

  /// Serializes this AttemptModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttemptModel&&(identical(other.id, id) || other.id == id)&&(identical(other.examType, examType) || other.examType == examType)&&(identical(other.status, status) || other.status == status)&&(identical(other.label, label) || other.label == label)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.finishedAt, finishedAt) || other.finishedAt == finishedAt)&&(identical(other.timeLimitMinutes, timeLimitMinutes) || other.timeLimitMinutes == timeLimitMinutes)&&(identical(other.totalScore, totalScore) || other.totalScore == totalScore)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&const DeepCollectionEquality().equals(other.subjects, subjects));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,examType,status,label,startedAt,finishedAt,timeLimitMinutes,totalScore,maxScore,const DeepCollectionEquality().hash(subjects));

@override
String toString() {
  return 'AttemptModel(id: $id, examType: $examType, status: $status, label: $label, startedAt: $startedAt, finishedAt: $finishedAt, timeLimitMinutes: $timeLimitMinutes, totalScore: $totalScore, maxScore: $maxScore, subjects: $subjects)';
}


}

/// @nodoc
abstract mixin class $AttemptModelCopyWith<$Res>  {
  factory $AttemptModelCopyWith(AttemptModel value, $Res Function(AttemptModel) _then) = _$AttemptModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'exam_type') String examType, String status, String label,@JsonKey(name: 'started_at') String startedAt,@JsonKey(name: 'finished_at') String finishedAt,@JsonKey(name: 'time_limit_minutes') int timeLimitMinutes,@JsonKey(name: 'total_score') int totalScore,@JsonKey(name: 'max_score') int maxScore, List<SubjectScoreModel> subjects
});




}
/// @nodoc
class _$AttemptModelCopyWithImpl<$Res>
    implements $AttemptModelCopyWith<$Res> {
  _$AttemptModelCopyWithImpl(this._self, this._then);

  final AttemptModel _self;
  final $Res Function(AttemptModel) _then;

/// Create a copy of AttemptModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? examType = null,Object? status = null,Object? label = null,Object? startedAt = null,Object? finishedAt = null,Object? timeLimitMinutes = null,Object? totalScore = null,Object? maxScore = null,Object? subjects = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,examType: null == examType ? _self.examType : examType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as String,finishedAt: null == finishedAt ? _self.finishedAt : finishedAt // ignore: cast_nullable_to_non_nullable
as String,timeLimitMinutes: null == timeLimitMinutes ? _self.timeLimitMinutes : timeLimitMinutes // ignore: cast_nullable_to_non_nullable
as int,totalScore: null == totalScore ? _self.totalScore : totalScore // ignore: cast_nullable_to_non_nullable
as int,maxScore: null == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as int,subjects: null == subjects ? _self.subjects : subjects // ignore: cast_nullable_to_non_nullable
as List<SubjectScoreModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [AttemptModel].
extension AttemptModelPatterns on AttemptModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttemptModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttemptModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttemptModel value)  $default,){
final _that = this;
switch (_that) {
case _AttemptModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttemptModel value)?  $default,){
final _that = this;
switch (_that) {
case _AttemptModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'exam_type')  String examType,  String status,  String label, @JsonKey(name: 'started_at')  String startedAt, @JsonKey(name: 'finished_at')  String finishedAt, @JsonKey(name: 'time_limit_minutes')  int timeLimitMinutes, @JsonKey(name: 'total_score')  int totalScore, @JsonKey(name: 'max_score')  int maxScore,  List<SubjectScoreModel> subjects)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttemptModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'exam_type')  String examType,  String status,  String label, @JsonKey(name: 'started_at')  String startedAt, @JsonKey(name: 'finished_at')  String finishedAt, @JsonKey(name: 'time_limit_minutes')  int timeLimitMinutes, @JsonKey(name: 'total_score')  int totalScore, @JsonKey(name: 'max_score')  int maxScore,  List<SubjectScoreModel> subjects)  $default,) {final _that = this;
switch (_that) {
case _AttemptModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'exam_type')  String examType,  String status,  String label, @JsonKey(name: 'started_at')  String startedAt, @JsonKey(name: 'finished_at')  String finishedAt, @JsonKey(name: 'time_limit_minutes')  int timeLimitMinutes, @JsonKey(name: 'total_score')  int totalScore, @JsonKey(name: 'max_score')  int maxScore,  List<SubjectScoreModel> subjects)?  $default,) {final _that = this;
switch (_that) {
case _AttemptModel() when $default != null:
return $default(_that.id,_that.examType,_that.status,_that.label,_that.startedAt,_that.finishedAt,_that.timeLimitMinutes,_that.totalScore,_that.maxScore,_that.subjects);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttemptModel implements AttemptModel {
  const _AttemptModel({required this.id, @JsonKey(name: 'exam_type') required this.examType, required this.status, required this.label, @JsonKey(name: 'started_at') required this.startedAt, @JsonKey(name: 'finished_at') required this.finishedAt, @JsonKey(name: 'time_limit_minutes') required this.timeLimitMinutes, @JsonKey(name: 'total_score') required this.totalScore, @JsonKey(name: 'max_score') required this.maxScore, required final  List<SubjectScoreModel> subjects}): _subjects = subjects;
  factory _AttemptModel.fromJson(Map<String, dynamic> json) => _$AttemptModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'exam_type') final  String examType;
@override final  String status;
@override final  String label;
@override@JsonKey(name: 'started_at') final  String startedAt;
@override@JsonKey(name: 'finished_at') final  String finishedAt;
@override@JsonKey(name: 'time_limit_minutes') final  int timeLimitMinutes;
@override@JsonKey(name: 'total_score') final  int totalScore;
@override@JsonKey(name: 'max_score') final  int maxScore;
 final  List<SubjectScoreModel> _subjects;
@override List<SubjectScoreModel> get subjects {
  if (_subjects is EqualUnmodifiableListView) return _subjects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subjects);
}


/// Create a copy of AttemptModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttemptModelCopyWith<_AttemptModel> get copyWith => __$AttemptModelCopyWithImpl<_AttemptModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttemptModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttemptModel&&(identical(other.id, id) || other.id == id)&&(identical(other.examType, examType) || other.examType == examType)&&(identical(other.status, status) || other.status == status)&&(identical(other.label, label) || other.label == label)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.finishedAt, finishedAt) || other.finishedAt == finishedAt)&&(identical(other.timeLimitMinutes, timeLimitMinutes) || other.timeLimitMinutes == timeLimitMinutes)&&(identical(other.totalScore, totalScore) || other.totalScore == totalScore)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&const DeepCollectionEquality().equals(other._subjects, _subjects));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,examType,status,label,startedAt,finishedAt,timeLimitMinutes,totalScore,maxScore,const DeepCollectionEquality().hash(_subjects));

@override
String toString() {
  return 'AttemptModel(id: $id, examType: $examType, status: $status, label: $label, startedAt: $startedAt, finishedAt: $finishedAt, timeLimitMinutes: $timeLimitMinutes, totalScore: $totalScore, maxScore: $maxScore, subjects: $subjects)';
}


}

/// @nodoc
abstract mixin class _$AttemptModelCopyWith<$Res> implements $AttemptModelCopyWith<$Res> {
  factory _$AttemptModelCopyWith(_AttemptModel value, $Res Function(_AttemptModel) _then) = __$AttemptModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'exam_type') String examType, String status, String label,@JsonKey(name: 'started_at') String startedAt,@JsonKey(name: 'finished_at') String finishedAt,@JsonKey(name: 'time_limit_minutes') int timeLimitMinutes,@JsonKey(name: 'total_score') int totalScore,@JsonKey(name: 'max_score') int maxScore, List<SubjectScoreModel> subjects
});




}
/// @nodoc
class __$AttemptModelCopyWithImpl<$Res>
    implements _$AttemptModelCopyWith<$Res> {
  __$AttemptModelCopyWithImpl(this._self, this._then);

  final _AttemptModel _self;
  final $Res Function(_AttemptModel) _then;

/// Create a copy of AttemptModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? examType = null,Object? status = null,Object? label = null,Object? startedAt = null,Object? finishedAt = null,Object? timeLimitMinutes = null,Object? totalScore = null,Object? maxScore = null,Object? subjects = null,}) {
  return _then(_AttemptModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,examType: null == examType ? _self.examType : examType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as String,finishedAt: null == finishedAt ? _self.finishedAt : finishedAt // ignore: cast_nullable_to_non_nullable
as String,timeLimitMinutes: null == timeLimitMinutes ? _self.timeLimitMinutes : timeLimitMinutes // ignore: cast_nullable_to_non_nullable
as int,totalScore: null == totalScore ? _self.totalScore : totalScore // ignore: cast_nullable_to_non_nullable
as int,maxScore: null == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as int,subjects: null == subjects ? _self._subjects : subjects // ignore: cast_nullable_to_non_nullable
as List<SubjectScoreModel>,
  ));
}


}


/// @nodoc
mixin _$SubjectScoreModel {

 String get name; int get score;@JsonKey(name: 'max_score') int get maxScore;
/// Create a copy of SubjectScoreModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubjectScoreModelCopyWith<SubjectScoreModel> get copyWith => _$SubjectScoreModelCopyWithImpl<SubjectScoreModel>(this as SubjectScoreModel, _$identity);

  /// Serializes this SubjectScoreModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubjectScoreModel&&(identical(other.name, name) || other.name == name)&&(identical(other.score, score) || other.score == score)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,score,maxScore);

@override
String toString() {
  return 'SubjectScoreModel(name: $name, score: $score, maxScore: $maxScore)';
}


}

/// @nodoc
abstract mixin class $SubjectScoreModelCopyWith<$Res>  {
  factory $SubjectScoreModelCopyWith(SubjectScoreModel value, $Res Function(SubjectScoreModel) _then) = _$SubjectScoreModelCopyWithImpl;
@useResult
$Res call({
 String name, int score,@JsonKey(name: 'max_score') int maxScore
});




}
/// @nodoc
class _$SubjectScoreModelCopyWithImpl<$Res>
    implements $SubjectScoreModelCopyWith<$Res> {
  _$SubjectScoreModelCopyWithImpl(this._self, this._then);

  final SubjectScoreModel _self;
  final $Res Function(SubjectScoreModel) _then;

/// Create a copy of SubjectScoreModel
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


/// Adds pattern-matching-related methods to [SubjectScoreModel].
extension SubjectScoreModelPatterns on SubjectScoreModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubjectScoreModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubjectScoreModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubjectScoreModel value)  $default,){
final _that = this;
switch (_that) {
case _SubjectScoreModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubjectScoreModel value)?  $default,){
final _that = this;
switch (_that) {
case _SubjectScoreModel() when $default != null:
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
case _SubjectScoreModel() when $default != null:
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
case _SubjectScoreModel():
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
case _SubjectScoreModel() when $default != null:
return $default(_that.name,_that.score,_that.maxScore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubjectScoreModel implements SubjectScoreModel {
  const _SubjectScoreModel({required this.name, required this.score, @JsonKey(name: 'max_score') required this.maxScore});
  factory _SubjectScoreModel.fromJson(Map<String, dynamic> json) => _$SubjectScoreModelFromJson(json);

@override final  String name;
@override final  int score;
@override@JsonKey(name: 'max_score') final  int maxScore;

/// Create a copy of SubjectScoreModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubjectScoreModelCopyWith<_SubjectScoreModel> get copyWith => __$SubjectScoreModelCopyWithImpl<_SubjectScoreModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubjectScoreModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubjectScoreModel&&(identical(other.name, name) || other.name == name)&&(identical(other.score, score) || other.score == score)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,score,maxScore);

@override
String toString() {
  return 'SubjectScoreModel(name: $name, score: $score, maxScore: $maxScore)';
}


}

/// @nodoc
abstract mixin class _$SubjectScoreModelCopyWith<$Res> implements $SubjectScoreModelCopyWith<$Res> {
  factory _$SubjectScoreModelCopyWith(_SubjectScoreModel value, $Res Function(_SubjectScoreModel) _then) = __$SubjectScoreModelCopyWithImpl;
@override @useResult
$Res call({
 String name, int score,@JsonKey(name: 'max_score') int maxScore
});




}
/// @nodoc
class __$SubjectScoreModelCopyWithImpl<$Res>
    implements _$SubjectScoreModelCopyWith<$Res> {
  __$SubjectScoreModelCopyWithImpl(this._self, this._then);

  final _SubjectScoreModel _self;
  final $Res Function(_SubjectScoreModel) _then;

/// Create a copy of SubjectScoreModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? score = null,Object? maxScore = null,}) {
  return _then(_SubjectScoreModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,maxScore: null == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

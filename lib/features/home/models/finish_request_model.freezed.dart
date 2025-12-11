// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'finish_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FinishRequestModel {

 List<FinishSubjectModel> get subjects; ChallengeModel get challenge;
/// Create a copy of FinishRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FinishRequestModelCopyWith<FinishRequestModel> get copyWith => _$FinishRequestModelCopyWithImpl<FinishRequestModel>(this as FinishRequestModel, _$identity);

  /// Serializes this FinishRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FinishRequestModel&&const DeepCollectionEquality().equals(other.subjects, subjects)&&(identical(other.challenge, challenge) || other.challenge == challenge));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(subjects),challenge);

@override
String toString() {
  return 'FinishRequestModel(subjects: $subjects, challenge: $challenge)';
}


}

/// @nodoc
abstract mixin class $FinishRequestModelCopyWith<$Res>  {
  factory $FinishRequestModelCopyWith(FinishRequestModel value, $Res Function(FinishRequestModel) _then) = _$FinishRequestModelCopyWithImpl;
@useResult
$Res call({
 List<FinishSubjectModel> subjects, ChallengeModel challenge
});


$ChallengeModelCopyWith<$Res> get challenge;

}
/// @nodoc
class _$FinishRequestModelCopyWithImpl<$Res>
    implements $FinishRequestModelCopyWith<$Res> {
  _$FinishRequestModelCopyWithImpl(this._self, this._then);

  final FinishRequestModel _self;
  final $Res Function(FinishRequestModel) _then;

/// Create a copy of FinishRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subjects = null,Object? challenge = null,}) {
  return _then(_self.copyWith(
subjects: null == subjects ? _self.subjects : subjects // ignore: cast_nullable_to_non_nullable
as List<FinishSubjectModel>,challenge: null == challenge ? _self.challenge : challenge // ignore: cast_nullable_to_non_nullable
as ChallengeModel,
  ));
}
/// Create a copy of FinishRequestModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChallengeModelCopyWith<$Res> get challenge {
  
  return $ChallengeModelCopyWith<$Res>(_self.challenge, (value) {
    return _then(_self.copyWith(challenge: value));
  });
}
}


/// Adds pattern-matching-related methods to [FinishRequestModel].
extension FinishRequestModelPatterns on FinishRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FinishRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FinishRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FinishRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _FinishRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FinishRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _FinishRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<FinishSubjectModel> subjects,  ChallengeModel challenge)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FinishRequestModel() when $default != null:
return $default(_that.subjects,_that.challenge);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<FinishSubjectModel> subjects,  ChallengeModel challenge)  $default,) {final _that = this;
switch (_that) {
case _FinishRequestModel():
return $default(_that.subjects,_that.challenge);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<FinishSubjectModel> subjects,  ChallengeModel challenge)?  $default,) {final _that = this;
switch (_that) {
case _FinishRequestModel() when $default != null:
return $default(_that.subjects,_that.challenge);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FinishRequestModel implements FinishRequestModel {
  const _FinishRequestModel({required final  List<FinishSubjectModel> subjects, required this.challenge}): _subjects = subjects;
  factory _FinishRequestModel.fromJson(Map<String, dynamic> json) => _$FinishRequestModelFromJson(json);

 final  List<FinishSubjectModel> _subjects;
@override List<FinishSubjectModel> get subjects {
  if (_subjects is EqualUnmodifiableListView) return _subjects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subjects);
}

@override final  ChallengeModel challenge;

/// Create a copy of FinishRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FinishRequestModelCopyWith<_FinishRequestModel> get copyWith => __$FinishRequestModelCopyWithImpl<_FinishRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FinishRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FinishRequestModel&&const DeepCollectionEquality().equals(other._subjects, _subjects)&&(identical(other.challenge, challenge) || other.challenge == challenge));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_subjects),challenge);

@override
String toString() {
  return 'FinishRequestModel(subjects: $subjects, challenge: $challenge)';
}


}

/// @nodoc
abstract mixin class _$FinishRequestModelCopyWith<$Res> implements $FinishRequestModelCopyWith<$Res> {
  factory _$FinishRequestModelCopyWith(_FinishRequestModel value, $Res Function(_FinishRequestModel) _then) = __$FinishRequestModelCopyWithImpl;
@override @useResult
$Res call({
 List<FinishSubjectModel> subjects, ChallengeModel challenge
});


@override $ChallengeModelCopyWith<$Res> get challenge;

}
/// @nodoc
class __$FinishRequestModelCopyWithImpl<$Res>
    implements _$FinishRequestModelCopyWith<$Res> {
  __$FinishRequestModelCopyWithImpl(this._self, this._then);

  final _FinishRequestModel _self;
  final $Res Function(_FinishRequestModel) _then;

/// Create a copy of FinishRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subjects = null,Object? challenge = null,}) {
  return _then(_FinishRequestModel(
subjects: null == subjects ? _self._subjects : subjects // ignore: cast_nullable_to_non_nullable
as List<FinishSubjectModel>,challenge: null == challenge ? _self.challenge : challenge // ignore: cast_nullable_to_non_nullable
as ChallengeModel,
  ));
}

/// Create a copy of FinishRequestModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChallengeModelCopyWith<$Res> get challenge {
  
  return $ChallengeModelCopyWith<$Res>(_self.challenge, (value) {
    return _then(_self.copyWith(challenge: value));
  });
}
}


/// @nodoc
mixin _$FinishSubjectModel {

@JsonKey(name: 'subject_attempt_id') int get subjectAttemptId; String get name; int get answered; int get total;
/// Create a copy of FinishSubjectModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FinishSubjectModelCopyWith<FinishSubjectModel> get copyWith => _$FinishSubjectModelCopyWithImpl<FinishSubjectModel>(this as FinishSubjectModel, _$identity);

  /// Serializes this FinishSubjectModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FinishSubjectModel&&(identical(other.subjectAttemptId, subjectAttemptId) || other.subjectAttemptId == subjectAttemptId)&&(identical(other.name, name) || other.name == name)&&(identical(other.answered, answered) || other.answered == answered)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subjectAttemptId,name,answered,total);

@override
String toString() {
  return 'FinishSubjectModel(subjectAttemptId: $subjectAttemptId, name: $name, answered: $answered, total: $total)';
}


}

/// @nodoc
abstract mixin class $FinishSubjectModelCopyWith<$Res>  {
  factory $FinishSubjectModelCopyWith(FinishSubjectModel value, $Res Function(FinishSubjectModel) _then) = _$FinishSubjectModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'subject_attempt_id') int subjectAttemptId, String name, int answered, int total
});




}
/// @nodoc
class _$FinishSubjectModelCopyWithImpl<$Res>
    implements $FinishSubjectModelCopyWith<$Res> {
  _$FinishSubjectModelCopyWithImpl(this._self, this._then);

  final FinishSubjectModel _self;
  final $Res Function(FinishSubjectModel) _then;

/// Create a copy of FinishSubjectModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subjectAttemptId = null,Object? name = null,Object? answered = null,Object? total = null,}) {
  return _then(_self.copyWith(
subjectAttemptId: null == subjectAttemptId ? _self.subjectAttemptId : subjectAttemptId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,answered: null == answered ? _self.answered : answered // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FinishSubjectModel].
extension FinishSubjectModelPatterns on FinishSubjectModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FinishSubjectModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FinishSubjectModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FinishSubjectModel value)  $default,){
final _that = this;
switch (_that) {
case _FinishSubjectModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FinishSubjectModel value)?  $default,){
final _that = this;
switch (_that) {
case _FinishSubjectModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'subject_attempt_id')  int subjectAttemptId,  String name,  int answered,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FinishSubjectModel() when $default != null:
return $default(_that.subjectAttemptId,_that.name,_that.answered,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'subject_attempt_id')  int subjectAttemptId,  String name,  int answered,  int total)  $default,) {final _that = this;
switch (_that) {
case _FinishSubjectModel():
return $default(_that.subjectAttemptId,_that.name,_that.answered,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'subject_attempt_id')  int subjectAttemptId,  String name,  int answered,  int total)?  $default,) {final _that = this;
switch (_that) {
case _FinishSubjectModel() when $default != null:
return $default(_that.subjectAttemptId,_that.name,_that.answered,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FinishSubjectModel implements FinishSubjectModel {
  const _FinishSubjectModel({@JsonKey(name: 'subject_attempt_id') required this.subjectAttemptId, required this.name, required this.answered, required this.total});
  factory _FinishSubjectModel.fromJson(Map<String, dynamic> json) => _$FinishSubjectModelFromJson(json);

@override@JsonKey(name: 'subject_attempt_id') final  int subjectAttemptId;
@override final  String name;
@override final  int answered;
@override final  int total;

/// Create a copy of FinishSubjectModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FinishSubjectModelCopyWith<_FinishSubjectModel> get copyWith => __$FinishSubjectModelCopyWithImpl<_FinishSubjectModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FinishSubjectModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FinishSubjectModel&&(identical(other.subjectAttemptId, subjectAttemptId) || other.subjectAttemptId == subjectAttemptId)&&(identical(other.name, name) || other.name == name)&&(identical(other.answered, answered) || other.answered == answered)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subjectAttemptId,name,answered,total);

@override
String toString() {
  return 'FinishSubjectModel(subjectAttemptId: $subjectAttemptId, name: $name, answered: $answered, total: $total)';
}


}

/// @nodoc
abstract mixin class _$FinishSubjectModelCopyWith<$Res> implements $FinishSubjectModelCopyWith<$Res> {
  factory _$FinishSubjectModelCopyWith(_FinishSubjectModel value, $Res Function(_FinishSubjectModel) _then) = __$FinishSubjectModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'subject_attempt_id') int subjectAttemptId, String name, int answered, int total
});




}
/// @nodoc
class __$FinishSubjectModelCopyWithImpl<$Res>
    implements _$FinishSubjectModelCopyWith<$Res> {
  __$FinishSubjectModelCopyWithImpl(this._self, this._then);

  final _FinishSubjectModel _self;
  final $Res Function(_FinishSubjectModel) _then;

/// Create a copy of FinishSubjectModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subjectAttemptId = null,Object? name = null,Object? answered = null,Object? total = null,}) {
  return _then(_FinishSubjectModel(
subjectAttemptId: null == subjectAttemptId ? _self.subjectAttemptId : subjectAttemptId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,answered: null == answered ? _self.answered : answered // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ChallengeModel {

 int get left; int get right;
/// Create a copy of ChallengeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChallengeModelCopyWith<ChallengeModel> get copyWith => _$ChallengeModelCopyWithImpl<ChallengeModel>(this as ChallengeModel, _$identity);

  /// Serializes this ChallengeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChallengeModel&&(identical(other.left, left) || other.left == left)&&(identical(other.right, right) || other.right == right));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,left,right);

@override
String toString() {
  return 'ChallengeModel(left: $left, right: $right)';
}


}

/// @nodoc
abstract mixin class $ChallengeModelCopyWith<$Res>  {
  factory $ChallengeModelCopyWith(ChallengeModel value, $Res Function(ChallengeModel) _then) = _$ChallengeModelCopyWithImpl;
@useResult
$Res call({
 int left, int right
});




}
/// @nodoc
class _$ChallengeModelCopyWithImpl<$Res>
    implements $ChallengeModelCopyWith<$Res> {
  _$ChallengeModelCopyWithImpl(this._self, this._then);

  final ChallengeModel _self;
  final $Res Function(ChallengeModel) _then;

/// Create a copy of ChallengeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? left = null,Object? right = null,}) {
  return _then(_self.copyWith(
left: null == left ? _self.left : left // ignore: cast_nullable_to_non_nullable
as int,right: null == right ? _self.right : right // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ChallengeModel].
extension ChallengeModelPatterns on ChallengeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChallengeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChallengeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChallengeModel value)  $default,){
final _that = this;
switch (_that) {
case _ChallengeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChallengeModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChallengeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int left,  int right)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChallengeModel() when $default != null:
return $default(_that.left,_that.right);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int left,  int right)  $default,) {final _that = this;
switch (_that) {
case _ChallengeModel():
return $default(_that.left,_that.right);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int left,  int right)?  $default,) {final _that = this;
switch (_that) {
case _ChallengeModel() when $default != null:
return $default(_that.left,_that.right);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChallengeModel implements ChallengeModel {
  const _ChallengeModel({required this.left, required this.right});
  factory _ChallengeModel.fromJson(Map<String, dynamic> json) => _$ChallengeModelFromJson(json);

@override final  int left;
@override final  int right;

/// Create a copy of ChallengeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChallengeModelCopyWith<_ChallengeModel> get copyWith => __$ChallengeModelCopyWithImpl<_ChallengeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChallengeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChallengeModel&&(identical(other.left, left) || other.left == left)&&(identical(other.right, right) || other.right == right));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,left,right);

@override
String toString() {
  return 'ChallengeModel(left: $left, right: $right)';
}


}

/// @nodoc
abstract mixin class _$ChallengeModelCopyWith<$Res> implements $ChallengeModelCopyWith<$Res> {
  factory _$ChallengeModelCopyWith(_ChallengeModel value, $Res Function(_ChallengeModel) _then) = __$ChallengeModelCopyWithImpl;
@override @useResult
$Res call({
 int left, int right
});




}
/// @nodoc
class __$ChallengeModelCopyWithImpl<$Res>
    implements _$ChallengeModelCopyWith<$Res> {
  __$ChallengeModelCopyWithImpl(this._self, this._then);

  final _ChallengeModel _self;
  final $Res Function(_ChallengeModel) _then;

/// Create a copy of ChallengeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? left = null,Object? right = null,}) {
  return _then(_ChallengeModel(
left: null == left ? _self.left : left // ignore: cast_nullable_to_non_nullable
as int,right: null == right ? _self.right : right // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

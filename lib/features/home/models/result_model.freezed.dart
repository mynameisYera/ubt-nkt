// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResultModel {

 int get id;@JsonKey(name: 'exam_type') String get examType; String get status;@JsonKey(name: 'total_score') int get totalScore;@JsonKey(name: 'max_score') int get maxScore; List<ResultSubjectModel> get subjects;
/// Create a copy of ResultModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResultModelCopyWith<ResultModel> get copyWith => _$ResultModelCopyWithImpl<ResultModel>(this as ResultModel, _$identity);

  /// Serializes this ResultModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultModel&&(identical(other.id, id) || other.id == id)&&(identical(other.examType, examType) || other.examType == examType)&&(identical(other.status, status) || other.status == status)&&(identical(other.totalScore, totalScore) || other.totalScore == totalScore)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&const DeepCollectionEquality().equals(other.subjects, subjects));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,examType,status,totalScore,maxScore,const DeepCollectionEquality().hash(subjects));

@override
String toString() {
  return 'ResultModel(id: $id, examType: $examType, status: $status, totalScore: $totalScore, maxScore: $maxScore, subjects: $subjects)';
}


}

/// @nodoc
abstract mixin class $ResultModelCopyWith<$Res>  {
  factory $ResultModelCopyWith(ResultModel value, $Res Function(ResultModel) _then) = _$ResultModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'exam_type') String examType, String status,@JsonKey(name: 'total_score') int totalScore,@JsonKey(name: 'max_score') int maxScore, List<ResultSubjectModel> subjects
});




}
/// @nodoc
class _$ResultModelCopyWithImpl<$Res>
    implements $ResultModelCopyWith<$Res> {
  _$ResultModelCopyWithImpl(this._self, this._then);

  final ResultModel _self;
  final $Res Function(ResultModel) _then;

/// Create a copy of ResultModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? examType = null,Object? status = null,Object? totalScore = null,Object? maxScore = null,Object? subjects = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,examType: null == examType ? _self.examType : examType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,totalScore: null == totalScore ? _self.totalScore : totalScore // ignore: cast_nullable_to_non_nullable
as int,maxScore: null == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as int,subjects: null == subjects ? _self.subjects : subjects // ignore: cast_nullable_to_non_nullable
as List<ResultSubjectModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ResultModel].
extension ResultModelPatterns on ResultModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResultModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResultModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResultModel value)  $default,){
final _that = this;
switch (_that) {
case _ResultModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResultModel value)?  $default,){
final _that = this;
switch (_that) {
case _ResultModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'exam_type')  String examType,  String status, @JsonKey(name: 'total_score')  int totalScore, @JsonKey(name: 'max_score')  int maxScore,  List<ResultSubjectModel> subjects)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResultModel() when $default != null:
return $default(_that.id,_that.examType,_that.status,_that.totalScore,_that.maxScore,_that.subjects);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'exam_type')  String examType,  String status, @JsonKey(name: 'total_score')  int totalScore, @JsonKey(name: 'max_score')  int maxScore,  List<ResultSubjectModel> subjects)  $default,) {final _that = this;
switch (_that) {
case _ResultModel():
return $default(_that.id,_that.examType,_that.status,_that.totalScore,_that.maxScore,_that.subjects);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'exam_type')  String examType,  String status, @JsonKey(name: 'total_score')  int totalScore, @JsonKey(name: 'max_score')  int maxScore,  List<ResultSubjectModel> subjects)?  $default,) {final _that = this;
switch (_that) {
case _ResultModel() when $default != null:
return $default(_that.id,_that.examType,_that.status,_that.totalScore,_that.maxScore,_that.subjects);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResultModel implements ResultModel {
  const _ResultModel({required this.id, @JsonKey(name: 'exam_type') required this.examType, required this.status, @JsonKey(name: 'total_score') required this.totalScore, @JsonKey(name: 'max_score') required this.maxScore, required final  List<ResultSubjectModel> subjects}): _subjects = subjects;
  factory _ResultModel.fromJson(Map<String, dynamic> json) => _$ResultModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'exam_type') final  String examType;
@override final  String status;
@override@JsonKey(name: 'total_score') final  int totalScore;
@override@JsonKey(name: 'max_score') final  int maxScore;
 final  List<ResultSubjectModel> _subjects;
@override List<ResultSubjectModel> get subjects {
  if (_subjects is EqualUnmodifiableListView) return _subjects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subjects);
}


/// Create a copy of ResultModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResultModelCopyWith<_ResultModel> get copyWith => __$ResultModelCopyWithImpl<_ResultModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResultModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResultModel&&(identical(other.id, id) || other.id == id)&&(identical(other.examType, examType) || other.examType == examType)&&(identical(other.status, status) || other.status == status)&&(identical(other.totalScore, totalScore) || other.totalScore == totalScore)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&const DeepCollectionEquality().equals(other._subjects, _subjects));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,examType,status,totalScore,maxScore,const DeepCollectionEquality().hash(_subjects));

@override
String toString() {
  return 'ResultModel(id: $id, examType: $examType, status: $status, totalScore: $totalScore, maxScore: $maxScore, subjects: $subjects)';
}


}

/// @nodoc
abstract mixin class _$ResultModelCopyWith<$Res> implements $ResultModelCopyWith<$Res> {
  factory _$ResultModelCopyWith(_ResultModel value, $Res Function(_ResultModel) _then) = __$ResultModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'exam_type') String examType, String status,@JsonKey(name: 'total_score') int totalScore,@JsonKey(name: 'max_score') int maxScore, List<ResultSubjectModel> subjects
});




}
/// @nodoc
class __$ResultModelCopyWithImpl<$Res>
    implements _$ResultModelCopyWith<$Res> {
  __$ResultModelCopyWithImpl(this._self, this._then);

  final _ResultModel _self;
  final $Res Function(_ResultModel) _then;

/// Create a copy of ResultModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? examType = null,Object? status = null,Object? totalScore = null,Object? maxScore = null,Object? subjects = null,}) {
  return _then(_ResultModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,examType: null == examType ? _self.examType : examType // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,totalScore: null == totalScore ? _self.totalScore : totalScore // ignore: cast_nullable_to_non_nullable
as int,maxScore: null == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as int,subjects: null == subjects ? _self._subjects : subjects // ignore: cast_nullable_to_non_nullable
as List<ResultSubjectModel>,
  ));
}


}


/// @nodoc
mixin _$ResultSubjectModel {

@JsonKey(name: 'subject_attempt_id') int get subjectAttemptId; String get name; int get score;@JsonKey(name: 'max_score') int get maxScore; List<ResultQuestionModel> get questions;
/// Create a copy of ResultSubjectModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResultSubjectModelCopyWith<ResultSubjectModel> get copyWith => _$ResultSubjectModelCopyWithImpl<ResultSubjectModel>(this as ResultSubjectModel, _$identity);

  /// Serializes this ResultSubjectModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultSubjectModel&&(identical(other.subjectAttemptId, subjectAttemptId) || other.subjectAttemptId == subjectAttemptId)&&(identical(other.name, name) || other.name == name)&&(identical(other.score, score) || other.score == score)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&const DeepCollectionEquality().equals(other.questions, questions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subjectAttemptId,name,score,maxScore,const DeepCollectionEquality().hash(questions));

@override
String toString() {
  return 'ResultSubjectModel(subjectAttemptId: $subjectAttemptId, name: $name, score: $score, maxScore: $maxScore, questions: $questions)';
}


}

/// @nodoc
abstract mixin class $ResultSubjectModelCopyWith<$Res>  {
  factory $ResultSubjectModelCopyWith(ResultSubjectModel value, $Res Function(ResultSubjectModel) _then) = _$ResultSubjectModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'subject_attempt_id') int subjectAttemptId, String name, int score,@JsonKey(name: 'max_score') int maxScore, List<ResultQuestionModel> questions
});




}
/// @nodoc
class _$ResultSubjectModelCopyWithImpl<$Res>
    implements $ResultSubjectModelCopyWith<$Res> {
  _$ResultSubjectModelCopyWithImpl(this._self, this._then);

  final ResultSubjectModel _self;
  final $Res Function(ResultSubjectModel) _then;

/// Create a copy of ResultSubjectModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subjectAttemptId = null,Object? name = null,Object? score = null,Object? maxScore = null,Object? questions = null,}) {
  return _then(_self.copyWith(
subjectAttemptId: null == subjectAttemptId ? _self.subjectAttemptId : subjectAttemptId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,maxScore: null == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as int,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<ResultQuestionModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ResultSubjectModel].
extension ResultSubjectModelPatterns on ResultSubjectModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResultSubjectModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResultSubjectModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResultSubjectModel value)  $default,){
final _that = this;
switch (_that) {
case _ResultSubjectModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResultSubjectModel value)?  $default,){
final _that = this;
switch (_that) {
case _ResultSubjectModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'subject_attempt_id')  int subjectAttemptId,  String name,  int score, @JsonKey(name: 'max_score')  int maxScore,  List<ResultQuestionModel> questions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResultSubjectModel() when $default != null:
return $default(_that.subjectAttemptId,_that.name,_that.score,_that.maxScore,_that.questions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'subject_attempt_id')  int subjectAttemptId,  String name,  int score, @JsonKey(name: 'max_score')  int maxScore,  List<ResultQuestionModel> questions)  $default,) {final _that = this;
switch (_that) {
case _ResultSubjectModel():
return $default(_that.subjectAttemptId,_that.name,_that.score,_that.maxScore,_that.questions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'subject_attempt_id')  int subjectAttemptId,  String name,  int score, @JsonKey(name: 'max_score')  int maxScore,  List<ResultQuestionModel> questions)?  $default,) {final _that = this;
switch (_that) {
case _ResultSubjectModel() when $default != null:
return $default(_that.subjectAttemptId,_that.name,_that.score,_that.maxScore,_that.questions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResultSubjectModel implements ResultSubjectModel {
  const _ResultSubjectModel({@JsonKey(name: 'subject_attempt_id') required this.subjectAttemptId, required this.name, required this.score, @JsonKey(name: 'max_score') required this.maxScore, required final  List<ResultQuestionModel> questions}): _questions = questions;
  factory _ResultSubjectModel.fromJson(Map<String, dynamic> json) => _$ResultSubjectModelFromJson(json);

@override@JsonKey(name: 'subject_attempt_id') final  int subjectAttemptId;
@override final  String name;
@override final  int score;
@override@JsonKey(name: 'max_score') final  int maxScore;
 final  List<ResultQuestionModel> _questions;
@override List<ResultQuestionModel> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}


/// Create a copy of ResultSubjectModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResultSubjectModelCopyWith<_ResultSubjectModel> get copyWith => __$ResultSubjectModelCopyWithImpl<_ResultSubjectModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResultSubjectModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResultSubjectModel&&(identical(other.subjectAttemptId, subjectAttemptId) || other.subjectAttemptId == subjectAttemptId)&&(identical(other.name, name) || other.name == name)&&(identical(other.score, score) || other.score == score)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&const DeepCollectionEquality().equals(other._questions, _questions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subjectAttemptId,name,score,maxScore,const DeepCollectionEquality().hash(_questions));

@override
String toString() {
  return 'ResultSubjectModel(subjectAttemptId: $subjectAttemptId, name: $name, score: $score, maxScore: $maxScore, questions: $questions)';
}


}

/// @nodoc
abstract mixin class _$ResultSubjectModelCopyWith<$Res> implements $ResultSubjectModelCopyWith<$Res> {
  factory _$ResultSubjectModelCopyWith(_ResultSubjectModel value, $Res Function(_ResultSubjectModel) _then) = __$ResultSubjectModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'subject_attempt_id') int subjectAttemptId, String name, int score,@JsonKey(name: 'max_score') int maxScore, List<ResultQuestionModel> questions
});




}
/// @nodoc
class __$ResultSubjectModelCopyWithImpl<$Res>
    implements _$ResultSubjectModelCopyWith<$Res> {
  __$ResultSubjectModelCopyWithImpl(this._self, this._then);

  final _ResultSubjectModel _self;
  final $Res Function(_ResultSubjectModel) _then;

/// Create a copy of ResultSubjectModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subjectAttemptId = null,Object? name = null,Object? score = null,Object? maxScore = null,Object? questions = null,}) {
  return _then(_ResultSubjectModel(
subjectAttemptId: null == subjectAttemptId ? _self.subjectAttemptId : subjectAttemptId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,maxScore: null == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as int,questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<ResultQuestionModel>,
  ));
}


}


/// @nodoc
mixin _$ResultQuestionModel {

@JsonKey(name: 'attempt_question_id') int get attemptQuestionId; int get sequence;@JsonKey(name: 'question_type') String get questionType;@JsonKey(name: 'score_awarded') int get scoreAwarded;@JsonKey(name: 'max_score') int get maxScore; bool get answered;
/// Create a copy of ResultQuestionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResultQuestionModelCopyWith<ResultQuestionModel> get copyWith => _$ResultQuestionModelCopyWithImpl<ResultQuestionModel>(this as ResultQuestionModel, _$identity);

  /// Serializes this ResultQuestionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultQuestionModel&&(identical(other.attemptQuestionId, attemptQuestionId) || other.attemptQuestionId == attemptQuestionId)&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.questionType, questionType) || other.questionType == questionType)&&(identical(other.scoreAwarded, scoreAwarded) || other.scoreAwarded == scoreAwarded)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&(identical(other.answered, answered) || other.answered == answered));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,attemptQuestionId,sequence,questionType,scoreAwarded,maxScore,answered);

@override
String toString() {
  return 'ResultQuestionModel(attemptQuestionId: $attemptQuestionId, sequence: $sequence, questionType: $questionType, scoreAwarded: $scoreAwarded, maxScore: $maxScore, answered: $answered)';
}


}

/// @nodoc
abstract mixin class $ResultQuestionModelCopyWith<$Res>  {
  factory $ResultQuestionModelCopyWith(ResultQuestionModel value, $Res Function(ResultQuestionModel) _then) = _$ResultQuestionModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'attempt_question_id') int attemptQuestionId, int sequence,@JsonKey(name: 'question_type') String questionType,@JsonKey(name: 'score_awarded') int scoreAwarded,@JsonKey(name: 'max_score') int maxScore, bool answered
});




}
/// @nodoc
class _$ResultQuestionModelCopyWithImpl<$Res>
    implements $ResultQuestionModelCopyWith<$Res> {
  _$ResultQuestionModelCopyWithImpl(this._self, this._then);

  final ResultQuestionModel _self;
  final $Res Function(ResultQuestionModel) _then;

/// Create a copy of ResultQuestionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? attemptQuestionId = null,Object? sequence = null,Object? questionType = null,Object? scoreAwarded = null,Object? maxScore = null,Object? answered = null,}) {
  return _then(_self.copyWith(
attemptQuestionId: null == attemptQuestionId ? _self.attemptQuestionId : attemptQuestionId // ignore: cast_nullable_to_non_nullable
as int,sequence: null == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int,questionType: null == questionType ? _self.questionType : questionType // ignore: cast_nullable_to_non_nullable
as String,scoreAwarded: null == scoreAwarded ? _self.scoreAwarded : scoreAwarded // ignore: cast_nullable_to_non_nullable
as int,maxScore: null == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as int,answered: null == answered ? _self.answered : answered // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ResultQuestionModel].
extension ResultQuestionModelPatterns on ResultQuestionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResultQuestionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResultQuestionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResultQuestionModel value)  $default,){
final _that = this;
switch (_that) {
case _ResultQuestionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResultQuestionModel value)?  $default,){
final _that = this;
switch (_that) {
case _ResultQuestionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'attempt_question_id')  int attemptQuestionId,  int sequence, @JsonKey(name: 'question_type')  String questionType, @JsonKey(name: 'score_awarded')  int scoreAwarded, @JsonKey(name: 'max_score')  int maxScore,  bool answered)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResultQuestionModel() when $default != null:
return $default(_that.attemptQuestionId,_that.sequence,_that.questionType,_that.scoreAwarded,_that.maxScore,_that.answered);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'attempt_question_id')  int attemptQuestionId,  int sequence, @JsonKey(name: 'question_type')  String questionType, @JsonKey(name: 'score_awarded')  int scoreAwarded, @JsonKey(name: 'max_score')  int maxScore,  bool answered)  $default,) {final _that = this;
switch (_that) {
case _ResultQuestionModel():
return $default(_that.attemptQuestionId,_that.sequence,_that.questionType,_that.scoreAwarded,_that.maxScore,_that.answered);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'attempt_question_id')  int attemptQuestionId,  int sequence, @JsonKey(name: 'question_type')  String questionType, @JsonKey(name: 'score_awarded')  int scoreAwarded, @JsonKey(name: 'max_score')  int maxScore,  bool answered)?  $default,) {final _that = this;
switch (_that) {
case _ResultQuestionModel() when $default != null:
return $default(_that.attemptQuestionId,_that.sequence,_that.questionType,_that.scoreAwarded,_that.maxScore,_that.answered);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResultQuestionModel implements ResultQuestionModel {
  const _ResultQuestionModel({@JsonKey(name: 'attempt_question_id') required this.attemptQuestionId, required this.sequence, @JsonKey(name: 'question_type') required this.questionType, @JsonKey(name: 'score_awarded') required this.scoreAwarded, @JsonKey(name: 'max_score') required this.maxScore, required this.answered});
  factory _ResultQuestionModel.fromJson(Map<String, dynamic> json) => _$ResultQuestionModelFromJson(json);

@override@JsonKey(name: 'attempt_question_id') final  int attemptQuestionId;
@override final  int sequence;
@override@JsonKey(name: 'question_type') final  String questionType;
@override@JsonKey(name: 'score_awarded') final  int scoreAwarded;
@override@JsonKey(name: 'max_score') final  int maxScore;
@override final  bool answered;

/// Create a copy of ResultQuestionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResultQuestionModelCopyWith<_ResultQuestionModel> get copyWith => __$ResultQuestionModelCopyWithImpl<_ResultQuestionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResultQuestionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResultQuestionModel&&(identical(other.attemptQuestionId, attemptQuestionId) || other.attemptQuestionId == attemptQuestionId)&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.questionType, questionType) || other.questionType == questionType)&&(identical(other.scoreAwarded, scoreAwarded) || other.scoreAwarded == scoreAwarded)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&(identical(other.answered, answered) || other.answered == answered));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,attemptQuestionId,sequence,questionType,scoreAwarded,maxScore,answered);

@override
String toString() {
  return 'ResultQuestionModel(attemptQuestionId: $attemptQuestionId, sequence: $sequence, questionType: $questionType, scoreAwarded: $scoreAwarded, maxScore: $maxScore, answered: $answered)';
}


}

/// @nodoc
abstract mixin class _$ResultQuestionModelCopyWith<$Res> implements $ResultQuestionModelCopyWith<$Res> {
  factory _$ResultQuestionModelCopyWith(_ResultQuestionModel value, $Res Function(_ResultQuestionModel) _then) = __$ResultQuestionModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'attempt_question_id') int attemptQuestionId, int sequence,@JsonKey(name: 'question_type') String questionType,@JsonKey(name: 'score_awarded') int scoreAwarded,@JsonKey(name: 'max_score') int maxScore, bool answered
});




}
/// @nodoc
class __$ResultQuestionModelCopyWithImpl<$Res>
    implements _$ResultQuestionModelCopyWith<$Res> {
  __$ResultQuestionModelCopyWithImpl(this._self, this._then);

  final _ResultQuestionModel _self;
  final $Res Function(_ResultQuestionModel) _then;

/// Create a copy of ResultQuestionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? attemptQuestionId = null,Object? sequence = null,Object? questionType = null,Object? scoreAwarded = null,Object? maxScore = null,Object? answered = null,}) {
  return _then(_ResultQuestionModel(
attemptQuestionId: null == attemptQuestionId ? _self.attemptQuestionId : attemptQuestionId // ignore: cast_nullable_to_non_nullable
as int,sequence: null == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int,questionType: null == questionType ? _self.questionType : questionType // ignore: cast_nullable_to_non_nullable
as String,scoreAwarded: null == scoreAwarded ? _self.scoreAwarded : scoreAwarded // ignore: cast_nullable_to_non_nullable
as int,maxScore: null == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as int,answered: null == answered ? _self.answered : answered // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

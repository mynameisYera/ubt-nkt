// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'solution_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SolutionQuestion {

@JsonKey(name: 'attempt_question_id') int get attemptQuestionId;@JsonKey(name: 'question_type') String get questionType;@JsonKey(name: 'question_html') String get questionHtml; SolutionContext? get context;@JsonKey(fromJson: _answerFromJson, toJson: _answerToJson) SolutionAnswer get answer;@JsonKey(name: 'explanation_html') String get explanationHtml;
/// Create a copy of SolutionQuestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SolutionQuestionCopyWith<SolutionQuestion> get copyWith => _$SolutionQuestionCopyWithImpl<SolutionQuestion>(this as SolutionQuestion, _$identity);

  /// Serializes this SolutionQuestion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SolutionQuestion&&(identical(other.attemptQuestionId, attemptQuestionId) || other.attemptQuestionId == attemptQuestionId)&&(identical(other.questionType, questionType) || other.questionType == questionType)&&(identical(other.questionHtml, questionHtml) || other.questionHtml == questionHtml)&&(identical(other.context, context) || other.context == context)&&(identical(other.answer, answer) || other.answer == answer)&&(identical(other.explanationHtml, explanationHtml) || other.explanationHtml == explanationHtml));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,attemptQuestionId,questionType,questionHtml,context,answer,explanationHtml);

@override
String toString() {
  return 'SolutionQuestion(attemptQuestionId: $attemptQuestionId, questionType: $questionType, questionHtml: $questionHtml, context: $context, answer: $answer, explanationHtml: $explanationHtml)';
}


}

/// @nodoc
abstract mixin class $SolutionQuestionCopyWith<$Res>  {
  factory $SolutionQuestionCopyWith(SolutionQuestion value, $Res Function(SolutionQuestion) _then) = _$SolutionQuestionCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'attempt_question_id') int attemptQuestionId,@JsonKey(name: 'question_type') String questionType,@JsonKey(name: 'question_html') String questionHtml, SolutionContext? context,@JsonKey(fromJson: _answerFromJson, toJson: _answerToJson) SolutionAnswer answer,@JsonKey(name: 'explanation_html') String explanationHtml
});


$SolutionContextCopyWith<$Res>? get context;$SolutionAnswerCopyWith<$Res> get answer;

}
/// @nodoc
class _$SolutionQuestionCopyWithImpl<$Res>
    implements $SolutionQuestionCopyWith<$Res> {
  _$SolutionQuestionCopyWithImpl(this._self, this._then);

  final SolutionQuestion _self;
  final $Res Function(SolutionQuestion) _then;

/// Create a copy of SolutionQuestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? attemptQuestionId = null,Object? questionType = null,Object? questionHtml = null,Object? context = freezed,Object? answer = null,Object? explanationHtml = null,}) {
  return _then(_self.copyWith(
attemptQuestionId: null == attemptQuestionId ? _self.attemptQuestionId : attemptQuestionId // ignore: cast_nullable_to_non_nullable
as int,questionType: null == questionType ? _self.questionType : questionType // ignore: cast_nullable_to_non_nullable
as String,questionHtml: null == questionHtml ? _self.questionHtml : questionHtml // ignore: cast_nullable_to_non_nullable
as String,context: freezed == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as SolutionContext?,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as SolutionAnswer,explanationHtml: null == explanationHtml ? _self.explanationHtml : explanationHtml // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of SolutionQuestion
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SolutionContextCopyWith<$Res>? get context {
    if (_self.context == null) {
    return null;
  }

  return $SolutionContextCopyWith<$Res>(_self.context!, (value) {
    return _then(_self.copyWith(context: value));
  });
}/// Create a copy of SolutionQuestion
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SolutionAnswerCopyWith<$Res> get answer {
  
  return $SolutionAnswerCopyWith<$Res>(_self.answer, (value) {
    return _then(_self.copyWith(answer: value));
  });
}
}


/// Adds pattern-matching-related methods to [SolutionQuestion].
extension SolutionQuestionPatterns on SolutionQuestion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SolutionQuestion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SolutionQuestion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SolutionQuestion value)  $default,){
final _that = this;
switch (_that) {
case _SolutionQuestion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SolutionQuestion value)?  $default,){
final _that = this;
switch (_that) {
case _SolutionQuestion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'attempt_question_id')  int attemptQuestionId, @JsonKey(name: 'question_type')  String questionType, @JsonKey(name: 'question_html')  String questionHtml,  SolutionContext? context, @JsonKey(fromJson: _answerFromJson, toJson: _answerToJson)  SolutionAnswer answer, @JsonKey(name: 'explanation_html')  String explanationHtml)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SolutionQuestion() when $default != null:
return $default(_that.attemptQuestionId,_that.questionType,_that.questionHtml,_that.context,_that.answer,_that.explanationHtml);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'attempt_question_id')  int attemptQuestionId, @JsonKey(name: 'question_type')  String questionType, @JsonKey(name: 'question_html')  String questionHtml,  SolutionContext? context, @JsonKey(fromJson: _answerFromJson, toJson: _answerToJson)  SolutionAnswer answer, @JsonKey(name: 'explanation_html')  String explanationHtml)  $default,) {final _that = this;
switch (_that) {
case _SolutionQuestion():
return $default(_that.attemptQuestionId,_that.questionType,_that.questionHtml,_that.context,_that.answer,_that.explanationHtml);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'attempt_question_id')  int attemptQuestionId, @JsonKey(name: 'question_type')  String questionType, @JsonKey(name: 'question_html')  String questionHtml,  SolutionContext? context, @JsonKey(fromJson: _answerFromJson, toJson: _answerToJson)  SolutionAnswer answer, @JsonKey(name: 'explanation_html')  String explanationHtml)?  $default,) {final _that = this;
switch (_that) {
case _SolutionQuestion() when $default != null:
return $default(_that.attemptQuestionId,_that.questionType,_that.questionHtml,_that.context,_that.answer,_that.explanationHtml);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SolutionQuestion implements SolutionQuestion {
  const _SolutionQuestion({@JsonKey(name: 'attempt_question_id') required this.attemptQuestionId, @JsonKey(name: 'question_type') required this.questionType, @JsonKey(name: 'question_html') required this.questionHtml, this.context, @JsonKey(fromJson: _answerFromJson, toJson: _answerToJson) required this.answer, @JsonKey(name: 'explanation_html') required this.explanationHtml});
  factory _SolutionQuestion.fromJson(Map<String, dynamic> json) => _$SolutionQuestionFromJson(json);

@override@JsonKey(name: 'attempt_question_id') final  int attemptQuestionId;
@override@JsonKey(name: 'question_type') final  String questionType;
@override@JsonKey(name: 'question_html') final  String questionHtml;
@override final  SolutionContext? context;
@override@JsonKey(fromJson: _answerFromJson, toJson: _answerToJson) final  SolutionAnswer answer;
@override@JsonKey(name: 'explanation_html') final  String explanationHtml;

/// Create a copy of SolutionQuestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SolutionQuestionCopyWith<_SolutionQuestion> get copyWith => __$SolutionQuestionCopyWithImpl<_SolutionQuestion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SolutionQuestionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SolutionQuestion&&(identical(other.attemptQuestionId, attemptQuestionId) || other.attemptQuestionId == attemptQuestionId)&&(identical(other.questionType, questionType) || other.questionType == questionType)&&(identical(other.questionHtml, questionHtml) || other.questionHtml == questionHtml)&&(identical(other.context, context) || other.context == context)&&(identical(other.answer, answer) || other.answer == answer)&&(identical(other.explanationHtml, explanationHtml) || other.explanationHtml == explanationHtml));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,attemptQuestionId,questionType,questionHtml,context,answer,explanationHtml);

@override
String toString() {
  return 'SolutionQuestion(attemptQuestionId: $attemptQuestionId, questionType: $questionType, questionHtml: $questionHtml, context: $context, answer: $answer, explanationHtml: $explanationHtml)';
}


}

/// @nodoc
abstract mixin class _$SolutionQuestionCopyWith<$Res> implements $SolutionQuestionCopyWith<$Res> {
  factory _$SolutionQuestionCopyWith(_SolutionQuestion value, $Res Function(_SolutionQuestion) _then) = __$SolutionQuestionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'attempt_question_id') int attemptQuestionId,@JsonKey(name: 'question_type') String questionType,@JsonKey(name: 'question_html') String questionHtml, SolutionContext? context,@JsonKey(fromJson: _answerFromJson, toJson: _answerToJson) SolutionAnswer answer,@JsonKey(name: 'explanation_html') String explanationHtml
});


@override $SolutionContextCopyWith<$Res>? get context;@override $SolutionAnswerCopyWith<$Res> get answer;

}
/// @nodoc
class __$SolutionQuestionCopyWithImpl<$Res>
    implements _$SolutionQuestionCopyWith<$Res> {
  __$SolutionQuestionCopyWithImpl(this._self, this._then);

  final _SolutionQuestion _self;
  final $Res Function(_SolutionQuestion) _then;

/// Create a copy of SolutionQuestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? attemptQuestionId = null,Object? questionType = null,Object? questionHtml = null,Object? context = freezed,Object? answer = null,Object? explanationHtml = null,}) {
  return _then(_SolutionQuestion(
attemptQuestionId: null == attemptQuestionId ? _self.attemptQuestionId : attemptQuestionId // ignore: cast_nullable_to_non_nullable
as int,questionType: null == questionType ? _self.questionType : questionType // ignore: cast_nullable_to_non_nullable
as String,questionHtml: null == questionHtml ? _self.questionHtml : questionHtml // ignore: cast_nullable_to_non_nullable
as String,context: freezed == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as SolutionContext?,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as SolutionAnswer,explanationHtml: null == explanationHtml ? _self.explanationHtml : explanationHtml // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of SolutionQuestion
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SolutionContextCopyWith<$Res>? get context {
    if (_self.context == null) {
    return null;
  }

  return $SolutionContextCopyWith<$Res>(_self.context!, (value) {
    return _then(_self.copyWith(context: value));
  });
}/// Create a copy of SolutionQuestion
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SolutionAnswerCopyWith<$Res> get answer {
  
  return $SolutionAnswerCopyWith<$Res>(_self.answer, (value) {
    return _then(_self.copyWith(answer: value));
  });
}
}


/// @nodoc
mixin _$SolutionContext {

 String get id; String get title;@JsonKey(name: 'body_html') String get bodyHtml;
/// Create a copy of SolutionContext
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SolutionContextCopyWith<SolutionContext> get copyWith => _$SolutionContextCopyWithImpl<SolutionContext>(this as SolutionContext, _$identity);

  /// Serializes this SolutionContext to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SolutionContext&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.bodyHtml, bodyHtml) || other.bodyHtml == bodyHtml));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,bodyHtml);

@override
String toString() {
  return 'SolutionContext(id: $id, title: $title, bodyHtml: $bodyHtml)';
}


}

/// @nodoc
abstract mixin class $SolutionContextCopyWith<$Res>  {
  factory $SolutionContextCopyWith(SolutionContext value, $Res Function(SolutionContext) _then) = _$SolutionContextCopyWithImpl;
@useResult
$Res call({
 String id, String title,@JsonKey(name: 'body_html') String bodyHtml
});




}
/// @nodoc
class _$SolutionContextCopyWithImpl<$Res>
    implements $SolutionContextCopyWith<$Res> {
  _$SolutionContextCopyWithImpl(this._self, this._then);

  final SolutionContext _self;
  final $Res Function(SolutionContext) _then;

/// Create a copy of SolutionContext
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? bodyHtml = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,bodyHtml: null == bodyHtml ? _self.bodyHtml : bodyHtml // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SolutionContext].
extension SolutionContextPatterns on SolutionContext {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SolutionContext value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SolutionContext() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SolutionContext value)  $default,){
final _that = this;
switch (_that) {
case _SolutionContext():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SolutionContext value)?  $default,){
final _that = this;
switch (_that) {
case _SolutionContext() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title, @JsonKey(name: 'body_html')  String bodyHtml)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SolutionContext() when $default != null:
return $default(_that.id,_that.title,_that.bodyHtml);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title, @JsonKey(name: 'body_html')  String bodyHtml)  $default,) {final _that = this;
switch (_that) {
case _SolutionContext():
return $default(_that.id,_that.title,_that.bodyHtml);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title, @JsonKey(name: 'body_html')  String bodyHtml)?  $default,) {final _that = this;
switch (_that) {
case _SolutionContext() when $default != null:
return $default(_that.id,_that.title,_that.bodyHtml);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SolutionContext implements SolutionContext {
  const _SolutionContext({required this.id, required this.title, @JsonKey(name: 'body_html') required this.bodyHtml});
  factory _SolutionContext.fromJson(Map<String, dynamic> json) => _$SolutionContextFromJson(json);

@override final  String id;
@override final  String title;
@override@JsonKey(name: 'body_html') final  String bodyHtml;

/// Create a copy of SolutionContext
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SolutionContextCopyWith<_SolutionContext> get copyWith => __$SolutionContextCopyWithImpl<_SolutionContext>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SolutionContextToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SolutionContext&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.bodyHtml, bodyHtml) || other.bodyHtml == bodyHtml));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,bodyHtml);

@override
String toString() {
  return 'SolutionContext(id: $id, title: $title, bodyHtml: $bodyHtml)';
}


}

/// @nodoc
abstract mixin class _$SolutionContextCopyWith<$Res> implements $SolutionContextCopyWith<$Res> {
  factory _$SolutionContextCopyWith(_SolutionContext value, $Res Function(_SolutionContext) _then) = __$SolutionContextCopyWithImpl;
@override @useResult
$Res call({
 String id, String title,@JsonKey(name: 'body_html') String bodyHtml
});




}
/// @nodoc
class __$SolutionContextCopyWithImpl<$Res>
    implements _$SolutionContextCopyWith<$Res> {
  __$SolutionContextCopyWithImpl(this._self, this._then);

  final _SolutionContext _self;
  final $Res Function(_SolutionContext) _then;

/// Create a copy of SolutionContext
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? bodyHtml = null,}) {
  return _then(_SolutionContext(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,bodyHtml: null == bodyHtml ? _self.bodyHtml : bodyHtml // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$SolutionAnswer {

 String get kind;
/// Create a copy of SolutionAnswer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SolutionAnswerCopyWith<SolutionAnswer> get copyWith => _$SolutionAnswerCopyWithImpl<SolutionAnswer>(this as SolutionAnswer, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SolutionAnswer&&(identical(other.kind, kind) || other.kind == kind));
}


@override
int get hashCode => Object.hash(runtimeType,kind);

@override
String toString() {
  return 'SolutionAnswer(kind: $kind)';
}


}

/// @nodoc
abstract mixin class $SolutionAnswerCopyWith<$Res>  {
  factory $SolutionAnswerCopyWith(SolutionAnswer value, $Res Function(SolutionAnswer) _then) = _$SolutionAnswerCopyWithImpl;
@useResult
$Res call({
 String kind
});




}
/// @nodoc
class _$SolutionAnswerCopyWithImpl<$Res>
    implements $SolutionAnswerCopyWith<$Res> {
  _$SolutionAnswerCopyWithImpl(this._self, this._then);

  final SolutionAnswer _self;
  final $Res Function(SolutionAnswer) _then;

/// Create a copy of SolutionAnswer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SolutionAnswer].
extension SolutionAnswerPatterns on SolutionAnswer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MatchingAnswer value)?  matching,TResult Function( MultipleAnswer value)?  multiple,TResult Function( SingleAnswer value)?  single,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MatchingAnswer() when matching != null:
return matching(_that);case MultipleAnswer() when multiple != null:
return multiple(_that);case SingleAnswer() when single != null:
return single(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MatchingAnswer value)  matching,required TResult Function( MultipleAnswer value)  multiple,required TResult Function( SingleAnswer value)  single,}){
final _that = this;
switch (_that) {
case MatchingAnswer():
return matching(_that);case MultipleAnswer():
return multiple(_that);case SingleAnswer():
return single(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MatchingAnswer value)?  matching,TResult? Function( MultipleAnswer value)?  multiple,TResult? Function( SingleAnswer value)?  single,}){
final _that = this;
switch (_that) {
case MatchingAnswer() when matching != null:
return matching(_that);case MultipleAnswer() when multiple != null:
return multiple(_that);case SingleAnswer() when single != null:
return single(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String kind,  List<MatchingRow> rows)?  matching,TResult Function( String kind, @JsonKey(name: 'correct_options')  List<CorrectOption> correctOptions)?  multiple,TResult Function( String kind, @JsonKey(name: 'correct_option')  CorrectOption correctOption)?  single,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MatchingAnswer() when matching != null:
return matching(_that.kind,_that.rows);case MultipleAnswer() when multiple != null:
return multiple(_that.kind,_that.correctOptions);case SingleAnswer() when single != null:
return single(_that.kind,_that.correctOption);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String kind,  List<MatchingRow> rows)  matching,required TResult Function( String kind, @JsonKey(name: 'correct_options')  List<CorrectOption> correctOptions)  multiple,required TResult Function( String kind, @JsonKey(name: 'correct_option')  CorrectOption correctOption)  single,}) {final _that = this;
switch (_that) {
case MatchingAnswer():
return matching(_that.kind,_that.rows);case MultipleAnswer():
return multiple(_that.kind,_that.correctOptions);case SingleAnswer():
return single(_that.kind,_that.correctOption);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String kind,  List<MatchingRow> rows)?  matching,TResult? Function( String kind, @JsonKey(name: 'correct_options')  List<CorrectOption> correctOptions)?  multiple,TResult? Function( String kind, @JsonKey(name: 'correct_option')  CorrectOption correctOption)?  single,}) {final _that = this;
switch (_that) {
case MatchingAnswer() when matching != null:
return matching(_that.kind,_that.rows);case MultipleAnswer() when multiple != null:
return multiple(_that.kind,_that.correctOptions);case SingleAnswer() when single != null:
return single(_that.kind,_that.correctOption);case _:
  return null;

}
}

}

/// @nodoc


class MatchingAnswer implements SolutionAnswer {
  const MatchingAnswer({required this.kind, required final  List<MatchingRow> rows}): _rows = rows;
  

@override final  String kind;
 final  List<MatchingRow> _rows;
 List<MatchingRow> get rows {
  if (_rows is EqualUnmodifiableListView) return _rows;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rows);
}


/// Create a copy of SolutionAnswer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchingAnswerCopyWith<MatchingAnswer> get copyWith => _$MatchingAnswerCopyWithImpl<MatchingAnswer>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchingAnswer&&(identical(other.kind, kind) || other.kind == kind)&&const DeepCollectionEquality().equals(other._rows, _rows));
}


@override
int get hashCode => Object.hash(runtimeType,kind,const DeepCollectionEquality().hash(_rows));

@override
String toString() {
  return 'SolutionAnswer.matching(kind: $kind, rows: $rows)';
}


}

/// @nodoc
abstract mixin class $MatchingAnswerCopyWith<$Res> implements $SolutionAnswerCopyWith<$Res> {
  factory $MatchingAnswerCopyWith(MatchingAnswer value, $Res Function(MatchingAnswer) _then) = _$MatchingAnswerCopyWithImpl;
@override @useResult
$Res call({
 String kind, List<MatchingRow> rows
});




}
/// @nodoc
class _$MatchingAnswerCopyWithImpl<$Res>
    implements $MatchingAnswerCopyWith<$Res> {
  _$MatchingAnswerCopyWithImpl(this._self, this._then);

  final MatchingAnswer _self;
  final $Res Function(MatchingAnswer) _then;

/// Create a copy of SolutionAnswer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? rows = null,}) {
  return _then(MatchingAnswer(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,rows: null == rows ? _self._rows : rows // ignore: cast_nullable_to_non_nullable
as List<MatchingRow>,
  ));
}


}

/// @nodoc


class MultipleAnswer implements SolutionAnswer {
  const MultipleAnswer({required this.kind, @JsonKey(name: 'correct_options') required final  List<CorrectOption> correctOptions}): _correctOptions = correctOptions;
  

@override final  String kind;
 final  List<CorrectOption> _correctOptions;
@JsonKey(name: 'correct_options') List<CorrectOption> get correctOptions {
  if (_correctOptions is EqualUnmodifiableListView) return _correctOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_correctOptions);
}


/// Create a copy of SolutionAnswer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MultipleAnswerCopyWith<MultipleAnswer> get copyWith => _$MultipleAnswerCopyWithImpl<MultipleAnswer>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MultipleAnswer&&(identical(other.kind, kind) || other.kind == kind)&&const DeepCollectionEquality().equals(other._correctOptions, _correctOptions));
}


@override
int get hashCode => Object.hash(runtimeType,kind,const DeepCollectionEquality().hash(_correctOptions));

@override
String toString() {
  return 'SolutionAnswer.multiple(kind: $kind, correctOptions: $correctOptions)';
}


}

/// @nodoc
abstract mixin class $MultipleAnswerCopyWith<$Res> implements $SolutionAnswerCopyWith<$Res> {
  factory $MultipleAnswerCopyWith(MultipleAnswer value, $Res Function(MultipleAnswer) _then) = _$MultipleAnswerCopyWithImpl;
@override @useResult
$Res call({
 String kind,@JsonKey(name: 'correct_options') List<CorrectOption> correctOptions
});




}
/// @nodoc
class _$MultipleAnswerCopyWithImpl<$Res>
    implements $MultipleAnswerCopyWith<$Res> {
  _$MultipleAnswerCopyWithImpl(this._self, this._then);

  final MultipleAnswer _self;
  final $Res Function(MultipleAnswer) _then;

/// Create a copy of SolutionAnswer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? correctOptions = null,}) {
  return _then(MultipleAnswer(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,correctOptions: null == correctOptions ? _self._correctOptions : correctOptions // ignore: cast_nullable_to_non_nullable
as List<CorrectOption>,
  ));
}


}

/// @nodoc


class SingleAnswer implements SolutionAnswer {
  const SingleAnswer({required this.kind, @JsonKey(name: 'correct_option') required this.correctOption});
  

@override final  String kind;
@JsonKey(name: 'correct_option') final  CorrectOption correctOption;

/// Create a copy of SolutionAnswer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SingleAnswerCopyWith<SingleAnswer> get copyWith => _$SingleAnswerCopyWithImpl<SingleAnswer>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SingleAnswer&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.correctOption, correctOption) || other.correctOption == correctOption));
}


@override
int get hashCode => Object.hash(runtimeType,kind,correctOption);

@override
String toString() {
  return 'SolutionAnswer.single(kind: $kind, correctOption: $correctOption)';
}


}

/// @nodoc
abstract mixin class $SingleAnswerCopyWith<$Res> implements $SolutionAnswerCopyWith<$Res> {
  factory $SingleAnswerCopyWith(SingleAnswer value, $Res Function(SingleAnswer) _then) = _$SingleAnswerCopyWithImpl;
@override @useResult
$Res call({
 String kind,@JsonKey(name: 'correct_option') CorrectOption correctOption
});


$CorrectOptionCopyWith<$Res> get correctOption;

}
/// @nodoc
class _$SingleAnswerCopyWithImpl<$Res>
    implements $SingleAnswerCopyWith<$Res> {
  _$SingleAnswerCopyWithImpl(this._self, this._then);

  final SingleAnswer _self;
  final $Res Function(SingleAnswer) _then;

/// Create a copy of SolutionAnswer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? correctOption = null,}) {
  return _then(SingleAnswer(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,correctOption: null == correctOption ? _self.correctOption : correctOption // ignore: cast_nullable_to_non_nullable
as CorrectOption,
  ));
}

/// Create a copy of SolutionAnswer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CorrectOptionCopyWith<$Res> get correctOption {
  
  return $CorrectOptionCopyWith<$Res>(_self.correctOption, (value) {
    return _then(_self.copyWith(correctOption: value));
  });
}
}


/// @nodoc
mixin _$MatchingRow {

@JsonKey(name: 'row_id') String get rowId;@JsonKey(name: 'row_prompt_html') String get rowPromptHtml;@JsonKey(name: 'option_id') String get optionId;@JsonKey(name: 'option_label_html') String get optionLabelHtml;
/// Create a copy of MatchingRow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchingRowCopyWith<MatchingRow> get copyWith => _$MatchingRowCopyWithImpl<MatchingRow>(this as MatchingRow, _$identity);

  /// Serializes this MatchingRow to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchingRow&&(identical(other.rowId, rowId) || other.rowId == rowId)&&(identical(other.rowPromptHtml, rowPromptHtml) || other.rowPromptHtml == rowPromptHtml)&&(identical(other.optionId, optionId) || other.optionId == optionId)&&(identical(other.optionLabelHtml, optionLabelHtml) || other.optionLabelHtml == optionLabelHtml));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rowId,rowPromptHtml,optionId,optionLabelHtml);

@override
String toString() {
  return 'MatchingRow(rowId: $rowId, rowPromptHtml: $rowPromptHtml, optionId: $optionId, optionLabelHtml: $optionLabelHtml)';
}


}

/// @nodoc
abstract mixin class $MatchingRowCopyWith<$Res>  {
  factory $MatchingRowCopyWith(MatchingRow value, $Res Function(MatchingRow) _then) = _$MatchingRowCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'row_id') String rowId,@JsonKey(name: 'row_prompt_html') String rowPromptHtml,@JsonKey(name: 'option_id') String optionId,@JsonKey(name: 'option_label_html') String optionLabelHtml
});




}
/// @nodoc
class _$MatchingRowCopyWithImpl<$Res>
    implements $MatchingRowCopyWith<$Res> {
  _$MatchingRowCopyWithImpl(this._self, this._then);

  final MatchingRow _self;
  final $Res Function(MatchingRow) _then;

/// Create a copy of MatchingRow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rowId = null,Object? rowPromptHtml = null,Object? optionId = null,Object? optionLabelHtml = null,}) {
  return _then(_self.copyWith(
rowId: null == rowId ? _self.rowId : rowId // ignore: cast_nullable_to_non_nullable
as String,rowPromptHtml: null == rowPromptHtml ? _self.rowPromptHtml : rowPromptHtml // ignore: cast_nullable_to_non_nullable
as String,optionId: null == optionId ? _self.optionId : optionId // ignore: cast_nullable_to_non_nullable
as String,optionLabelHtml: null == optionLabelHtml ? _self.optionLabelHtml : optionLabelHtml // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MatchingRow].
extension MatchingRowPatterns on MatchingRow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchingRow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchingRow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchingRow value)  $default,){
final _that = this;
switch (_that) {
case _MatchingRow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchingRow value)?  $default,){
final _that = this;
switch (_that) {
case _MatchingRow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'row_id')  String rowId, @JsonKey(name: 'row_prompt_html')  String rowPromptHtml, @JsonKey(name: 'option_id')  String optionId, @JsonKey(name: 'option_label_html')  String optionLabelHtml)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchingRow() when $default != null:
return $default(_that.rowId,_that.rowPromptHtml,_that.optionId,_that.optionLabelHtml);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'row_id')  String rowId, @JsonKey(name: 'row_prompt_html')  String rowPromptHtml, @JsonKey(name: 'option_id')  String optionId, @JsonKey(name: 'option_label_html')  String optionLabelHtml)  $default,) {final _that = this;
switch (_that) {
case _MatchingRow():
return $default(_that.rowId,_that.rowPromptHtml,_that.optionId,_that.optionLabelHtml);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'row_id')  String rowId, @JsonKey(name: 'row_prompt_html')  String rowPromptHtml, @JsonKey(name: 'option_id')  String optionId, @JsonKey(name: 'option_label_html')  String optionLabelHtml)?  $default,) {final _that = this;
switch (_that) {
case _MatchingRow() when $default != null:
return $default(_that.rowId,_that.rowPromptHtml,_that.optionId,_that.optionLabelHtml);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchingRow implements MatchingRow {
  const _MatchingRow({@JsonKey(name: 'row_id') required this.rowId, @JsonKey(name: 'row_prompt_html') required this.rowPromptHtml, @JsonKey(name: 'option_id') required this.optionId, @JsonKey(name: 'option_label_html') required this.optionLabelHtml});
  factory _MatchingRow.fromJson(Map<String, dynamic> json) => _$MatchingRowFromJson(json);

@override@JsonKey(name: 'row_id') final  String rowId;
@override@JsonKey(name: 'row_prompt_html') final  String rowPromptHtml;
@override@JsonKey(name: 'option_id') final  String optionId;
@override@JsonKey(name: 'option_label_html') final  String optionLabelHtml;

/// Create a copy of MatchingRow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchingRowCopyWith<_MatchingRow> get copyWith => __$MatchingRowCopyWithImpl<_MatchingRow>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchingRowToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchingRow&&(identical(other.rowId, rowId) || other.rowId == rowId)&&(identical(other.rowPromptHtml, rowPromptHtml) || other.rowPromptHtml == rowPromptHtml)&&(identical(other.optionId, optionId) || other.optionId == optionId)&&(identical(other.optionLabelHtml, optionLabelHtml) || other.optionLabelHtml == optionLabelHtml));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rowId,rowPromptHtml,optionId,optionLabelHtml);

@override
String toString() {
  return 'MatchingRow(rowId: $rowId, rowPromptHtml: $rowPromptHtml, optionId: $optionId, optionLabelHtml: $optionLabelHtml)';
}


}

/// @nodoc
abstract mixin class _$MatchingRowCopyWith<$Res> implements $MatchingRowCopyWith<$Res> {
  factory _$MatchingRowCopyWith(_MatchingRow value, $Res Function(_MatchingRow) _then) = __$MatchingRowCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'row_id') String rowId,@JsonKey(name: 'row_prompt_html') String rowPromptHtml,@JsonKey(name: 'option_id') String optionId,@JsonKey(name: 'option_label_html') String optionLabelHtml
});




}
/// @nodoc
class __$MatchingRowCopyWithImpl<$Res>
    implements _$MatchingRowCopyWith<$Res> {
  __$MatchingRowCopyWithImpl(this._self, this._then);

  final _MatchingRow _self;
  final $Res Function(_MatchingRow) _then;

/// Create a copy of MatchingRow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rowId = null,Object? rowPromptHtml = null,Object? optionId = null,Object? optionLabelHtml = null,}) {
  return _then(_MatchingRow(
rowId: null == rowId ? _self.rowId : rowId // ignore: cast_nullable_to_non_nullable
as String,rowPromptHtml: null == rowPromptHtml ? _self.rowPromptHtml : rowPromptHtml // ignore: cast_nullable_to_non_nullable
as String,optionId: null == optionId ? _self.optionId : optionId // ignore: cast_nullable_to_non_nullable
as String,optionLabelHtml: null == optionLabelHtml ? _self.optionLabelHtml : optionLabelHtml // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CorrectOption {

 String get id;@JsonKey(name: 'label_html') String get labelHtml;
/// Create a copy of CorrectOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CorrectOptionCopyWith<CorrectOption> get copyWith => _$CorrectOptionCopyWithImpl<CorrectOption>(this as CorrectOption, _$identity);

  /// Serializes this CorrectOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CorrectOption&&(identical(other.id, id) || other.id == id)&&(identical(other.labelHtml, labelHtml) || other.labelHtml == labelHtml));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,labelHtml);

@override
String toString() {
  return 'CorrectOption(id: $id, labelHtml: $labelHtml)';
}


}

/// @nodoc
abstract mixin class $CorrectOptionCopyWith<$Res>  {
  factory $CorrectOptionCopyWith(CorrectOption value, $Res Function(CorrectOption) _then) = _$CorrectOptionCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'label_html') String labelHtml
});




}
/// @nodoc
class _$CorrectOptionCopyWithImpl<$Res>
    implements $CorrectOptionCopyWith<$Res> {
  _$CorrectOptionCopyWithImpl(this._self, this._then);

  final CorrectOption _self;
  final $Res Function(CorrectOption) _then;

/// Create a copy of CorrectOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? labelHtml = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,labelHtml: null == labelHtml ? _self.labelHtml : labelHtml // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CorrectOption].
extension CorrectOptionPatterns on CorrectOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CorrectOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CorrectOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CorrectOption value)  $default,){
final _that = this;
switch (_that) {
case _CorrectOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CorrectOption value)?  $default,){
final _that = this;
switch (_that) {
case _CorrectOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'label_html')  String labelHtml)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CorrectOption() when $default != null:
return $default(_that.id,_that.labelHtml);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'label_html')  String labelHtml)  $default,) {final _that = this;
switch (_that) {
case _CorrectOption():
return $default(_that.id,_that.labelHtml);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'label_html')  String labelHtml)?  $default,) {final _that = this;
switch (_that) {
case _CorrectOption() when $default != null:
return $default(_that.id,_that.labelHtml);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CorrectOption implements CorrectOption {
  const _CorrectOption({required this.id, @JsonKey(name: 'label_html') required this.labelHtml});
  factory _CorrectOption.fromJson(Map<String, dynamic> json) => _$CorrectOptionFromJson(json);

@override final  String id;
@override@JsonKey(name: 'label_html') final  String labelHtml;

/// Create a copy of CorrectOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CorrectOptionCopyWith<_CorrectOption> get copyWith => __$CorrectOptionCopyWithImpl<_CorrectOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CorrectOptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CorrectOption&&(identical(other.id, id) || other.id == id)&&(identical(other.labelHtml, labelHtml) || other.labelHtml == labelHtml));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,labelHtml);

@override
String toString() {
  return 'CorrectOption(id: $id, labelHtml: $labelHtml)';
}


}

/// @nodoc
abstract mixin class _$CorrectOptionCopyWith<$Res> implements $CorrectOptionCopyWith<$Res> {
  factory _$CorrectOptionCopyWith(_CorrectOption value, $Res Function(_CorrectOption) _then) = __$CorrectOptionCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'label_html') String labelHtml
});




}
/// @nodoc
class __$CorrectOptionCopyWithImpl<$Res>
    implements _$CorrectOptionCopyWith<$Res> {
  __$CorrectOptionCopyWithImpl(this._self, this._then);

  final _CorrectOption _self;
  final $Res Function(_CorrectOption) _then;

/// Create a copy of CorrectOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? labelHtml = null,}) {
  return _then(_CorrectOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,labelHtml: null == labelHtml ? _self.labelHtml : labelHtml // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

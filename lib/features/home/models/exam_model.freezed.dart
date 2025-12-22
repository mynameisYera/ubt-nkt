// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exam_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExamModel {

 String get exam_type; int get time_limit_minutes; List<BlockSubject> get block1_subjects; List<Pair> get pairs; List<QuestionType> get question_types; List<String> get ordering_rules; List<String> get tools; int get quota;
/// Create a copy of ExamModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExamModelCopyWith<ExamModel> get copyWith => _$ExamModelCopyWithImpl<ExamModel>(this as ExamModel, _$identity);

  /// Serializes this ExamModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExamModel&&(identical(other.exam_type, exam_type) || other.exam_type == exam_type)&&(identical(other.time_limit_minutes, time_limit_minutes) || other.time_limit_minutes == time_limit_minutes)&&const DeepCollectionEquality().equals(other.block1_subjects, block1_subjects)&&const DeepCollectionEquality().equals(other.pairs, pairs)&&const DeepCollectionEquality().equals(other.question_types, question_types)&&const DeepCollectionEquality().equals(other.ordering_rules, ordering_rules)&&const DeepCollectionEquality().equals(other.tools, tools)&&(identical(other.quota, quota) || other.quota == quota));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,exam_type,time_limit_minutes,const DeepCollectionEquality().hash(block1_subjects),const DeepCollectionEquality().hash(pairs),const DeepCollectionEquality().hash(question_types),const DeepCollectionEquality().hash(ordering_rules),const DeepCollectionEquality().hash(tools),quota);

@override
String toString() {
  return 'ExamModel(exam_type: $exam_type, time_limit_minutes: $time_limit_minutes, block1_subjects: $block1_subjects, pairs: $pairs, question_types: $question_types, ordering_rules: $ordering_rules, tools: $tools, quota: $quota)';
}


}

/// @nodoc
abstract mixin class $ExamModelCopyWith<$Res>  {
  factory $ExamModelCopyWith(ExamModel value, $Res Function(ExamModel) _then) = _$ExamModelCopyWithImpl;
@useResult
$Res call({
 String exam_type, int time_limit_minutes, List<BlockSubject> block1_subjects, List<Pair> pairs, List<QuestionType> question_types, List<String> ordering_rules, List<String> tools, int quota
});




}
/// @nodoc
class _$ExamModelCopyWithImpl<$Res>
    implements $ExamModelCopyWith<$Res> {
  _$ExamModelCopyWithImpl(this._self, this._then);

  final ExamModel _self;
  final $Res Function(ExamModel) _then;

/// Create a copy of ExamModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? exam_type = null,Object? time_limit_minutes = null,Object? block1_subjects = null,Object? pairs = null,Object? question_types = null,Object? ordering_rules = null,Object? tools = null,Object? quota = null,}) {
  return _then(_self.copyWith(
exam_type: null == exam_type ? _self.exam_type : exam_type // ignore: cast_nullable_to_non_nullable
as String,time_limit_minutes: null == time_limit_minutes ? _self.time_limit_minutes : time_limit_minutes // ignore: cast_nullable_to_non_nullable
as int,block1_subjects: null == block1_subjects ? _self.block1_subjects : block1_subjects // ignore: cast_nullable_to_non_nullable
as List<BlockSubject>,pairs: null == pairs ? _self.pairs : pairs // ignore: cast_nullable_to_non_nullable
as List<Pair>,question_types: null == question_types ? _self.question_types : question_types // ignore: cast_nullable_to_non_nullable
as List<QuestionType>,ordering_rules: null == ordering_rules ? _self.ordering_rules : ordering_rules // ignore: cast_nullable_to_non_nullable
as List<String>,tools: null == tools ? _self.tools : tools // ignore: cast_nullable_to_non_nullable
as List<String>,quota: null == quota ? _self.quota : quota // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ExamModel].
extension ExamModelPatterns on ExamModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExamModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExamModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExamModel value)  $default,){
final _that = this;
switch (_that) {
case _ExamModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExamModel value)?  $default,){
final _that = this;
switch (_that) {
case _ExamModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String exam_type,  int time_limit_minutes,  List<BlockSubject> block1_subjects,  List<Pair> pairs,  List<QuestionType> question_types,  List<String> ordering_rules,  List<String> tools,  int quota)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExamModel() when $default != null:
return $default(_that.exam_type,_that.time_limit_minutes,_that.block1_subjects,_that.pairs,_that.question_types,_that.ordering_rules,_that.tools,_that.quota);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String exam_type,  int time_limit_minutes,  List<BlockSubject> block1_subjects,  List<Pair> pairs,  List<QuestionType> question_types,  List<String> ordering_rules,  List<String> tools,  int quota)  $default,) {final _that = this;
switch (_that) {
case _ExamModel():
return $default(_that.exam_type,_that.time_limit_minutes,_that.block1_subjects,_that.pairs,_that.question_types,_that.ordering_rules,_that.tools,_that.quota);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String exam_type,  int time_limit_minutes,  List<BlockSubject> block1_subjects,  List<Pair> pairs,  List<QuestionType> question_types,  List<String> ordering_rules,  List<String> tools,  int quota)?  $default,) {final _that = this;
switch (_that) {
case _ExamModel() when $default != null:
return $default(_that.exam_type,_that.time_limit_minutes,_that.block1_subjects,_that.pairs,_that.question_types,_that.ordering_rules,_that.tools,_that.quota);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExamModel implements ExamModel {
  const _ExamModel({required this.exam_type, required this.time_limit_minutes, required final  List<BlockSubject> block1_subjects, required final  List<Pair> pairs, required final  List<QuestionType> question_types, required final  List<String> ordering_rules, required final  List<String> tools, required this.quota}): _block1_subjects = block1_subjects,_pairs = pairs,_question_types = question_types,_ordering_rules = ordering_rules,_tools = tools;
  factory _ExamModel.fromJson(Map<String, dynamic> json) => _$ExamModelFromJson(json);

@override final  String exam_type;
@override final  int time_limit_minutes;
 final  List<BlockSubject> _block1_subjects;
@override List<BlockSubject> get block1_subjects {
  if (_block1_subjects is EqualUnmodifiableListView) return _block1_subjects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_block1_subjects);
}

 final  List<Pair> _pairs;
@override List<Pair> get pairs {
  if (_pairs is EqualUnmodifiableListView) return _pairs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pairs);
}

 final  List<QuestionType> _question_types;
@override List<QuestionType> get question_types {
  if (_question_types is EqualUnmodifiableListView) return _question_types;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_question_types);
}

 final  List<String> _ordering_rules;
@override List<String> get ordering_rules {
  if (_ordering_rules is EqualUnmodifiableListView) return _ordering_rules;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ordering_rules);
}

 final  List<String> _tools;
@override List<String> get tools {
  if (_tools is EqualUnmodifiableListView) return _tools;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tools);
}

@override final  int quota;

/// Create a copy of ExamModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExamModelCopyWith<_ExamModel> get copyWith => __$ExamModelCopyWithImpl<_ExamModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExamModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExamModel&&(identical(other.exam_type, exam_type) || other.exam_type == exam_type)&&(identical(other.time_limit_minutes, time_limit_minutes) || other.time_limit_minutes == time_limit_minutes)&&const DeepCollectionEquality().equals(other._block1_subjects, _block1_subjects)&&const DeepCollectionEquality().equals(other._pairs, _pairs)&&const DeepCollectionEquality().equals(other._question_types, _question_types)&&const DeepCollectionEquality().equals(other._ordering_rules, _ordering_rules)&&const DeepCollectionEquality().equals(other._tools, _tools)&&(identical(other.quota, quota) || other.quota == quota));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,exam_type,time_limit_minutes,const DeepCollectionEquality().hash(_block1_subjects),const DeepCollectionEquality().hash(_pairs),const DeepCollectionEquality().hash(_question_types),const DeepCollectionEquality().hash(_ordering_rules),const DeepCollectionEquality().hash(_tools),quota);

@override
String toString() {
  return 'ExamModel(exam_type: $exam_type, time_limit_minutes: $time_limit_minutes, block1_subjects: $block1_subjects, pairs: $pairs, question_types: $question_types, ordering_rules: $ordering_rules, tools: $tools, quota: $quota)';
}


}

/// @nodoc
abstract mixin class _$ExamModelCopyWith<$Res> implements $ExamModelCopyWith<$Res> {
  factory _$ExamModelCopyWith(_ExamModel value, $Res Function(_ExamModel) _then) = __$ExamModelCopyWithImpl;
@override @useResult
$Res call({
 String exam_type, int time_limit_minutes, List<BlockSubject> block1_subjects, List<Pair> pairs, List<QuestionType> question_types, List<String> ordering_rules, List<String> tools, int quota
});




}
/// @nodoc
class __$ExamModelCopyWithImpl<$Res>
    implements _$ExamModelCopyWith<$Res> {
  __$ExamModelCopyWithImpl(this._self, this._then);

  final _ExamModel _self;
  final $Res Function(_ExamModel) _then;

/// Create a copy of ExamModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? exam_type = null,Object? time_limit_minutes = null,Object? block1_subjects = null,Object? pairs = null,Object? question_types = null,Object? ordering_rules = null,Object? tools = null,Object? quota = null,}) {
  return _then(_ExamModel(
exam_type: null == exam_type ? _self.exam_type : exam_type // ignore: cast_nullable_to_non_nullable
as String,time_limit_minutes: null == time_limit_minutes ? _self.time_limit_minutes : time_limit_minutes // ignore: cast_nullable_to_non_nullable
as int,block1_subjects: null == block1_subjects ? _self._block1_subjects : block1_subjects // ignore: cast_nullable_to_non_nullable
as List<BlockSubject>,pairs: null == pairs ? _self._pairs : pairs // ignore: cast_nullable_to_non_nullable
as List<Pair>,question_types: null == question_types ? _self._question_types : question_types // ignore: cast_nullable_to_non_nullable
as List<QuestionType>,ordering_rules: null == ordering_rules ? _self._ordering_rules : ordering_rules // ignore: cast_nullable_to_non_nullable
as List<String>,tools: null == tools ? _self._tools : tools // ignore: cast_nullable_to_non_nullable
as List<String>,quota: null == quota ? _self.quota : quota // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$BlockSubject {

 String get code; String get name; int get question_count;
/// Create a copy of BlockSubject
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlockSubjectCopyWith<BlockSubject> get copyWith => _$BlockSubjectCopyWithImpl<BlockSubject>(this as BlockSubject, _$identity);

  /// Serializes this BlockSubject to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlockSubject&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.question_count, question_count) || other.question_count == question_count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name,question_count);

@override
String toString() {
  return 'BlockSubject(code: $code, name: $name, question_count: $question_count)';
}


}

/// @nodoc
abstract mixin class $BlockSubjectCopyWith<$Res>  {
  factory $BlockSubjectCopyWith(BlockSubject value, $Res Function(BlockSubject) _then) = _$BlockSubjectCopyWithImpl;
@useResult
$Res call({
 String code, String name, int question_count
});




}
/// @nodoc
class _$BlockSubjectCopyWithImpl<$Res>
    implements $BlockSubjectCopyWith<$Res> {
  _$BlockSubjectCopyWithImpl(this._self, this._then);

  final BlockSubject _self;
  final $Res Function(BlockSubject) _then;

/// Create a copy of BlockSubject
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? name = null,Object? question_count = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,question_count: null == question_count ? _self.question_count : question_count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BlockSubject].
extension BlockSubjectPatterns on BlockSubject {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BlockSubject value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BlockSubject() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BlockSubject value)  $default,){
final _that = this;
switch (_that) {
case _BlockSubject():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BlockSubject value)?  $default,){
final _that = this;
switch (_that) {
case _BlockSubject() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String name,  int question_count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BlockSubject() when $default != null:
return $default(_that.code,_that.name,_that.question_count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String name,  int question_count)  $default,) {final _that = this;
switch (_that) {
case _BlockSubject():
return $default(_that.code,_that.name,_that.question_count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String name,  int question_count)?  $default,) {final _that = this;
switch (_that) {
case _BlockSubject() when $default != null:
return $default(_that.code,_that.name,_that.question_count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BlockSubject implements BlockSubject {
  const _BlockSubject({required this.code, required this.name, required this.question_count});
  factory _BlockSubject.fromJson(Map<String, dynamic> json) => _$BlockSubjectFromJson(json);

@override final  String code;
@override final  String name;
@override final  int question_count;

/// Create a copy of BlockSubject
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BlockSubjectCopyWith<_BlockSubject> get copyWith => __$BlockSubjectCopyWithImpl<_BlockSubject>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BlockSubjectToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BlockSubject&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.question_count, question_count) || other.question_count == question_count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name,question_count);

@override
String toString() {
  return 'BlockSubject(code: $code, name: $name, question_count: $question_count)';
}


}

/// @nodoc
abstract mixin class _$BlockSubjectCopyWith<$Res> implements $BlockSubjectCopyWith<$Res> {
  factory _$BlockSubjectCopyWith(_BlockSubject value, $Res Function(_BlockSubject) _then) = __$BlockSubjectCopyWithImpl;
@override @useResult
$Res call({
 String code, String name, int question_count
});




}
/// @nodoc
class __$BlockSubjectCopyWithImpl<$Res>
    implements _$BlockSubjectCopyWith<$Res> {
  __$BlockSubjectCopyWithImpl(this._self, this._then);

  final _BlockSubject _self;
  final $Res Function(_BlockSubject) _then;

/// Create a copy of BlockSubject
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? name = null,Object? question_count = null,}) {
  return _then(_BlockSubject(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,question_count: null == question_count ? _self.question_count : question_count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Pair {

 int get id; String get code; String get label; bool get is_active; Subject get first_subject; Subject get second_subject;
/// Create a copy of Pair
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PairCopyWith<Pair> get copyWith => _$PairCopyWithImpl<Pair>(this as Pair, _$identity);

  /// Serializes this Pair to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Pair&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.label, label) || other.label == label)&&(identical(other.is_active, is_active) || other.is_active == is_active)&&(identical(other.first_subject, first_subject) || other.first_subject == first_subject)&&(identical(other.second_subject, second_subject) || other.second_subject == second_subject));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,label,is_active,first_subject,second_subject);

@override
String toString() {
  return 'Pair(id: $id, code: $code, label: $label, is_active: $is_active, first_subject: $first_subject, second_subject: $second_subject)';
}


}

/// @nodoc
abstract mixin class $PairCopyWith<$Res>  {
  factory $PairCopyWith(Pair value, $Res Function(Pair) _then) = _$PairCopyWithImpl;
@useResult
$Res call({
 int id, String code, String label, bool is_active, Subject first_subject, Subject second_subject
});


$SubjectCopyWith<$Res> get first_subject;$SubjectCopyWith<$Res> get second_subject;

}
/// @nodoc
class _$PairCopyWithImpl<$Res>
    implements $PairCopyWith<$Res> {
  _$PairCopyWithImpl(this._self, this._then);

  final Pair _self;
  final $Res Function(Pair) _then;

/// Create a copy of Pair
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? label = null,Object? is_active = null,Object? first_subject = null,Object? second_subject = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,is_active: null == is_active ? _self.is_active : is_active // ignore: cast_nullable_to_non_nullable
as bool,first_subject: null == first_subject ? _self.first_subject : first_subject // ignore: cast_nullable_to_non_nullable
as Subject,second_subject: null == second_subject ? _self.second_subject : second_subject // ignore: cast_nullable_to_non_nullable
as Subject,
  ));
}
/// Create a copy of Pair
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubjectCopyWith<$Res> get first_subject {
  
  return $SubjectCopyWith<$Res>(_self.first_subject, (value) {
    return _then(_self.copyWith(first_subject: value));
  });
}/// Create a copy of Pair
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubjectCopyWith<$Res> get second_subject {
  
  return $SubjectCopyWith<$Res>(_self.second_subject, (value) {
    return _then(_self.copyWith(second_subject: value));
  });
}
}


/// Adds pattern-matching-related methods to [Pair].
extension PairPatterns on Pair {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Pair value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Pair() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Pair value)  $default,){
final _that = this;
switch (_that) {
case _Pair():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Pair value)?  $default,){
final _that = this;
switch (_that) {
case _Pair() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String code,  String label,  bool is_active,  Subject first_subject,  Subject second_subject)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Pair() when $default != null:
return $default(_that.id,_that.code,_that.label,_that.is_active,_that.first_subject,_that.second_subject);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String code,  String label,  bool is_active,  Subject first_subject,  Subject second_subject)  $default,) {final _that = this;
switch (_that) {
case _Pair():
return $default(_that.id,_that.code,_that.label,_that.is_active,_that.first_subject,_that.second_subject);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String code,  String label,  bool is_active,  Subject first_subject,  Subject second_subject)?  $default,) {final _that = this;
switch (_that) {
case _Pair() when $default != null:
return $default(_that.id,_that.code,_that.label,_that.is_active,_that.first_subject,_that.second_subject);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Pair implements Pair {
  const _Pair({required this.id, required this.code, required this.label, required this.is_active, required this.first_subject, required this.second_subject});
  factory _Pair.fromJson(Map<String, dynamic> json) => _$PairFromJson(json);

@override final  int id;
@override final  String code;
@override final  String label;
@override final  bool is_active;
@override final  Subject first_subject;
@override final  Subject second_subject;

/// Create a copy of Pair
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PairCopyWith<_Pair> get copyWith => __$PairCopyWithImpl<_Pair>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PairToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Pair&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.label, label) || other.label == label)&&(identical(other.is_active, is_active) || other.is_active == is_active)&&(identical(other.first_subject, first_subject) || other.first_subject == first_subject)&&(identical(other.second_subject, second_subject) || other.second_subject == second_subject));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,label,is_active,first_subject,second_subject);

@override
String toString() {
  return 'Pair(id: $id, code: $code, label: $label, is_active: $is_active, first_subject: $first_subject, second_subject: $second_subject)';
}


}

/// @nodoc
abstract mixin class _$PairCopyWith<$Res> implements $PairCopyWith<$Res> {
  factory _$PairCopyWith(_Pair value, $Res Function(_Pair) _then) = __$PairCopyWithImpl;
@override @useResult
$Res call({
 int id, String code, String label, bool is_active, Subject first_subject, Subject second_subject
});


@override $SubjectCopyWith<$Res> get first_subject;@override $SubjectCopyWith<$Res> get second_subject;

}
/// @nodoc
class __$PairCopyWithImpl<$Res>
    implements _$PairCopyWith<$Res> {
  __$PairCopyWithImpl(this._self, this._then);

  final _Pair _self;
  final $Res Function(_Pair) _then;

/// Create a copy of Pair
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? label = null,Object? is_active = null,Object? first_subject = null,Object? second_subject = null,}) {
  return _then(_Pair(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,is_active: null == is_active ? _self.is_active : is_active // ignore: cast_nullable_to_non_nullable
as bool,first_subject: null == first_subject ? _self.first_subject : first_subject // ignore: cast_nullable_to_non_nullable
as Subject,second_subject: null == second_subject ? _self.second_subject : second_subject // ignore: cast_nullable_to_non_nullable
as Subject,
  ));
}

/// Create a copy of Pair
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubjectCopyWith<$Res> get first_subject {
  
  return $SubjectCopyWith<$Res>(_self.first_subject, (value) {
    return _then(_self.copyWith(first_subject: value));
  });
}/// Create a copy of Pair
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubjectCopyWith<$Res> get second_subject {
  
  return $SubjectCopyWith<$Res>(_self.second_subject, (value) {
    return _then(_self.copyWith(second_subject: value));
  });
}
}


/// @nodoc
mixin _$Subject {

 int get id; String get code; String get name; String get bucket; int get question_quota; bool get is_active;
/// Create a copy of Subject
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubjectCopyWith<Subject> get copyWith => _$SubjectCopyWithImpl<Subject>(this as Subject, _$identity);

  /// Serializes this Subject to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Subject&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.bucket, bucket) || other.bucket == bucket)&&(identical(other.question_quota, question_quota) || other.question_quota == question_quota)&&(identical(other.is_active, is_active) || other.is_active == is_active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,name,bucket,question_quota,is_active);

@override
String toString() {
  return 'Subject(id: $id, code: $code, name: $name, bucket: $bucket, question_quota: $question_quota, is_active: $is_active)';
}


}

/// @nodoc
abstract mixin class $SubjectCopyWith<$Res>  {
  factory $SubjectCopyWith(Subject value, $Res Function(Subject) _then) = _$SubjectCopyWithImpl;
@useResult
$Res call({
 int id, String code, String name, String bucket, int question_quota, bool is_active
});




}
/// @nodoc
class _$SubjectCopyWithImpl<$Res>
    implements $SubjectCopyWith<$Res> {
  _$SubjectCopyWithImpl(this._self, this._then);

  final Subject _self;
  final $Res Function(Subject) _then;

/// Create a copy of Subject
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? name = null,Object? bucket = null,Object? question_quota = null,Object? is_active = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,bucket: null == bucket ? _self.bucket : bucket // ignore: cast_nullable_to_non_nullable
as String,question_quota: null == question_quota ? _self.question_quota : question_quota // ignore: cast_nullable_to_non_nullable
as int,is_active: null == is_active ? _self.is_active : is_active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Subject].
extension SubjectPatterns on Subject {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Subject value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Subject() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Subject value)  $default,){
final _that = this;
switch (_that) {
case _Subject():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Subject value)?  $default,){
final _that = this;
switch (_that) {
case _Subject() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String code,  String name,  String bucket,  int question_quota,  bool is_active)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Subject() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.bucket,_that.question_quota,_that.is_active);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String code,  String name,  String bucket,  int question_quota,  bool is_active)  $default,) {final _that = this;
switch (_that) {
case _Subject():
return $default(_that.id,_that.code,_that.name,_that.bucket,_that.question_quota,_that.is_active);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String code,  String name,  String bucket,  int question_quota,  bool is_active)?  $default,) {final _that = this;
switch (_that) {
case _Subject() when $default != null:
return $default(_that.id,_that.code,_that.name,_that.bucket,_that.question_quota,_that.is_active);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Subject implements Subject {
  const _Subject({required this.id, required this.code, required this.name, required this.bucket, required this.question_quota, required this.is_active});
  factory _Subject.fromJson(Map<String, dynamic> json) => _$SubjectFromJson(json);

@override final  int id;
@override final  String code;
@override final  String name;
@override final  String bucket;
@override final  int question_quota;
@override final  bool is_active;

/// Create a copy of Subject
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubjectCopyWith<_Subject> get copyWith => __$SubjectCopyWithImpl<_Subject>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubjectToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Subject&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.bucket, bucket) || other.bucket == bucket)&&(identical(other.question_quota, question_quota) || other.question_quota == question_quota)&&(identical(other.is_active, is_active) || other.is_active == is_active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,name,bucket,question_quota,is_active);

@override
String toString() {
  return 'Subject(id: $id, code: $code, name: $name, bucket: $bucket, question_quota: $question_quota, is_active: $is_active)';
}


}

/// @nodoc
abstract mixin class _$SubjectCopyWith<$Res> implements $SubjectCopyWith<$Res> {
  factory _$SubjectCopyWith(_Subject value, $Res Function(_Subject) _then) = __$SubjectCopyWithImpl;
@override @useResult
$Res call({
 int id, String code, String name, String bucket, int question_quota, bool is_active
});




}
/// @nodoc
class __$SubjectCopyWithImpl<$Res>
    implements _$SubjectCopyWith<$Res> {
  __$SubjectCopyWithImpl(this._self, this._then);

  final _Subject _self;
  final $Res Function(_Subject) _then;

/// Create a copy of Subject
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? name = null,Object? bucket = null,Object? question_quota = null,Object? is_active = null,}) {
  return _then(_Subject(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,bucket: null == bucket ? _self.bucket : bucket // ignore: cast_nullable_to_non_nullable
as String,question_quota: null == question_quota ? _self.question_quota : question_quota // ignore: cast_nullable_to_non_nullable
as int,is_active: null == is_active ? _self.is_active : is_active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$QuestionType {

 String get label; String get scoring;
/// Create a copy of QuestionType
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionTypeCopyWith<QuestionType> get copyWith => _$QuestionTypeCopyWithImpl<QuestionType>(this as QuestionType, _$identity);

  /// Serializes this QuestionType to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionType&&(identical(other.label, label) || other.label == label)&&(identical(other.scoring, scoring) || other.scoring == scoring));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,scoring);

@override
String toString() {
  return 'QuestionType(label: $label, scoring: $scoring)';
}


}

/// @nodoc
abstract mixin class $QuestionTypeCopyWith<$Res>  {
  factory $QuestionTypeCopyWith(QuestionType value, $Res Function(QuestionType) _then) = _$QuestionTypeCopyWithImpl;
@useResult
$Res call({
 String label, String scoring
});




}
/// @nodoc
class _$QuestionTypeCopyWithImpl<$Res>
    implements $QuestionTypeCopyWith<$Res> {
  _$QuestionTypeCopyWithImpl(this._self, this._then);

  final QuestionType _self;
  final $Res Function(QuestionType) _then;

/// Create a copy of QuestionType
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? scoring = null,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,scoring: null == scoring ? _self.scoring : scoring // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [QuestionType].
extension QuestionTypePatterns on QuestionType {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuestionType value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuestionType() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuestionType value)  $default,){
final _that = this;
switch (_that) {
case _QuestionType():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuestionType value)?  $default,){
final _that = this;
switch (_that) {
case _QuestionType() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  String scoring)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuestionType() when $default != null:
return $default(_that.label,_that.scoring);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  String scoring)  $default,) {final _that = this;
switch (_that) {
case _QuestionType():
return $default(_that.label,_that.scoring);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  String scoring)?  $default,) {final _that = this;
switch (_that) {
case _QuestionType() when $default != null:
return $default(_that.label,_that.scoring);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuestionType implements QuestionType {
  const _QuestionType({required this.label, required this.scoring});
  factory _QuestionType.fromJson(Map<String, dynamic> json) => _$QuestionTypeFromJson(json);

@override final  String label;
@override final  String scoring;

/// Create a copy of QuestionType
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestionTypeCopyWith<_QuestionType> get copyWith => __$QuestionTypeCopyWithImpl<_QuestionType>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuestionTypeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuestionType&&(identical(other.label, label) || other.label == label)&&(identical(other.scoring, scoring) || other.scoring == scoring));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,scoring);

@override
String toString() {
  return 'QuestionType(label: $label, scoring: $scoring)';
}


}

/// @nodoc
abstract mixin class _$QuestionTypeCopyWith<$Res> implements $QuestionTypeCopyWith<$Res> {
  factory _$QuestionTypeCopyWith(_QuestionType value, $Res Function(_QuestionType) _then) = __$QuestionTypeCopyWithImpl;
@override @useResult
$Res call({
 String label, String scoring
});




}
/// @nodoc
class __$QuestionTypeCopyWithImpl<$Res>
    implements _$QuestionTypeCopyWith<$Res> {
  __$QuestionTypeCopyWithImpl(this._self, this._then);

  final _QuestionType _self;
  final $Res Function(_QuestionType) _then;

/// Create a copy of QuestionType
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? scoring = null,}) {
  return _then(_QuestionType(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,scoring: null == scoring ? _self.scoring : scoring // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

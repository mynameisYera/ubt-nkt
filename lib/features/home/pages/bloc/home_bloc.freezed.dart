// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent()';
}


}

/// @nodoc
class $HomeEventCopyWith<$Res>  {
$HomeEventCopyWith(HomeEvent _, $Res Function(HomeEvent) __);
}


/// Adds pattern-matching-related methods to [HomeEvent].
extension HomeEventPatterns on HomeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetPairs value)?  getPairs,TResult Function( _StartExam value)?  startExam,TResult Function( _SetExamAttempt value)?  setExamAttempt,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetPairs() when getPairs != null:
return getPairs(_that);case _StartExam() when startExam != null:
return startExam(_that);case _SetExamAttempt() when setExamAttempt != null:
return setExamAttempt(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetPairs value)  getPairs,required TResult Function( _StartExam value)  startExam,required TResult Function( _SetExamAttempt value)  setExamAttempt,}){
final _that = this;
switch (_that) {
case _GetPairs():
return getPairs(_that);case _StartExam():
return startExam(_that);case _SetExamAttempt():
return setExamAttempt(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetPairs value)?  getPairs,TResult? Function( _StartExam value)?  startExam,TResult? Function( _SetExamAttempt value)?  setExamAttempt,}){
final _that = this;
switch (_that) {
case _GetPairs() when getPairs != null:
return getPairs(_that);case _StartExam() when startExam != null:
return startExam(_that);case _SetExamAttempt() when setExamAttempt != null:
return setExamAttempt(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getPairs,TResult Function( int id)?  startExam,TResult Function( ExamAttempt examAttempt)?  setExamAttempt,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetPairs() when getPairs != null:
return getPairs();case _StartExam() when startExam != null:
return startExam(_that.id);case _SetExamAttempt() when setExamAttempt != null:
return setExamAttempt(_that.examAttempt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getPairs,required TResult Function( int id)  startExam,required TResult Function( ExamAttempt examAttempt)  setExamAttempt,}) {final _that = this;
switch (_that) {
case _GetPairs():
return getPairs();case _StartExam():
return startExam(_that.id);case _SetExamAttempt():
return setExamAttempt(_that.examAttempt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getPairs,TResult? Function( int id)?  startExam,TResult? Function( ExamAttempt examAttempt)?  setExamAttempt,}) {final _that = this;
switch (_that) {
case _GetPairs() when getPairs != null:
return getPairs();case _StartExam() when startExam != null:
return startExam(_that.id);case _SetExamAttempt() when setExamAttempt != null:
return setExamAttempt(_that.examAttempt);case _:
  return null;

}
}

}

/// @nodoc


class _GetPairs implements HomeEvent {
  const _GetPairs();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetPairs);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.getPairs()';
}


}




/// @nodoc


class _StartExam implements HomeEvent {
  const _StartExam({required this.id});
  

 final  int id;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartExamCopyWith<_StartExam> get copyWith => __$StartExamCopyWithImpl<_StartExam>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartExam&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'HomeEvent.startExam(id: $id)';
}


}

/// @nodoc
abstract mixin class _$StartExamCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$StartExamCopyWith(_StartExam value, $Res Function(_StartExam) _then) = __$StartExamCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class __$StartExamCopyWithImpl<$Res>
    implements _$StartExamCopyWith<$Res> {
  __$StartExamCopyWithImpl(this._self, this._then);

  final _StartExam _self;
  final $Res Function(_StartExam) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_StartExam(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _SetExamAttempt implements HomeEvent {
  const _SetExamAttempt({required this.examAttempt});
  

 final  ExamAttempt examAttempt;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetExamAttemptCopyWith<_SetExamAttempt> get copyWith => __$SetExamAttemptCopyWithImpl<_SetExamAttempt>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetExamAttempt&&(identical(other.examAttempt, examAttempt) || other.examAttempt == examAttempt));
}


@override
int get hashCode => Object.hash(runtimeType,examAttempt);

@override
String toString() {
  return 'HomeEvent.setExamAttempt(examAttempt: $examAttempt)';
}


}

/// @nodoc
abstract mixin class _$SetExamAttemptCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$SetExamAttemptCopyWith(_SetExamAttempt value, $Res Function(_SetExamAttempt) _then) = __$SetExamAttemptCopyWithImpl;
@useResult
$Res call({
 ExamAttempt examAttempt
});


$ExamAttemptCopyWith<$Res> get examAttempt;

}
/// @nodoc
class __$SetExamAttemptCopyWithImpl<$Res>
    implements _$SetExamAttemptCopyWith<$Res> {
  __$SetExamAttemptCopyWithImpl(this._self, this._then);

  final _SetExamAttempt _self;
  final $Res Function(_SetExamAttempt) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? examAttempt = null,}) {
  return _then(_SetExamAttempt(
examAttempt: null == examAttempt ? _self.examAttempt : examAttempt // ignore: cast_nullable_to_non_nullable
as ExamAttempt,
  ));
}

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExamAttemptCopyWith<$Res> get examAttempt {
  
  return $ExamAttemptCopyWith<$Res>(_self.examAttempt, (value) {
    return _then(_self.copyWith(examAttempt: value));
  });
}
}

/// @nodoc
mixin _$HomeState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState()';
}


}

/// @nodoc
class $HomeStateCopyWith<$Res>  {
$HomeStateCopyWith(HomeState _, $Res Function(HomeState) __);
}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _LoadingFailure value)?  loadingFailure,TResult Function( _Loaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _LoadingFailure() when loadingFailure != null:
return loadingFailure(_that);case _Loaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _LoadingFailure value)  loadingFailure,required TResult Function( _Loaded value)  loaded,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _LoadingFailure():
return loadingFailure(_that);case _Loaded():
return loaded(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _LoadingFailure value)?  loadingFailure,TResult? Function( _Loaded value)?  loaded,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _LoadingFailure() when loadingFailure != null:
return loadingFailure(_that);case _Loaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String message)?  loadingFailure,TResult Function( HomeViewModel examModel)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _LoadingFailure() when loadingFailure != null:
return loadingFailure(_that.message);case _Loaded() when loaded != null:
return loaded(_that.examModel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String message)  loadingFailure,required TResult Function( HomeViewModel examModel)  loaded,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _LoadingFailure():
return loadingFailure(_that.message);case _Loaded():
return loaded(_that.examModel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String message)?  loadingFailure,TResult? Function( HomeViewModel examModel)?  loaded,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _LoadingFailure() when loadingFailure != null:
return loadingFailure(_that.message);case _Loaded() when loaded != null:
return loaded(_that.examModel);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements HomeState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState.initial()';
}


}




/// @nodoc


class _Loading implements HomeState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState.loading()';
}


}




/// @nodoc


class _LoadingFailure implements HomeState {
  const _LoadingFailure({required this.message});
  

 final  String message;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingFailureCopyWith<_LoadingFailure> get copyWith => __$LoadingFailureCopyWithImpl<_LoadingFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'HomeState.loadingFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$LoadingFailureCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$LoadingFailureCopyWith(_LoadingFailure value, $Res Function(_LoadingFailure) _then) = __$LoadingFailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$LoadingFailureCopyWithImpl<$Res>
    implements _$LoadingFailureCopyWith<$Res> {
  __$LoadingFailureCopyWithImpl(this._self, this._then);

  final _LoadingFailure _self;
  final $Res Function(_LoadingFailure) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_LoadingFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Loaded implements HomeState {
  const _Loaded({required this.examModel});
  

 final  HomeViewModel examModel;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&(identical(other.examModel, examModel) || other.examModel == examModel));
}


@override
int get hashCode => Object.hash(runtimeType,examModel);

@override
String toString() {
  return 'HomeState.loaded(examModel: $examModel)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 HomeViewModel examModel
});


$HomeViewModelCopyWith<$Res> get examModel;

}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? examModel = null,}) {
  return _then(_Loaded(
examModel: null == examModel ? _self.examModel : examModel // ignore: cast_nullable_to_non_nullable
as HomeViewModel,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HomeViewModelCopyWith<$Res> get examModel {
  
  return $HomeViewModelCopyWith<$Res>(_self.examModel, (value) {
    return _then(_self.copyWith(examModel: value));
  });
}
}

/// @nodoc
mixin _$HomeViewModel {

 ExamModel? get examModel; ExamAttempt? get testModel; NktExamModel? get nktExamModel;
/// Create a copy of HomeViewModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeViewModelCopyWith<HomeViewModel> get copyWith => _$HomeViewModelCopyWithImpl<HomeViewModel>(this as HomeViewModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeViewModel&&(identical(other.examModel, examModel) || other.examModel == examModel)&&(identical(other.testModel, testModel) || other.testModel == testModel)&&(identical(other.nktExamModel, nktExamModel) || other.nktExamModel == nktExamModel));
}


@override
int get hashCode => Object.hash(runtimeType,examModel,testModel,nktExamModel);

@override
String toString() {
  return 'HomeViewModel(examModel: $examModel, testModel: $testModel, nktExamModel: $nktExamModel)';
}


}

/// @nodoc
abstract mixin class $HomeViewModelCopyWith<$Res>  {
  factory $HomeViewModelCopyWith(HomeViewModel value, $Res Function(HomeViewModel) _then) = _$HomeViewModelCopyWithImpl;
@useResult
$Res call({
 ExamModel? examModel, ExamAttempt? testModel, NktExamModel? nktExamModel
});


$ExamModelCopyWith<$Res>? get examModel;$ExamAttemptCopyWith<$Res>? get testModel;$NktExamModelCopyWith<$Res>? get nktExamModel;

}
/// @nodoc
class _$HomeViewModelCopyWithImpl<$Res>
    implements $HomeViewModelCopyWith<$Res> {
  _$HomeViewModelCopyWithImpl(this._self, this._then);

  final HomeViewModel _self;
  final $Res Function(HomeViewModel) _then;

/// Create a copy of HomeViewModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? examModel = freezed,Object? testModel = freezed,Object? nktExamModel = freezed,}) {
  return _then(_self.copyWith(
examModel: freezed == examModel ? _self.examModel : examModel // ignore: cast_nullable_to_non_nullable
as ExamModel?,testModel: freezed == testModel ? _self.testModel : testModel // ignore: cast_nullable_to_non_nullable
as ExamAttempt?,nktExamModel: freezed == nktExamModel ? _self.nktExamModel : nktExamModel // ignore: cast_nullable_to_non_nullable
as NktExamModel?,
  ));
}
/// Create a copy of HomeViewModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExamModelCopyWith<$Res>? get examModel {
    if (_self.examModel == null) {
    return null;
  }

  return $ExamModelCopyWith<$Res>(_self.examModel!, (value) {
    return _then(_self.copyWith(examModel: value));
  });
}/// Create a copy of HomeViewModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExamAttemptCopyWith<$Res>? get testModel {
    if (_self.testModel == null) {
    return null;
  }

  return $ExamAttemptCopyWith<$Res>(_self.testModel!, (value) {
    return _then(_self.copyWith(testModel: value));
  });
}/// Create a copy of HomeViewModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NktExamModelCopyWith<$Res>? get nktExamModel {
    if (_self.nktExamModel == null) {
    return null;
  }

  return $NktExamModelCopyWith<$Res>(_self.nktExamModel!, (value) {
    return _then(_self.copyWith(nktExamModel: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeViewModel].
extension HomeViewModelPatterns on HomeViewModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeViewModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeViewModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeViewModel value)  $default,){
final _that = this;
switch (_that) {
case _HomeViewModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeViewModel value)?  $default,){
final _that = this;
switch (_that) {
case _HomeViewModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ExamModel? examModel,  ExamAttempt? testModel,  NktExamModel? nktExamModel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeViewModel() when $default != null:
return $default(_that.examModel,_that.testModel,_that.nktExamModel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ExamModel? examModel,  ExamAttempt? testModel,  NktExamModel? nktExamModel)  $default,) {final _that = this;
switch (_that) {
case _HomeViewModel():
return $default(_that.examModel,_that.testModel,_that.nktExamModel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ExamModel? examModel,  ExamAttempt? testModel,  NktExamModel? nktExamModel)?  $default,) {final _that = this;
switch (_that) {
case _HomeViewModel() when $default != null:
return $default(_that.examModel,_that.testModel,_that.nktExamModel);case _:
  return null;

}
}

}

/// @nodoc


class _HomeViewModel implements HomeViewModel {
   _HomeViewModel({this.examModel, this.testModel, this.nktExamModel});
  

@override final  ExamModel? examModel;
@override final  ExamAttempt? testModel;
@override final  NktExamModel? nktExamModel;

/// Create a copy of HomeViewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeViewModelCopyWith<_HomeViewModel> get copyWith => __$HomeViewModelCopyWithImpl<_HomeViewModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeViewModel&&(identical(other.examModel, examModel) || other.examModel == examModel)&&(identical(other.testModel, testModel) || other.testModel == testModel)&&(identical(other.nktExamModel, nktExamModel) || other.nktExamModel == nktExamModel));
}


@override
int get hashCode => Object.hash(runtimeType,examModel,testModel,nktExamModel);

@override
String toString() {
  return 'HomeViewModel(examModel: $examModel, testModel: $testModel, nktExamModel: $nktExamModel)';
}


}

/// @nodoc
abstract mixin class _$HomeViewModelCopyWith<$Res> implements $HomeViewModelCopyWith<$Res> {
  factory _$HomeViewModelCopyWith(_HomeViewModel value, $Res Function(_HomeViewModel) _then) = __$HomeViewModelCopyWithImpl;
@override @useResult
$Res call({
 ExamModel? examModel, ExamAttempt? testModel, NktExamModel? nktExamModel
});


@override $ExamModelCopyWith<$Res>? get examModel;@override $ExamAttemptCopyWith<$Res>? get testModel;@override $NktExamModelCopyWith<$Res>? get nktExamModel;

}
/// @nodoc
class __$HomeViewModelCopyWithImpl<$Res>
    implements _$HomeViewModelCopyWith<$Res> {
  __$HomeViewModelCopyWithImpl(this._self, this._then);

  final _HomeViewModel _self;
  final $Res Function(_HomeViewModel) _then;

/// Create a copy of HomeViewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? examModel = freezed,Object? testModel = freezed,Object? nktExamModel = freezed,}) {
  return _then(_HomeViewModel(
examModel: freezed == examModel ? _self.examModel : examModel // ignore: cast_nullable_to_non_nullable
as ExamModel?,testModel: freezed == testModel ? _self.testModel : testModel // ignore: cast_nullable_to_non_nullable
as ExamAttempt?,nktExamModel: freezed == nktExamModel ? _self.nktExamModel : nktExamModel // ignore: cast_nullable_to_non_nullable
as NktExamModel?,
  ));
}

/// Create a copy of HomeViewModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExamModelCopyWith<$Res>? get examModel {
    if (_self.examModel == null) {
    return null;
  }

  return $ExamModelCopyWith<$Res>(_self.examModel!, (value) {
    return _then(_self.copyWith(examModel: value));
  });
}/// Create a copy of HomeViewModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExamAttemptCopyWith<$Res>? get testModel {
    if (_self.testModel == null) {
    return null;
  }

  return $ExamAttemptCopyWith<$Res>(_self.testModel!, (value) {
    return _then(_self.copyWith(testModel: value));
  });
}/// Create a copy of HomeViewModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NktExamModelCopyWith<$Res>? get nktExamModel {
    if (_self.nktExamModel == null) {
    return null;
  }

  return $NktExamModelCopyWith<$Res>(_self.nktExamModel!, (value) {
    return _then(_self.copyWith(nktExamModel: value));
  });
}
}

// dart format on

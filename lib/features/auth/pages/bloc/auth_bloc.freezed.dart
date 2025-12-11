// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Login value)?  login,TResult Function( _SendOtp value)?  sendOtp,TResult Function( _Register value)?  register,TResult Function( _GetSchools value)?  getSchools,TResult Function( _GetHistory value)?  getHistory,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Login() when login != null:
return login(_that);case _SendOtp() when sendOtp != null:
return sendOtp(_that);case _Register() when register != null:
return register(_that);case _GetSchools() when getSchools != null:
return getSchools(_that);case _GetHistory() when getHistory != null:
return getHistory(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Login value)  login,required TResult Function( _SendOtp value)  sendOtp,required TResult Function( _Register value)  register,required TResult Function( _GetSchools value)  getSchools,required TResult Function( _GetHistory value)  getHistory,}){
final _that = this;
switch (_that) {
case _Login():
return login(_that);case _SendOtp():
return sendOtp(_that);case _Register():
return register(_that);case _GetSchools():
return getSchools(_that);case _GetHistory():
return getHistory(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Login value)?  login,TResult? Function( _SendOtp value)?  sendOtp,TResult? Function( _Register value)?  register,TResult? Function( _GetSchools value)?  getSchools,TResult? Function( _GetHistory value)?  getHistory,}){
final _that = this;
switch (_that) {
case _Login() when login != null:
return login(_that);case _SendOtp() when sendOtp != null:
return sendOtp(_that);case _Register() when register != null:
return register(_that);case _GetSchools() when getSchools != null:
return getSchools(_that);case _GetHistory() when getHistory != null:
return getHistory(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( LoginRequest loginRequest)?  login,TResult Function( String phone)?  sendOtp,TResult Function( String phone,  String code,  String firstName,  String lastName,  String password,  String role,  int schoolId,  String schoolOtherName)?  register,TResult Function()?  getSchools,TResult Function()?  getHistory,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Login() when login != null:
return login(_that.loginRequest);case _SendOtp() when sendOtp != null:
return sendOtp(_that.phone);case _Register() when register != null:
return register(_that.phone,_that.code,_that.firstName,_that.lastName,_that.password,_that.role,_that.schoolId,_that.schoolOtherName);case _GetSchools() when getSchools != null:
return getSchools();case _GetHistory() when getHistory != null:
return getHistory();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( LoginRequest loginRequest)  login,required TResult Function( String phone)  sendOtp,required TResult Function( String phone,  String code,  String firstName,  String lastName,  String password,  String role,  int schoolId,  String schoolOtherName)  register,required TResult Function()  getSchools,required TResult Function()  getHistory,}) {final _that = this;
switch (_that) {
case _Login():
return login(_that.loginRequest);case _SendOtp():
return sendOtp(_that.phone);case _Register():
return register(_that.phone,_that.code,_that.firstName,_that.lastName,_that.password,_that.role,_that.schoolId,_that.schoolOtherName);case _GetSchools():
return getSchools();case _GetHistory():
return getHistory();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( LoginRequest loginRequest)?  login,TResult? Function( String phone)?  sendOtp,TResult? Function( String phone,  String code,  String firstName,  String lastName,  String password,  String role,  int schoolId,  String schoolOtherName)?  register,TResult? Function()?  getSchools,TResult? Function()?  getHistory,}) {final _that = this;
switch (_that) {
case _Login() when login != null:
return login(_that.loginRequest);case _SendOtp() when sendOtp != null:
return sendOtp(_that.phone);case _Register() when register != null:
return register(_that.phone,_that.code,_that.firstName,_that.lastName,_that.password,_that.role,_that.schoolId,_that.schoolOtherName);case _GetSchools() when getSchools != null:
return getSchools();case _GetHistory() when getHistory != null:
return getHistory();case _:
  return null;

}
}

}

/// @nodoc


class _Login implements AuthEvent {
  const _Login({required this.loginRequest});
  

 final  LoginRequest loginRequest;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginCopyWith<_Login> get copyWith => __$LoginCopyWithImpl<_Login>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Login&&(identical(other.loginRequest, loginRequest) || other.loginRequest == loginRequest));
}


@override
int get hashCode => Object.hash(runtimeType,loginRequest);

@override
String toString() {
  return 'AuthEvent.login(loginRequest: $loginRequest)';
}


}

/// @nodoc
abstract mixin class _$LoginCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$LoginCopyWith(_Login value, $Res Function(_Login) _then) = __$LoginCopyWithImpl;
@useResult
$Res call({
 LoginRequest loginRequest
});


$LoginRequestCopyWith<$Res> get loginRequest;

}
/// @nodoc
class __$LoginCopyWithImpl<$Res>
    implements _$LoginCopyWith<$Res> {
  __$LoginCopyWithImpl(this._self, this._then);

  final _Login _self;
  final $Res Function(_Login) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? loginRequest = null,}) {
  return _then(_Login(
loginRequest: null == loginRequest ? _self.loginRequest : loginRequest // ignore: cast_nullable_to_non_nullable
as LoginRequest,
  ));
}

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginRequestCopyWith<$Res> get loginRequest {
  
  return $LoginRequestCopyWith<$Res>(_self.loginRequest, (value) {
    return _then(_self.copyWith(loginRequest: value));
  });
}
}

/// @nodoc


class _SendOtp implements AuthEvent {
  const _SendOtp({required this.phone});
  

 final  String phone;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendOtpCopyWith<_SendOtp> get copyWith => __$SendOtpCopyWithImpl<_SendOtp>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendOtp&&(identical(other.phone, phone) || other.phone == phone));
}


@override
int get hashCode => Object.hash(runtimeType,phone);

@override
String toString() {
  return 'AuthEvent.sendOtp(phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$SendOtpCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$SendOtpCopyWith(_SendOtp value, $Res Function(_SendOtp) _then) = __$SendOtpCopyWithImpl;
@useResult
$Res call({
 String phone
});




}
/// @nodoc
class __$SendOtpCopyWithImpl<$Res>
    implements _$SendOtpCopyWith<$Res> {
  __$SendOtpCopyWithImpl(this._self, this._then);

  final _SendOtp _self;
  final $Res Function(_SendOtp) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? phone = null,}) {
  return _then(_SendOtp(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Register implements AuthEvent {
  const _Register({required this.phone, required this.code, required this.firstName, required this.lastName, required this.password, required this.role, required this.schoolId, required this.schoolOtherName});
  

 final  String phone;
 final  String code;
 final  String firstName;
 final  String lastName;
 final  String password;
 final  String role;
 final  int schoolId;
 final  String schoolOtherName;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterCopyWith<_Register> get copyWith => __$RegisterCopyWithImpl<_Register>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Register&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.code, code) || other.code == code)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.password, password) || other.password == password)&&(identical(other.role, role) || other.role == role)&&(identical(other.schoolId, schoolId) || other.schoolId == schoolId)&&(identical(other.schoolOtherName, schoolOtherName) || other.schoolOtherName == schoolOtherName));
}


@override
int get hashCode => Object.hash(runtimeType,phone,code,firstName,lastName,password,role,schoolId,schoolOtherName);

@override
String toString() {
  return 'AuthEvent.register(phone: $phone, code: $code, firstName: $firstName, lastName: $lastName, password: $password, role: $role, schoolId: $schoolId, schoolOtherName: $schoolOtherName)';
}


}

/// @nodoc
abstract mixin class _$RegisterCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$RegisterCopyWith(_Register value, $Res Function(_Register) _then) = __$RegisterCopyWithImpl;
@useResult
$Res call({
 String phone, String code, String firstName, String lastName, String password, String role, int schoolId, String schoolOtherName
});




}
/// @nodoc
class __$RegisterCopyWithImpl<$Res>
    implements _$RegisterCopyWith<$Res> {
  __$RegisterCopyWithImpl(this._self, this._then);

  final _Register _self;
  final $Res Function(_Register) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? phone = null,Object? code = null,Object? firstName = null,Object? lastName = null,Object? password = null,Object? role = null,Object? schoolId = null,Object? schoolOtherName = null,}) {
  return _then(_Register(
phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,schoolId: null == schoolId ? _self.schoolId : schoolId // ignore: cast_nullable_to_non_nullable
as int,schoolOtherName: null == schoolOtherName ? _self.schoolOtherName : schoolOtherName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _GetSchools implements AuthEvent {
  const _GetSchools();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetSchools);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.getSchools()';
}


}




/// @nodoc


class _GetHistory implements AuthEvent {
  const _GetHistory();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetHistory);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.getHistory()';
}


}




/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _LoadingFailure value)?  loadingFailure,TResult Function( _Loaded value)?  loaded,TResult Function( _LoadingSchools value)?  loadingSchools,TResult Function( _LoadedSchools value)?  loadedSchools,TResult Function( _OtpSended value)?  otpSended,TResult Function( _LoadingHistory value)?  loadingHistory,TResult Function( _LoadedHistory value)?  loadedHistory,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _LoadingFailure() when loadingFailure != null:
return loadingFailure(_that);case _Loaded() when loaded != null:
return loaded(_that);case _LoadingSchools() when loadingSchools != null:
return loadingSchools(_that);case _LoadedSchools() when loadedSchools != null:
return loadedSchools(_that);case _OtpSended() when otpSended != null:
return otpSended(_that);case _LoadingHistory() when loadingHistory != null:
return loadingHistory(_that);case _LoadedHistory() when loadedHistory != null:
return loadedHistory(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _LoadingFailure value)  loadingFailure,required TResult Function( _Loaded value)  loaded,required TResult Function( _LoadingSchools value)  loadingSchools,required TResult Function( _LoadedSchools value)  loadedSchools,required TResult Function( _OtpSended value)  otpSended,required TResult Function( _LoadingHistory value)  loadingHistory,required TResult Function( _LoadedHistory value)  loadedHistory,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _LoadingFailure():
return loadingFailure(_that);case _Loaded():
return loaded(_that);case _LoadingSchools():
return loadingSchools(_that);case _LoadedSchools():
return loadedSchools(_that);case _OtpSended():
return otpSended(_that);case _LoadingHistory():
return loadingHistory(_that);case _LoadedHistory():
return loadedHistory(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _LoadingFailure value)?  loadingFailure,TResult? Function( _Loaded value)?  loaded,TResult? Function( _LoadingSchools value)?  loadingSchools,TResult? Function( _LoadedSchools value)?  loadedSchools,TResult? Function( _OtpSended value)?  otpSended,TResult? Function( _LoadingHistory value)?  loadingHistory,TResult? Function( _LoadedHistory value)?  loadedHistory,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _LoadingFailure() when loadingFailure != null:
return loadingFailure(_that);case _Loaded() when loaded != null:
return loaded(_that);case _LoadingSchools() when loadingSchools != null:
return loadingSchools(_that);case _LoadedSchools() when loadedSchools != null:
return loadedSchools(_that);case _OtpSended() when otpSended != null:
return otpSended(_that);case _LoadingHistory() when loadingHistory != null:
return loadingHistory(_that);case _LoadedHistory() when loadedHistory != null:
return loadedHistory(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String message)?  loadingFailure,TResult Function()?  loaded,TResult Function()?  loadingSchools,TResult Function( SchoolResponse schools)?  loadedSchools,TResult Function()?  otpSended,TResult Function()?  loadingHistory,TResult Function( HistoryResponse history)?  loadedHistory,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _LoadingFailure() when loadingFailure != null:
return loadingFailure(_that.message);case _Loaded() when loaded != null:
return loaded();case _LoadingSchools() when loadingSchools != null:
return loadingSchools();case _LoadedSchools() when loadedSchools != null:
return loadedSchools(_that.schools);case _OtpSended() when otpSended != null:
return otpSended();case _LoadingHistory() when loadingHistory != null:
return loadingHistory();case _LoadedHistory() when loadedHistory != null:
return loadedHistory(_that.history);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String message)  loadingFailure,required TResult Function()  loaded,required TResult Function()  loadingSchools,required TResult Function( SchoolResponse schools)  loadedSchools,required TResult Function()  otpSended,required TResult Function()  loadingHistory,required TResult Function( HistoryResponse history)  loadedHistory,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _LoadingFailure():
return loadingFailure(_that.message);case _Loaded():
return loaded();case _LoadingSchools():
return loadingSchools();case _LoadedSchools():
return loadedSchools(_that.schools);case _OtpSended():
return otpSended();case _LoadingHistory():
return loadingHistory();case _LoadedHistory():
return loadedHistory(_that.history);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String message)?  loadingFailure,TResult? Function()?  loaded,TResult? Function()?  loadingSchools,TResult? Function( SchoolResponse schools)?  loadedSchools,TResult? Function()?  otpSended,TResult? Function()?  loadingHistory,TResult? Function( HistoryResponse history)?  loadedHistory,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _LoadingFailure() when loadingFailure != null:
return loadingFailure(_that.message);case _Loaded() when loaded != null:
return loaded();case _LoadingSchools() when loadingSchools != null:
return loadingSchools();case _LoadedSchools() when loadedSchools != null:
return loadedSchools(_that.schools);case _OtpSended() when otpSended != null:
return otpSended();case _LoadingHistory() when loadingHistory != null:
return loadingHistory();case _LoadedHistory() when loadedHistory != null:
return loadedHistory(_that.history);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AuthState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.initial()';
}


}




/// @nodoc


class _Loading implements AuthState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.loading()';
}


}




/// @nodoc


class _LoadingFailure implements AuthState {
  const _LoadingFailure({required this.message});
  

 final  String message;

/// Create a copy of AuthState
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
  return 'AuthState.loadingFailure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$LoadingFailureCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
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

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_LoadingFailure(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Loaded implements AuthState {
  const _Loaded();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.loaded()';
}


}




/// @nodoc


class _LoadingSchools implements AuthState {
  const _LoadingSchools();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingSchools);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.loadingSchools()';
}


}




/// @nodoc


class _LoadedSchools implements AuthState {
  const _LoadedSchools({required this.schools});
  

 final  SchoolResponse schools;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedSchoolsCopyWith<_LoadedSchools> get copyWith => __$LoadedSchoolsCopyWithImpl<_LoadedSchools>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadedSchools&&(identical(other.schools, schools) || other.schools == schools));
}


@override
int get hashCode => Object.hash(runtimeType,schools);

@override
String toString() {
  return 'AuthState.loadedSchools(schools: $schools)';
}


}

/// @nodoc
abstract mixin class _$LoadedSchoolsCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$LoadedSchoolsCopyWith(_LoadedSchools value, $Res Function(_LoadedSchools) _then) = __$LoadedSchoolsCopyWithImpl;
@useResult
$Res call({
 SchoolResponse schools
});


$SchoolResponseCopyWith<$Res> get schools;

}
/// @nodoc
class __$LoadedSchoolsCopyWithImpl<$Res>
    implements _$LoadedSchoolsCopyWith<$Res> {
  __$LoadedSchoolsCopyWithImpl(this._self, this._then);

  final _LoadedSchools _self;
  final $Res Function(_LoadedSchools) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? schools = null,}) {
  return _then(_LoadedSchools(
schools: null == schools ? _self.schools : schools // ignore: cast_nullable_to_non_nullable
as SchoolResponse,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SchoolResponseCopyWith<$Res> get schools {
  
  return $SchoolResponseCopyWith<$Res>(_self.schools, (value) {
    return _then(_self.copyWith(schools: value));
  });
}
}

/// @nodoc


class _OtpSended implements AuthState {
  const _OtpSended();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OtpSended);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.otpSended()';
}


}




/// @nodoc


class _LoadingHistory implements AuthState {
  const _LoadingHistory();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingHistory);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.loadingHistory()';
}


}




/// @nodoc


class _LoadedHistory implements AuthState {
  const _LoadedHistory({required this.history});
  

 final  HistoryResponse history;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedHistoryCopyWith<_LoadedHistory> get copyWith => __$LoadedHistoryCopyWithImpl<_LoadedHistory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadedHistory&&(identical(other.history, history) || other.history == history));
}


@override
int get hashCode => Object.hash(runtimeType,history);

@override
String toString() {
  return 'AuthState.loadedHistory(history: $history)';
}


}

/// @nodoc
abstract mixin class _$LoadedHistoryCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$LoadedHistoryCopyWith(_LoadedHistory value, $Res Function(_LoadedHistory) _then) = __$LoadedHistoryCopyWithImpl;
@useResult
$Res call({
 HistoryResponse history
});


$HistoryResponseCopyWith<$Res> get history;

}
/// @nodoc
class __$LoadedHistoryCopyWithImpl<$Res>
    implements _$LoadedHistoryCopyWith<$Res> {
  __$LoadedHistoryCopyWithImpl(this._self, this._then);

  final _LoadedHistory _self;
  final $Res Function(_LoadedHistory) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? history = null,}) {
  return _then(_LoadedHistory(
history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as HistoryResponse,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HistoryResponseCopyWith<$Res> get history {
  
  return $HistoryResponseCopyWith<$Res>(_self.history, (value) {
    return _then(_self.copyWith(history: value));
  });
}
}

// dart format on

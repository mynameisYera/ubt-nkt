part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login({
    required LoginRequest loginRequest
  }) = _Login;
  const factory AuthEvent.sendOtp({
    required String phone
  }) = _SendOtp;
  const factory AuthEvent.register({
    required String phone,
    required String code,
    required String firstName,
    required String lastName,
    required String password,
    required String role,
    required int schoolId,
    required String schoolOtherName,
  }) = _Register;
  const factory AuthEvent.getSchools() = _GetSchools;
  const factory AuthEvent.getHistory() = _GetHistory;
}
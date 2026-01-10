part of 'auth_bloc.dart';
@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  // Общий лоадер
  const factory AuthState.loading() = _Loading;

  // Ошибка
  const factory AuthState.loadingFailure({
    required String message,
  }) = _LoadingFailure;

  // Успешный логин
  const factory AuthState.loaded() = _Loaded;

  // Успешный регистрация
  const factory AuthState.registered() = _Registered;

  // Успешный сброс пароля
  const factory AuthState.resetPasswordOtpSended() = _ResetPasswordOtpSended;
  // Ошибка сброса пароля OTP
  const factory AuthState.resetPasswordOtpFailure({
    required String message,
  }) = _ResetPasswordOtpFailure;

  // Успешный сброс пароля
  const factory AuthState.resetPasswordSended() = _ResetPasswordSended;
  // Ошибка сброса пароля
  const factory AuthState.resetPasswordFailure({
    required String message,
  }) = _ResetPasswordFailure;

  // Школы
  const factory AuthState.loadingSchools() = _LoadingSchools;
  const factory AuthState.loadedSchools({
    required SchoolResponse schools,
  }) = _LoadedSchools;

  // OTP
  const factory AuthState.otpSended() = _OtpSended;

  // History
  const factory AuthState.loadingHistory() = _LoadingHistory;
  const factory AuthState.loadedHistory({
    required HistoryResponse history,
  }) = _LoadedHistory;
}

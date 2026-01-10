import 'dart:async';

import 'package:brand_test/config/route/go_router_help.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:brand_test/config/endpoints/dio_sender.dart';
import 'package:brand_test/config/endpoints/endpoints.dart';
import 'package:brand_test/config/storage/flutter_secure_storage_func.dart';
import 'package:brand_test/features/auth/models/history_model.dart';
import 'package:brand_test/features/auth/models/login_request.dart';
import 'package:brand_test/features/auth/models/schools_model.dart';
import 'package:brand_test/features/auth/models/user_login_model.dart';


part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState.initial()) {
    on<AuthEvent>(_onEventHandler);
  }
  

  Future<void> _onEventHandler(
    AuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    await event.map(
      login: (e) => _onLogin(e, emit),
      sendOtp: (r) => _sendOtp(r, emit),
      register: (z) => _register(z, emit),
      getSchools: (value) => _getSchools(value, emit),
      getHistory: (value) => _getHistory(value, emit),
      restorePasswordOtp: (value) => _restorePasswordOtp(value, emit),
      restorePassword: (value) => _restorePassword(value, emit),
    );
  }

  Future<void> _getSchools(_GetSchools event, Emitter<AuthState> emit) async {
    emit(const AuthState.loadingSchools());

    try {
      final response = await DioSender.get(
        Endpoints.schools
      );

      final school = SchoolResponse.fromJson(
        response.data as Map<String, dynamic>,
      );

      emit(AuthState.loadedSchools(schools: school));
    } on ApiException catch (e) {
      emit(AuthState.loadingFailure(message: e.message));
    } catch (_) {
      emit(const AuthState.loadingFailure(message: "Неизвестная ошибка"));
    }
  }

  Future<void> _onLogin(_Login event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    try {
      final response = await DioSender.post(
        Endpoints.login,
        {
          "phone": event.loginRequest.phone,
          "password": event.loginRequest.password
        }
      );

      final responseData = response.data;
      Map<String, dynamic> dataMap;
      
      if (responseData is Map<String, dynamic>) {
        dataMap = responseData;
      } else {
        throw Exception('Invalid response format');
      }

      final userLogin = UserLoginModel.fromJson(dataMap);
      
      try {
        await FlutterSecureStorageFunc.saveToken(userLogin.tokens.access);
        await FlutterSecureStorageFunc.saveRefreshToken(userLogin.tokens.refresh);
        await FlutterSecureStorageFunc.saveRole(userLogin.user.role);
        
        final savedToken = await FlutterSecureStorageFunc.getToken();
        final savedRefreshToken = await FlutterSecureStorageFunc.getRefreshToken();
        final savedRole = await FlutterSecureStorageFunc.getRole();
        
        debugPrint('Токены сохранены: access=${savedToken != null && savedToken.isNotEmpty}, refresh=${savedRefreshToken != null && savedRefreshToken.isNotEmpty} ');
        debugPrint('Роль сохранена: role=${savedRole != null && savedRole.isNotEmpty}');
        
        if (savedToken == null || savedToken.isEmpty) {
          debugPrint('Предупреждение: токен не был сохранен, но продолжаем выполнение');
        }
      } catch (e) {
        debugPrint('Ошибка сохранения токенов: $e');
      }

      emit(const AuthState.loaded());
    } on ApiException catch (e) {
      emit(AuthState.loadingFailure(message: e.message));
    } catch (e) {
      debugPrint('Ошибка логина: $e');
      emit(AuthState.loadingFailure(message: "Неизвестная ошибка: ${e.toString()}"));
    }
  }

  Future<void> _sendOtp(_SendOtp event, Emitter<AuthState> emit) async {
    try {
      await DioSender.post(
        Endpoints.requestOtp,
        {
          "phone": event.phone,
        }
      );

      // emit(const AuthState.otpSended());
    } on ApiException catch (e) {
      emit(AuthState.loadingFailure(message: e.message));
    } catch (_) {
      emit(const AuthState.loadingFailure(message: "Повторите заново..."));
    }
  }

  Future<void> _register(_Register event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    try {
        final response = await DioSender.post(
          Endpoints.registerWithOtp,
          {
            "phone": event.phone,
            "code": event.code,
            "first_name": event.firstName,
            "last_name": event.lastName,
            "role": event.role,
            "school_id": event.schoolId,
            "password": event.password
          }
        );
        if(response.statusCode == 201 || response.statusCode == 200){
          emit(const AuthState.registered());
          appRouter.pushReplacement("/login");
        }else{
          emit(AuthState.loadingFailure(message: response.data['message']));
        }
    } on ApiException catch (e) {
      emit(AuthState.loadingFailure(message: e.message));
    } catch (_) {
      emit(const AuthState.loadingFailure(message: "Повторите заново..."));
    }
  }

  Future<void> _getHistory(_GetHistory event, Emitter<AuthState> emit) async {
    emit(const AuthState.loadingHistory());

    try {
      final response = await DioSender.get(
        Endpoints.history,
      );

      final responseData = response.data;
      Map<String, dynamic> dataMap;
      
      if (responseData is Map<String, dynamic>) {
        dataMap = responseData;
      } else {
        throw Exception('Invalid response format');
      }

      final history = HistoryResponse.fromJson(dataMap);

      emit(AuthState.loadedHistory(history: history));
    } on ApiException catch (e) {
      emit(AuthState.loadingFailure(message: e.message));
    } catch (e) {
      debugPrint('Ошибка получения истории: $e');
      emit(AuthState.loadingFailure(message: "Неизвестная ошибка: ${e.toString()}"));
    }
  }

  Future<void> _restorePasswordOtp(_RestorePasswordOtp event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    try {
      final response = await DioSender.post(
        Endpoints.resetPasswordOtp,
        {
          "phone": event.phone,
        } 
      );
      if(response.statusCode == 200){
        emit(const AuthState.resetPasswordOtpSended());
      }else{
        emit(AuthState.resetPasswordOtpFailure(message: response.data['message']));
        emit(AuthState.initial());
      }
    } on ApiException catch (e) {
      emit(AuthState.resetPasswordOtpFailure(message: e.message));
      emit(AuthState.initial());
    } catch (_) {
      emit(AuthState.resetPasswordOtpFailure(message: "Повторите заново..."));
      emit(AuthState.initial());
    }
  } 

  Future<void> _restorePassword(_RestorePassword event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());

    try {
      final response = await DioSender.post(
        Endpoints.resetPassword,
        {
          "phone": event.phone,
          "code": event.code,
          "1": event.password,
        }
      );
      if(response.statusCode == 200){
        emit(const AuthState.loaded());
      }else{
        emit(AuthState.resetPasswordFailure(message: response.data['message']));
      }

    } on ApiException catch (e) {
      emit(AuthState.resetPasswordFailure(message: e.message));
    } catch (_) {
      emit(AuthState.resetPasswordFailure(message: "Повторите заново..."));
    }
  }
}
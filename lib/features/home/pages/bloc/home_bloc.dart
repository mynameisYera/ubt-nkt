import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ubt_pbb/config/endpoints/dio_sender.dart';
import 'package:ubt_pbb/config/endpoints/endpoints.dart';
import 'package:ubt_pbb/config/logger/l.dart';
import 'package:ubt_pbb/config/storage/flutter_secure_storage_func.dart';
import 'package:ubt_pbb/features/home/models/exam_model.dart';
import 'package:ubt_pbb/features/home/models/test_model.dart';
import 'package:ubt_pbb/features/home/models/nkt_exam_model.dart';


part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState.initial()) {
    on<HomeEvent>(_onEventHandler);
  }
  

  Future<void> _onEventHandler(
    HomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    await event.map(
      getPairs: (e) => _onGetPairs(e, emit),
      startExam: (value) => _onExamStart(value, emit),
      setExamAttempt: (value) => _onSetExamAttempt(value, emit),
    );
  }

  Future<void> _onSetExamAttempt(_SetExamAttempt event, Emitter<HomeState> emit) async {
    emit(HomeState.loaded(examModel: HomeViewModel(testModel: event.examAttempt)));
  }
  Future<void> _onExamStart(_StartExam event, Emitter<HomeState> emit) async {
    emit(const HomeState.loading());

    try {
      final role = await FlutterSecureStorageFunc.getRole();
      final response = role == "teacher" ? await DioSender.post(
        Endpoints.startExamNkt,
        {
          "subject_id": event.id
        }
      ) : await DioSender.post(
        Endpoints.startExam,
        {
          "pair_id": event.id
        }
      );

      // Проверяем структуру ответа
      final responseData = response.data;
      if (responseData == null) {
        throw Exception('Response data is null');
      }

      // Если данные обернуты в другой объект (например, {"data": {...}})
      final Map<String, dynamic> jsonData;
      if (responseData is Map<String, dynamic>) {
        if (responseData.containsKey('data') && responseData['data'] is Map<String, dynamic>) {
          jsonData = responseData['data'] as Map<String, dynamic>;
        } else {
          jsonData = responseData;
        }
      } else {
        throw Exception('Response data is not a Map: ${responseData.runtimeType}');
      }

      L.log('PARSING', 'Parsing response for role $role: $jsonData');

      // Both teacher and student get ExamAttempt structure when starting exam
      final testModel = ExamAttempt.fromJson(jsonData);
      // ------------ save attempt id ------------
      await FlutterSecureStorageFunc.saveAttemptId(testModel.id);
      emit(HomeState.loaded(examModel: HomeViewModel(testModel: testModel)));
    } on ApiException catch (e) {
      emit(HomeState.loadingFailure(message: e.message));
    } catch (e, stackTrace) {
      L.error('EXAM_START_ERROR', 'Error: $e\nStackTrace: $stackTrace');
      emit(HomeState.loadingFailure(message: "Ошибка: ${e.toString()}"));
    }
  }

  Future<void> _onGetPairs(_GetPairs event, Emitter<HomeState> emit) async {
    emit(const HomeState.loading());

    try {
      final role = await FlutterSecureStorageFunc.getRole();
      final response = role == "teacher" ? await DioSender.get(
        Endpoints.getPairsNkt,
      ) : await DioSender.get(
        Endpoints.getPairs,
      );

      final responseData = response.data as Map<String, dynamic>;
      
      // Try to parse as NktExamModel for teacher, fallback to ExamModel
      if (role == "teacher") {
        try {
          final nktExamModel = NktExamModel.fromJson(responseData);
          emit(HomeState.loaded(examModel: HomeViewModel(nktExamModel: nktExamModel)));
          return;
        } catch (e) {
          // If parsing as NktExamModel fails, try ExamModel
          L.log('PARSING', 'Failed to parse as NktExamModel, trying ExamModel: $e');
        }
      }

      // Parse as ExamModel (for student or fallback for teacher)
      final examModel = ExamModel.fromJson(responseData);
      emit(HomeState.loaded(examModel: HomeViewModel(examModel: examModel)));
    } on ApiException catch (e) {
      emit(HomeState.loadingFailure(message: e.message));
    } catch (e, stackTrace) {
      L.error('GET_PAIRS_ERROR', 'Error: $e\nStackTrace: $stackTrace');
      emit(HomeState.loadingFailure(message: "Ошибка: ${e.toString()}"));
    }
  }


}

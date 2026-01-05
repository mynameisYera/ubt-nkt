import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:brand_test/config/endpoints/dio_sender.dart';
import 'package:brand_test/config/endpoints/endpoints.dart';
import 'package:brand_test/config/logger/l.dart';
import 'package:brand_test/config/storage/flutter_secure_storage_func.dart';
import 'package:brand_test/features/home/models/exam_model.dart';
import 'package:brand_test/features/home/models/solution_model.dart';
import 'package:brand_test/features/home/models/test_model.dart';
import 'package:brand_test/features/home/models/nkt_exam_model.dart';


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
      continueExam: (value) => _onContinueExam(value, emit),
      getSolutionQuestion: (value) => _onGetSolutionQuestion(value, emit),
    );
  }

  Future<void> _onGetSolutionQuestion(_GetSolutionQuestion event, Emitter<HomeState> emit) async {
    emit(const HomeState.loading());

    try {
      final response = await DioSender.get(
        Endpoints.examSolution(event.attemptId, event.attemptQuestionId),
      );
      final responseData = response.data;
      if (responseData == null) {
        throw Exception('Response data is null');
      }
      final solutionQuestion = SolutionQuestion.fromJson(responseData);
      emit(HomeState.loaded(examModel: HomeViewModel(solutionQuestion: solutionQuestion)));
    } on ApiException catch (e) {
      emit(HomeState.loadingFailure(message: e.message));
    } catch (e, stackTrace) {
      L.error('GET_SOLUTION_QUESTION_ERROR', 'Error: $e\nStackTrace: $stackTrace');
      emit(HomeState.loadingFailure(message: "Ошибка: ${e.toString()}"));
    }
  }

  Future<void> _onSetExamAttempt(_SetExamAttempt event, Emitter<HomeState> emit) async {
    emit(HomeState.loaded(examModel: HomeViewModel(testModel: event.examAttempt)));
  }

  Future<void> _onContinueExam(_ContinueExam event, Emitter<HomeState> emit) async {
    emit(const HomeState.loading());

    try {
      final response = await DioSender.get(
        Endpoints.continueExam(event.attemptId),
      );

      final responseData = response.data;
      if (responseData == null) {
        throw Exception('Response data is null');
      }

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

      L.log('PARSING', 'Parsing response for continue exam: $jsonData');

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


  Future<void> _onExamStart(_StartExam event, Emitter<HomeState> emit) async {
    final currentState = state;
    final hasActiveTest = currentState.maybeWhen(
      loaded: (examModel) => examModel.testModel != null,
      orElse: () => false,
    );
    
    if (hasActiveTest) {
      L.log('EXAM_START', 'Test already active, skipping start');
      return;
    }
    
    emit(const HomeState.loading());

    try {
      await FlutterSecureStorageFunc.deleteAttemptId();
      
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

      final responseData = response.data;
      if (responseData == null) {
        throw Exception('Response data is null');
      }

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

      final testModel = ExamAttempt.fromJson(jsonData);
      
      if (testModel.subjects.isEmpty) {
        throw Exception('Test model has no subjects');
      }
      
      await FlutterSecureStorageFunc.saveAttemptId(testModel.id);
      emit(HomeState.loaded(examModel: HomeViewModel(testModel: testModel)));
    } on ApiException catch (e) {
      if (e.message == 'quota_exhausted') {
        emit(const HomeState.quotaExhausted());
      } else {
        emit(HomeState.loadingFailure(message: e.message));
      }
    } catch (e, stackTrace) {
      L.error('EXAM_START_ERROR', 'Error: $e\nStackTrace: $stackTrace');
      emit(HomeState.loadingFailure(message: "Ошибка: ${e.toString()}"));
    }
  }

  Future<void> _onGetPairs(_GetPairs event, Emitter<HomeState> emit) async {
    L.log('GET_PAIRS', 'Starting getPairs request');
    emit(const HomeState.loading());

    try {
      final role = await FlutterSecureStorageFunc.getRole();
      L.log('GET_PAIRS', 'Role: $role, endpoint: ${role == "teacher" ? Endpoints.getPairsNkt : Endpoints.getPairs}');
      final response = role == "teacher" ? await DioSender.get(
        Endpoints.getPairsNkt,
      ) : await DioSender.get(
        Endpoints.getPairs,
      );
      L.log('GET_PAIRS', 'Response received: ${response.statusCode}');
      // final healthResponse = await DioSender.get(
      //   Endpoints.health,
      // );
      // if (healthResponse.statusCode != 200) {
      //   throw ApiException('Health check failed: ${healthResponse.statusCode}');
      // }
      // L.log('HEALTH_CHECK', 'Health check passed: ${healthResponse}');

      final responseData = response.data as Map<String, dynamic>;
      
      if (role == "teacher") {
        try {
          final nktExamModel = NktExamModel.fromJson(responseData);
          
          if (nktExamModel.in_progress_attempt != null) {
            L.log('IN_PROGRESS_ATTEMPT', 'Found NKT in_progress_attempt: ${nktExamModel.in_progress_attempt?.id}');
            final continueEvent = HomeEvent.continueExam(attemptId: nktExamModel.in_progress_attempt!.id);
            await continueEvent.map(
              getPairs: (_) async {},
              startExam: (_) async {},
              setExamAttempt: (_) async {},
              continueExam: (e) => _onContinueExam(e, emit),
              getSolutionQuestion: (_) async {},
            );
            return;
          }
          
          emit(HomeState.loaded(examModel: HomeViewModel(nktExamModel: nktExamModel)));
          return;
        } catch (e) {
          L.log('PARSING', 'Failed to parse as NktExamModel, trying ExamModel: $e');
        }
      }

      // Parse as ExamModel (for student or fallback for teacher)
      final examModel = ExamModel.fromJson(responseData);
      
      // Если есть in_progress_attempt, автоматически продолжаем экзамен
      if (examModel.in_progress_attempt != null) {
        L.log('IN_PROGRESS_ATTEMPT', 'Found in_progress_attempt: ${examModel.in_progress_attempt?.id}');
        final continueEvent = HomeEvent.continueExam(attemptId: examModel.in_progress_attempt!.id);
        await continueEvent.map(
          getPairs: (_) async {},
          startExam: (_) async {},
          setExamAttempt: (_) async {},
          continueExam: (e) => _onContinueExam(e, emit),
          getSolutionQuestion: (_) async {},
        );
        return;
      }
      
      emit(HomeState.loaded(examModel: HomeViewModel(examModel: examModel)));
    } on ApiException catch (e) {
      emit(HomeState.loadingFailure(message: e.message));
    } catch (e, stackTrace) {
      L.error('GET_PAIRS_ERROR', 'Error: $e\nStackTrace: $stackTrace');
      emit(HomeState.loadingFailure(message: "Ошибка: ${e.toString()}"));
    }
  }
}
part of 'home_bloc.dart';

@freezed
abstract class HomeEvent with _$HomeEvent {
  const factory HomeEvent.getPairs() = _GetPairs;
  const factory HomeEvent.startExam({
    required int id,
  }) = _StartExam;
  const factory HomeEvent.setExamAttempt({
    required ExamAttempt examAttempt,
  }) = _SetExamAttempt;

}
part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.loadingFailure({
    required String message
  }) = _LoadingFailure;
  const factory HomeState.quotaExhausted() = _QuotaExhausted;
  const factory HomeState.loaded({
    required HomeViewModel examModel
  }) = _Loaded;
}


@freezed
abstract class HomeViewModel with _$HomeViewModel {
  factory HomeViewModel({
    ExamModel? examModel,
    ExamAttempt? testModel,
    NktExamModel? nktExamModel,
    SolutionQuestion? solutionQuestion,
  }) = _HomeViewModel;
}

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'solution_model.freezed.dart';
part 'solution_model.g.dart';

@freezed
abstract class SolutionQuestion with _$SolutionQuestion {
  const factory SolutionQuestion({
    @JsonKey(name: 'attempt_question_id') required int attemptQuestionId,
    @JsonKey(name: 'question_type') required String questionType,
    @JsonKey(name: 'question_html') required String questionHtml,
    SolutionContext? context,
    @JsonKey(fromJson: _answerFromJson, toJson: _answerToJson)
        required SolutionAnswer answer,
    @JsonKey(name: 'explanation_html') required String explanationHtml,
  }) = _SolutionQuestion;

  factory SolutionQuestion.fromJson(Map<String, dynamic> json) =>
      _$SolutionQuestionFromJson(json);
}

SolutionAnswer _answerFromJson(Map<String, dynamic> json) =>
    SolutionAnswer.fromJson(json);

Map<String, dynamic> _answerToJson(SolutionAnswer answer) =>
    answer.when(
      matching: (kind, rows) => {
        'kind': kind,
        'rows': rows.map((e) => e.toJson()).toList(),
      },
      multiple: (kind, correctOptions) => {
        'kind': kind,
        'correct_options': correctOptions.map((e) => e.toJson()).toList(),
      },
      single: (kind, correctOption) => {
        'kind': kind,
        'correct_option': correctOption.toJson(),
      },
    );

@freezed
abstract class SolutionContext with _$SolutionContext {
  const factory SolutionContext({
    required String id,
    required String title,
    @JsonKey(name: 'body_html') required String bodyHtml,
  }) = _SolutionContext;

  factory SolutionContext.fromJson(Map<String, dynamic> json) =>
      _$SolutionContextFromJson(json);
}

@freezed
abstract class SolutionAnswer with _$SolutionAnswer {
  const factory SolutionAnswer.matching({
    required String kind,
    required List<MatchingRow> rows,
  }) = MatchingAnswer;

  const factory SolutionAnswer.multiple({
    required String kind,
    @JsonKey(name: 'correct_options') required List<CorrectOption> correctOptions,
  }) = MultipleAnswer;

  const factory SolutionAnswer.single({
    required String kind,
    @JsonKey(name: 'correct_option') required CorrectOption correctOption,
  }) = SingleAnswer;

  factory SolutionAnswer.fromJson(Map<String, dynamic> json) {
    final kind = json['kind'] as String;
    switch (kind) {
      case 'matching':
        return SolutionAnswer.matching(
          kind: kind,
          rows: (json['rows'] as List<dynamic>)
              .map((e) => MatchingRow.fromJson(e as Map<String, dynamic>))
              .toList(),
        );
      case 'multiple':
        return SolutionAnswer.multiple(
          kind: kind,
          correctOptions: (json['correct_options'] as List<dynamic>)
              .map((e) => CorrectOption.fromJson(e as Map<String, dynamic>))
              .toList(),
        );
      case 'single':
        return SolutionAnswer.single(
          kind: kind,
          correctOption: CorrectOption.fromJson(
            json['correct_option'] as Map<String, dynamic>,
          ),
        );
      default:
        throw ArgumentError('Unknown answer kind: $kind');
    }
  }
}

@freezed
abstract class MatchingRow with _$MatchingRow {
  const factory MatchingRow({
    @JsonKey(name: 'row_id') required String rowId,
    @JsonKey(name: 'row_prompt_html') required String rowPromptHtml,
    @JsonKey(name: 'option_id') required String optionId,
    @JsonKey(name: 'option_label_html') required String optionLabelHtml,
  }) = _MatchingRow;

  factory MatchingRow.fromJson(Map<String, dynamic> json) =>
      _$MatchingRowFromJson(json);
}

@freezed
abstract class CorrectOption with _$CorrectOption {
  const factory CorrectOption({
    required String id,
    @JsonKey(name: 'label_html') required String labelHtml,
  }) = _CorrectOption;

  factory CorrectOption.fromJson(Map<String, dynamic> json) =>
      _$CorrectOptionFromJson(json);
}


// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solution_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SolutionQuestion _$SolutionQuestionFromJson(Map<String, dynamic> json) =>
    _SolutionQuestion(
      attemptQuestionId: (json['attempt_question_id'] as num).toInt(),
      questionType: json['question_type'] as String,
      questionHtml: json['question_html'] as String,
      context: json['context'] == null
          ? null
          : SolutionContext.fromJson(json['context'] as Map<String, dynamic>),
      answer: _answerFromJson(json['answer'] as Map<String, dynamic>),
      explanationHtml: json['explanation_html'] as String,
    );

Map<String, dynamic> _$SolutionQuestionToJson(_SolutionQuestion instance) =>
    <String, dynamic>{
      'attempt_question_id': instance.attemptQuestionId,
      'question_type': instance.questionType,
      'question_html': instance.questionHtml,
      'context': instance.context,
      'answer': _answerToJson(instance.answer),
      'explanation_html': instance.explanationHtml,
    };

_SolutionContext _$SolutionContextFromJson(Map<String, dynamic> json) =>
    _SolutionContext(
      id: json['id'] as String,
      title: json['title'] as String,
      bodyHtml: json['body_html'] as String,
    );

Map<String, dynamic> _$SolutionContextToJson(_SolutionContext instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body_html': instance.bodyHtml,
    };

_MatchingRow _$MatchingRowFromJson(Map<String, dynamic> json) => _MatchingRow(
  rowId: json['row_id'] as String,
  rowPromptHtml: json['row_prompt_html'] as String,
  optionId: json['option_id'] as String,
  optionLabelHtml: json['option_label_html'] as String,
);

Map<String, dynamic> _$MatchingRowToJson(_MatchingRow instance) =>
    <String, dynamic>{
      'row_id': instance.rowId,
      'row_prompt_html': instance.rowPromptHtml,
      'option_id': instance.optionId,
      'option_label_html': instance.optionLabelHtml,
    };

_CorrectOption _$CorrectOptionFromJson(Map<String, dynamic> json) =>
    _CorrectOption(
      id: json['id'] as String,
      labelHtml: json['label_html'] as String,
    );

Map<String, dynamic> _$CorrectOptionToJson(_CorrectOption instance) =>
    <String, dynamic>{'id': instance.id, 'label_html': instance.labelHtml};

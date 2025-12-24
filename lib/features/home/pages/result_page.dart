import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:ubt_pbb/config/constants/app_colors.dart';
import 'package:ubt_pbb/config/endpoints/dio_sender.dart';
import 'package:ubt_pbb/config/endpoints/endpoints.dart';
import 'package:ubt_pbb/config/getit/get_injection.dart';
import 'package:ubt_pbb/config/route/go_router_help.dart';
import 'package:ubt_pbb/config/widgets/app_button.dart';
import 'package:ubt_pbb/config/widgets/cors_aware_image.dart';
import 'package:ubt_pbb/features/home/models/result_model.dart';
import 'package:ubt_pbb/features/home/models/solution_model.dart';
import 'package:ubt_pbb/features/home/pages/bloc/home_bloc.dart';

class ResultPage extends StatefulWidget {
  final int attemptId;

  const ResultPage({
    super.key,
    required this.attemptId,
  });

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  ResultModel? _resultModel;
  bool _isLoading = true;
  String? _errorMessage;
  final Map<int, bool> _expandedSubjects = {};
  late HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = sl<HomeBloc>();
    _loadResults();
  }

  @override
  void dispose() {
    _homeBloc.close();
    super.dispose();
  }

  Future<void> _loadResults() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final response = await DioSender.get(
        Endpoints.historyResults(widget.attemptId),
      );

      if (response.statusCode == 200) {
        setState(() {
          _resultModel = ResultModel.fromJson(
            response.data as Map<String, dynamic>,
          );
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
          _errorMessage = 'Ошибка при загрузке результатов';
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Ошибка: ${e.toString()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _homeBloc,
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          state.maybeWhen(
            loaded: (examModel) {
              if (examModel.solutionQuestion != null) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _showSolutionModal(context, examModel.solutionQuestion!);
                });
              }
            },
            loadingFailure: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message)),
              );
            },
            orElse: () {},
          );
        },
        child: Scaffold(
          backgroundColor: const Color(0xFFF4F6FB),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.mainBlue,
            foregroundColor: Colors.white,
            title: const Text(
              'Тест нәтижелері',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: false,
          ),
          body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                backgroundColor: AppColors.mainBlue,
              ),
            )
          : _errorMessage != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 64,
                        color: Colors.red.shade700,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _errorMessage!,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.red.shade700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton.icon(
                        onPressed: _loadResults,
                        icon: const Icon(Icons.refresh),
                        label: const Text('Қайталау'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.mainBlue,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              : _resultModel == null
                  ? const Center(
                      child: Text('Нет данных'),
                    )
                  : SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Общая информация
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.mainBlue,
                                  AppColors.mainBlue.withOpacity(0.8),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              children: [
                                const Text(
                                  'Жалпы нәтиже',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          '${_resultModel!.totalScore}',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 36,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '/ ${_resultModel!.maxScore}',
                                          style: TextStyle(
                                            color: Colors.white.withOpacity(0.9),
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: LinearProgressIndicator(
                                    value: _resultModel!.maxScore > 0
                                        ? _resultModel!.totalScore /
                                            _resultModel!.maxScore
                                        : 0.0,
                                    backgroundColor: Colors.white.withOpacity(0.3),
                                    valueColor: const AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                    minHeight: 8,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '${((_resultModel!.totalScore / _resultModel!.maxScore) * 100).toStringAsFixed(1)}%',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'Пән бойынша нәтижелер:',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          ..._resultModel!.subjects.map((subject) {
                            final progress = subject.maxScore > 0
                                ? subject.score / subject.maxScore
                                : 0.0;
                            final answeredCount = subject.questions
                                .where((q) => q.answered)
                                .length;
                            final totalQuestions = subject.questions.length;
                            final isExpanded = _expandedSubjects[subject.subjectAttemptId] ?? false;

                            return Container(
                              margin: const EdgeInsets.only(bottom: 16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Заголовок предмета
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _expandedSubjects[subject.subjectAttemptId] = !isExpanded;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              subject.name,
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 12,
                                              vertical: 6,
                                            ),
                                            decoration: BoxDecoration(
                                              color: AppColors.mainBlue.withOpacity(0.1),
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: Text(
                                              '${subject.score} / ${subject.maxScore}',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.mainBlue,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Icon(
                                            isExpanded
                                                ? Icons.expand_less
                                                : Icons.expand_more,
                                            color: Colors.grey[600],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    child: Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(4),
                                          child: LinearProgressIndicator(
                                            value: progress,
                                            backgroundColor: Colors.grey.shade200,
                                            valueColor: AlwaysStoppedAnimation<Color>(
                                              AppColors.mainBlue,
                                            ),
                                            minHeight: 6,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '${((progress) * 100).toStringAsFixed(1)}%',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                            Text(
                                              'Жауап берілді: $answeredCount / $totalQuestions',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[600],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (isExpanded) ...[
                                    const Divider(height: 24),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Сұрақтар:',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(height: 12),
                                          Wrap(
                                            spacing: 8,
                                            runSpacing: 8,
                                            children: subject.questions.map((question) {
                                              final isCorrect = question.answered &&
                                                  question.scoreAwarded == question.maxScore;
                                              final isAnswered = question.answered;
                                              
                                              return Tooltip(
                                                message: isCorrect
                                                    ? 'Дұрыс жауап'
                                                    : isAnswered
                                                        ? 'Қате жауап'
                                                        : 'Жауап берілмеді',
                                                child: InkWell(
                                                  onTap: () {
                                                    sl<HomeBloc>().add(HomeEvent.getSolutionQuestion(attemptId: widget.attemptId, attemptQuestionId: question.attemptQuestionId));
                                                  },
                                                  child:   Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    color: isCorrect
                                                        ? Colors.green
                                                        : Colors.red,
                                                    borderRadius: BorderRadius.circular(8),
                                                    border: Border.all(
                                                      color: isCorrect
                                                          ? Colors.green.shade700
                                                          : Colors.red.shade700,
                                                      width: 2,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '${question.sequence}',
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                              );
                                            }).toList(),
                                          ),
                                          const SizedBox(height: 16),
                                        ],
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            );
                          }),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            child: AppButton(
                              onPressed: () {
                                appRouter.pushReplacement('/home');
                              },
                              text: 'Басты бетке оралу',
                              isLoading: false,
                              isDisabled: false,
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
        ),
      ),
    );
  }

  void _showSolutionModal(BuildContext context, SolutionQuestion solutionQuestion) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (context, scrollController) => Container(
          decoration: const BoxDecoration(
            color: Color(0xFFF4F6FB),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              // Заголовок с кнопкой закрытия
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.mainBlue,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Шешім',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
              // Контент
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Контекст (если есть)
                      if (solutionQuestion.context != null) ...[
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                solutionQuestion.context!.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.mainBlue,
                                ),
                              ),
                              const SizedBox(height: 12),
                              _buildHtmlWithImages(context, solutionQuestion.context!.bodyHtml),
                            ],
                          ),
                        ),
                      ],

                      // Вопрос
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Сұрақ:',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainBlue,
                              ),
                            ),
                            const SizedBox(height: 12),
                            _buildHtmlWithImages(context, solutionQuestion.questionHtml),
                          ],
                        ),
                      ),

                      // Правильные ответы
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.green.shade200,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.green.shade700,
                                  size: 24,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Дұрыс жауап:',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            _buildAnswer(context, solutionQuestion.answer),
                          ],
                        ),
                      ),

                      // Объяснение
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.lightbulb_outline,
                                  color: AppColors.mainBlue,
                                  size: 24,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Түсіндірме:',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.mainBlue,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            _buildHtmlWithImages(context, solutionQuestion.explanationHtml),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnswer(BuildContext context, SolutionAnswer answer) {
    return answer.when(
      single: (kind, correctOption) {
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.green.shade300,
              width: 1,
            ),
          ),
          child: _buildHtmlWithImages(context, correctOption.labelHtml),
        );
      },
      multiple: (kind, correctOptions) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: correctOptions.asMap().entries.map((entry) {
            final index = entry.key;
            final option = entry.value;
            return Container(
              margin: EdgeInsets.only(bottom: index < correctOptions.length - 1 ? 8 : 0),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.green.shade300,
                  width: 1,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildHtmlWithImages(context, option.labelHtml),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
      matching: (kind, rows) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: rows.map((row) {
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.green.shade300,
                  width: 1,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Сол жақ:',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 4),
                        _buildHtmlWithImages(context, row.rowPromptHtml),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.green,
                      size: 20,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Оң жақ:',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 4),
                        _buildHtmlWithImages(context, row.optionLabelHtml),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildHtmlWithImages(BuildContext context, String htmlContent, {double? fontSize, double? lineHeight}) {
    final styleMap = <String, Style>{};
    if (lineHeight != null) {
      styleMap['*'] = Style(
        fontSize: FontSize(fontSize ?? 16),
        lineHeight: LineHeight(lineHeight),
      );
    } else {
      styleMap['*'] = Style(
        fontSize: FontSize(fontSize ?? 16),
      );
    }
    final style = styleMap;

    if (htmlContent.contains('<img')) {
      return Builder(
        builder: (ctx) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ..._extractAndShowImages(ctx, htmlContent),
            Html(
              data: _removeImagesFromHtml(htmlContent),
              shrinkWrap: true,
              extensions: [_mathExtension(), _mathExtension2()],
              style: style,
            ),
          ],
        ),
      );
    } else {
      return Html(
        data: htmlContent,
        shrinkWrap: true,
        extensions: [_mathExtension(), _mathExtension2()],
        style: style,
      );
    }
  }

  List<Widget> _extractAndShowImages(BuildContext context, String htmlContent) {
    final List<Widget> imageWidgets = [];
    final RegExp imgRegex = RegExp(r'<img[^>]*>', caseSensitive: false);
    final matches = imgRegex.allMatches(htmlContent);

    for (final match in matches) {
      final imgTag = match.group(0)!;

      String? src;
      
      var srcRegex = RegExp(r'src="([^"]*)"', caseSensitive: false);
      var srcMatch = srcRegex.firstMatch(imgTag);
      src = srcMatch?.group(1);
      
      if (src == null || src.isEmpty) {
        srcRegex = RegExp(r"src='([^']*)'", caseSensitive: false);
        srcMatch = srcRegex.firstMatch(imgTag);
        src = srcMatch?.group(1);
      }
      
      if (src == null || src.isEmpty) {
        srcRegex = RegExp(r'src=([^\s>]*)', caseSensitive: false);
        srcMatch = srcRegex.firstMatch(imgTag);
        src = srcMatch?.group(1);
      }

      if (src != null && src.isNotEmpty) {
        src = src
            .replaceAll('&amp;', '&')
            .replaceAll('&lt;', '<')
            .replaceAll('&gt;', '>')
            .replaceAll('&quot;', '"')
            .replaceAll('&#39;', "'")
            .replaceAll('&nbsp;', ' ')
            .trim();
        
        src = src.replaceAll(RegExp(r'\s+'), '');
      }

      final styleRegex = RegExp(r'style="([^"]*)"', caseSensitive: false);
      final styleMatch = styleRegex.firstMatch(imgTag);
      final style = styleMatch?.group(1);

      if (src != null && src.isNotEmpty) {
        final imageUrl = src;
        double? width;
        double? height;

        if (style != null) {
          final widthRegex = RegExp(r'width:\s*(\d+)px');
          final heightRegex = RegExp(r'height:\s*(\d+)px');

          final widthMatch = widthRegex.firstMatch(style);
          final heightMatch = heightRegex.firstMatch(style);

          if (widthMatch != null) {
            width = double.tryParse(widthMatch.group(1)!);
          }
          if (heightMatch != null) {
            height = double.tryParse(heightMatch.group(1)!);
          }
        }

        imageWidgets.add(
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => _FullScreenImageViewer(imageUrl: imageUrl),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 8),
              constraints: BoxConstraints(
                maxWidth: width ?? double.infinity,
                maxHeight: height ?? 300,
              ),
              child: CorsAwareImage(
                imageUrl: imageUrl,
                fit: BoxFit.contain,
                placeholder: const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        );
      }
    }

    return imageWidgets;
  }

  String _removeImagesFromHtml(String htmlContent) {
    return htmlContent.replaceAll(RegExp(r'<img[^>]*>', caseSensitive: false), '');
  }

  TagExtension _mathExtension() => TagExtension(
        tagsToExtend: {"span"},
        builder: (ctx) {
          try {
            final innerHtml = ctx.innerHtml;
            if (!innerHtml.contains(r'\(') && !innerHtml.contains(r'\[')) {
              return Text(innerHtml);
            }
            final formula = innerHtml.replaceAll(r"\(", "").replaceAll(r"\)", "").replaceAll(r"\[", "").replaceAll(r"\]", "").trim();
            if (formula.isEmpty) {
              return Text(innerHtml);
            }
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              margin: const EdgeInsets.symmetric(vertical: 2),
              child: Math.tex(
                formula,
                mathStyle: MathStyle.text,
                textStyle: const TextStyle(fontSize: 18, color: Colors.black),
              ),
            );
          } catch (e) {
            return Text(ctx.innerHtml);
          }
        },
      );

  TagExtension _mathExtension2() => TagExtension(
        tagsToExtend: {"span"},
        builder: (ctx) {
          try {
            final innerHtml = ctx.innerHtml;
            if (!innerHtml.contains(r'\(') && !innerHtml.contains(r'\[')) {
              return Text(innerHtml);
            }
            final formula = innerHtml.replaceAll(r"\(", "").replaceAll(r"\)", "").replaceAll(r"\[", "").replaceAll(r"\]", "").trim();
            if (formula.isEmpty) {
              return Text(innerHtml);
            }
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              margin: const EdgeInsets.symmetric(vertical: 2),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Math.tex(
                  formula,
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            );
          } catch (e) {
            return Text(ctx.innerHtml);
          }
        },
      );
}

// Виджет для полноэкранного просмотра изображения
class _FullScreenImageViewer extends StatelessWidget {
  final String imageUrl;

  const _FullScreenImageViewer({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: InteractiveViewer(
          minScale: 0.5,
          maxScale: 4.0,
          child: CorsAwareImage(
            imageUrl: imageUrl,
            fit: BoxFit.contain,
            placeholder: const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
            errorWidget: (context, url, error) => const Center(
              child: Icon(Icons.error, color: Colors.white, size: 48),
            ),
          ),
        ),
      ),
    );
  }
}

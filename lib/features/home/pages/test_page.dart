import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ubt_pbb/config/constants/app_colors.dart';
import 'package:ubt_pbb/config/getit/get_injection.dart';
import 'package:ubt_pbb/config/widgets/app_button.dart';
import 'package:ubt_pbb/config/endpoints/dio_sender.dart';
import 'package:ubt_pbb/config/endpoints/endpoints.dart';
import 'package:ubt_pbb/config/storage/flutter_secure_storage_func.dart';
import 'package:ubt_pbb/features/home/pages/bloc/home_bloc.dart';
import 'package:ubt_pbb/features/home/pages/widgets/finish_dialog_widget.dart';
import 'package:ubt_pbb/features/home/models/test_model.dart';

class TestPage extends StatefulWidget {
  final int? pairId;
  final ExamAttempt? examAttempt;

  const TestPage({
    super.key, 
    this.pairId,
    this.examAttempt,
  });

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  late HomeBloc _homeBloc;
  int _selectedSubjectIndex = 0;
  int _currentQuestionIndex = 0;
  final Map<String, dynamic> _answers = {};
  final ScrollController _scrollController = ScrollController();
  String? _selectedRowId;
  Timer? _autoSaveTimer;
  Timer? _countdownTimer;
  int _remainingSeconds = 0;
  bool _isTimeExpired = false;
  bool _timerInitialized = false;
  bool _isSidebarCollapsed = true; // Боковая панель скрыта по умолчанию

  @override
  void initState() {
    super.initState();
    _homeBloc = sl.get<HomeBloc>();
    // Если examAttempt передан, устанавливаем его в блок напрямую
    if (widget.examAttempt != null && !_homeBloc.isClosed) {
      _homeBloc.add(HomeEvent.setExamAttempt(examAttempt: widget.examAttempt!));
    } else if (widget.pairId != null && !_homeBloc.isClosed) {
      // Если передан pairId, запускаем экзамен
      _homeBloc.add(HomeEvent.startExam(id: widget.pairId!));
    }
    // Запускаем таймер для автоматической отправки ответов каждые 20 секунд
    _startAutoSaveTimer();
  }

  @override
  void dispose() {
    _autoSaveTimer?.cancel();
    _countdownTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _startAutoSaveTimer() {
    _autoSaveTimer?.cancel();
    _autoSaveTimer = Timer.periodic(const Duration(seconds: 20), (timer) {
      _sendAnswersToBackend();
    });
  }

  void _startCountdownTimer(ExamAttempt examAttempt) {
    _countdownTimer?.cancel();
    
    // Используем remaining_seconds или вычисляем из expires_at
    if (examAttempt.remainingSeconds > 0) {
      _remainingSeconds = examAttempt.remainingSeconds;
    } else {
      // Вычисляем время до expires_at
      try {
        final expiresAt = DateTime.parse(examAttempt.expiresAt);
        final now = DateTime.now();
        final difference = expiresAt.difference(now);
        _remainingSeconds = difference.inSeconds.clamp(0, 999999); // Максимум ~11 дней
      } catch (e) {
        debugPrint('⚠️ Error parsing expires_at: $e');
        // Используем time_limit_minutes как fallback
        _remainingSeconds = examAttempt.timeLimitMinutes * 60;
      }
    }

    // Если время уже истекло, сразу завершаем тест
    if (_remainingSeconds <= 0) {
      _remainingSeconds = 0;
      _isTimeExpired = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _autoFinishTest();
      });
      return;
    }

    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
          
          // Показываем предупреждение при остатке 5 минут и 1 минута
          if (_remainingSeconds == 300) {
            // 5 минут
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Ескерту: 5 минут қалды!'),
                backgroundColor: Colors.orange,
                duration: Duration(seconds: 3),
              ),
            );
          } else if (_remainingSeconds == 60) {
            // 1 минута
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Ескерту: 1 минут қалды!'),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 3),
              ),
            );
          }
        } else {
          _remainingSeconds = 0;
          _isTimeExpired = true;
          timer.cancel();
          // Автоматически завершаем тест
          _autoFinishTest();
        }
      });
    });
  }

  Future<void> _autoFinishTest() async {
    if (_isTimeExpired && mounted) {
      // Показываем предупреждение о том, что время истекло
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Уақыт аяқталды! Тест автоматты түрде аяқталады.'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
      }
      
      // Небольшая задержка перед завершением
      await Future.delayed(const Duration(seconds: 1));
      
      if (!mounted) return;
      
      // Отправляем ответы перед завершением
      await _sendAnswersToBackend();
      
      if (!mounted) return;
      
      // Показываем диалог завершения
      final result = await showDialog<bool>(
        context: context,
        barrierDismissible: false, // Нельзя закрыть диалог
        builder: (context) => FinishDialogWidget(
          onBeforeFinish: _sendAnswersToBackend,
        ),
      );
      
      // Если тест успешно завершен, возвращаемся на главную страницу
      if (result == true && mounted) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      }
    }
  }

  String _formatTime(int seconds) {
    final hours = seconds ~/ 3600;
    final minutes = (seconds % 3600) ~/ 60;
    final secs = seconds % 60;
    
    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
    } else {
      return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
    }
  }

  void _scrollToQuestion(int index) {
    setState(() {
      _currentQuestionIndex = index;
      _selectedRowId = null; // Сбрасываем выбор при смене вопроса
    });
    // Прокрутка в начало для лучшей визуализации
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          0.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _goToNextQuestion(int totalQuestions) {
    if (_currentQuestionIndex < totalQuestions - 1) {
      _scrollToQuestion(_currentQuestionIndex + 1);
    }
  }

  void _goToPreviousQuestion() {
    if (_currentQuestionIndex > 0) {
      _scrollToQuestion(_currentQuestionIndex - 1);
    }
  }

  // Преобразование ответов в формат API
  Map<String, dynamic> _prepareAnswersForApi() {
    final List<Map<String, dynamic>> answersList = [];

    // Получаем examModel из состояния
    final state = _homeBloc.state;
    state.maybeWhen(
      loaded: (examModel) {
        final testModel = examModel.testModel;
        if (testModel == null || testModel.subjects.isEmpty) {
          debugPrint('⚠️ TestModel is null or has no subjects');
          return;
        }

        // Проходим по всем предметам
        for (final subject in testModel.subjects) {
          final questions = subject.questions ?? [];
          
          // Проходим по всем вопросам предмета
          for (final question in questions) {
            try {
              final questionMap = question as Map<String, dynamic>;
              final attemptQuestionId = questionMap['attempt_question_id'];
              
              // Проверяем и преобразуем attempt_question_id
              int? questionId;
              if (attemptQuestionId is int) {
                questionId = attemptQuestionId;
              } else if (attemptQuestionId is num) {
                questionId = attemptQuestionId.toInt();
              } else {
                debugPrint('⚠️ Invalid attempt_question_id: $attemptQuestionId (${attemptQuestionId.runtimeType})');
                continue;
              }

              final answerKey = '${subject.id}_$questionId';
              final answer = _answers[answerKey];
              
              if (answer == null) continue;

              final questionType = questionMap['question_type'] as String? ?? 'single';
              Map<String, dynamic> answerPayload = {};

              if (questionType == 'single' || questionType == 'context_single') {
                // Один ответ
                if (answer is String) {
                  answerPayload['selected_option_id'] = answer;
                } else {
                  debugPrint('⚠️ Invalid answer type for single question: ${answer.runtimeType}');
                  continue;
                }
              } else if (questionType == 'multiple') {
                // Несколько ответов
                if (answer is List) {
                  answerPayload['selected_option_ids'] = answer.cast<String>();
                } else {
                  debugPrint('⚠️ Invalid answer type for multiple question: ${answer.runtimeType}');
                  continue;
                }
              } else if (questionType == 'matching') {
                // Сопоставление
                if (answer is Map) {
                  final matches = answer as Map<String, dynamic>;
                  final rows = matches.entries.map((entry) {
                    return {
                      'row_id': entry.key.toString(),
                      'option_id': entry.value.toString(),
                    };
                  }).toList();
                  answerPayload['rows'] = rows;
                } else {
                  debugPrint('⚠️ Invalid answer type for matching question: ${answer.runtimeType}');
                  continue;
                }
              }

              answersList.add({
                'attempt_question_id': questionId,
                'answer_payload': answerPayload,
              });
            } catch (e, stackTrace) {
              debugPrint('⚠️ Error processing question: $e');
              debugPrint('   StackTrace: $stackTrace');
              continue;
            }
          }
        }
      },
      orElse: () {
        debugPrint('⚠️ State is not loaded, cannot prepare answers');
      },
    );

    return {'answers': answersList};
  }

  // Отправка ответов на бэкенд
  Future<void> _sendAnswersToBackend() async {
    try {
      final attemptId = await FlutterSecureStorageFunc.getAttemptId();
      if (attemptId == null) {
        debugPrint('⚠️ AttemptId is null, cannot send answers');
        return;
      }

      final answersData = _prepareAnswersForApi();
      
      // Отправляем только если есть ответы
      final answersList = answersData['answers'] as List;
      if (answersList.isEmpty) {
        debugPrint('ℹ️ No answers to send');
        return;
      }

      debugPrint('📤 Sending answers to backend:');
      debugPrint('   AttemptId: $attemptId');
      debugPrint('   Endpoint: ${Endpoints.sendAnswers(attemptId)}');
      debugPrint('   Answers count: ${answersList.length}');
      debugPrint('   Data: $answersData');
      
      final response = await DioSender.patch(
        Endpoints.sendAnswers(attemptId),
        answersData,
      );

      if (response.statusCode == 200) {
        debugPrint('✅ Answers sent successfully');
      } else {
        debugPrint('⚠️ Failed to send answers: ${response.statusCode}');
        debugPrint('   Response: ${response.data}');
      }
    } on ApiException catch (e) {
      debugPrint('❌ ApiException sending answers: ${e.message}');
      // Не показываем ошибку пользователю, чтобы не мешать прохождению теста
    } on DioException catch (e) {
      debugPrint('❌ DioException sending answers:');
      debugPrint('   Message: ${e.message}');
      debugPrint('   Status Code: ${e.response?.statusCode}');
      debugPrint('   Response Data: ${e.response?.data}');
      debugPrint('   Request Path: ${e.requestOptions.path}');
      debugPrint('   Request Data: ${e.requestOptions.data}');
    } catch (e, stackTrace) {
      debugPrint('❌ Unexpected error sending answers: $e');
      debugPrint('   StackTrace: $stackTrace');
      // Не показываем ошибку пользователю, чтобы не мешать прохождению теста
    }
  }


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;
        
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.mainBlue,
            foregroundColor: Colors.white,
            elevation: 2,
            actions: [
              // Таймер
              BlocBuilder<HomeBloc, HomeState>(
                bloc: _homeBloc,
                builder: (context, state) {
                  return state.maybeWhen(
                    loaded: (examModel) {
                      final testModel = examModel.testModel;
                      if (testModel != null) {
                        if (!_timerInitialized) {
                          _timerInitialized = true;
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            if (mounted && !_isTimeExpired) {
                              _startCountdownTimer(testModel);
                            }
                          });
                        }
                        
                        final isWarning = _remainingSeconds <= 300;
                        final isCritical = _remainingSeconds <= 60;
                        
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20,),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            color: isCritical
                                ? Colors.red.shade700
                                : isWarning
                                    ? Colors.orange.shade600
                                    : AppColors.mainBlue.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                              width: 1.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.timer_outlined,
                                size: 22,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                _formatTime(_remainingSeconds),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                    orElse: () => const SizedBox.shrink(),
                  );
                },
              ),
              const SizedBox(width: 8),
              // Кнопка завершения теста
              BlocBuilder<HomeBloc, HomeState>(
                bloc: _homeBloc,
                builder: (context, state) {
                  return state.maybeWhen(
                    loaded: (_) => Container(
                      margin: const EdgeInsets.only(right: 8),
                      child: ElevatedButton.icon(
                        onPressed: _isTimeExpired
                            ? null
                            : () async {
                                await _sendAnswersToBackend();
                                final result = await showDialog<bool>(
                                  context: context,
                                  builder: (context) => FinishDialogWidget(
                                    onBeforeFinish: _sendAnswersToBackend,
                                  ),
                                );
                                if (result == true && mounted) {
                                  Navigator.of(context).popUntil((route) => route.isFirst);
                                }
                              },
                        icon: const Icon(Icons.check_circle, size: 22),
                        label: Text(
                          isDesktop ? 'Тестті аяқтау' : 'Аяқтау',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade600,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          elevation: 3,
                          shadowColor: Colors.red.shade300,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    orElse: () => const SizedBox.shrink(),
                  );
                },
              ),
            ],
          ),
          body: BlocBuilder<HomeBloc, HomeState>(
            bloc: _homeBloc,
            builder: (context, state) {
              return state.when(
                initial: () => const Center(child: Text('Загрузка...')),
                loading: () => const Center(
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: AppColors.mainBlue,
                  ),
                ),
                loadingFailure: (message) => Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          message,
                          style: const TextStyle(color: AppColors.error),
                        ),
                        const SizedBox(height: 10),
                        AppButton(
                          onPressed: () {
                            if (widget.pairId != null && !_homeBloc.isClosed) {
                              _homeBloc.add(HomeEvent.startExam(id: widget.pairId!));
                            }
                          },
                          text: 'Повторить',
                          isLoading: false,
                          isDisabled: widget.pairId == null,
                        ),
                        const SizedBox(height: 10),
                        AppButton(
                          onPressed: _isTimeExpired
                            ? null
                            : () async {
                                await _sendAnswersToBackend();
                                final result = await showDialog<bool>(
                                  context: context,
                                  builder: (context) => FinishDialogWidget(
                                    onBeforeFinish: _sendAnswersToBackend,
                                  ),
                                );
                                if (result == true && mounted) {
                                  Navigator.of(context).popUntil((route) => route.isFirst);
                                }
                          },
                          text: 'Тестті аяқтау',
                          isLoading: false,
                          isDisabled: false,
                        ),
                      ],
                    ),
                  ),
                ),
                loaded: (examModel) {
                  final testModel = examModel.testModel;
                  if (testModel == null || testModel.subjects.isEmpty) {
                    return const Center(child: Text('Нет данных'));
                  }

                  if (_selectedSubjectIndex >= testModel.subjects.length) {
                    _selectedSubjectIndex = 0;
                  }

                  final selectedSubject = testModel.subjects[_selectedSubjectIndex];
                  final questions = selectedSubject.questions ?? [];
                  
                  if (_currentQuestionIndex >= questions.length) {
                    _currentQuestionIndex = 0;
                  }

                  // Адаптивная структура: боковая панель слева на десктопе
                  if (isDesktop) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Боковая панель с предметами (скрываемая)
                        if (!_isSidebarCollapsed)
                          _buildSubjectsSidebar(testModel, isDesktop),
                        if (!_isSidebarCollapsed)
                          Container(
                            width: 1,
                            color: Colors.grey.shade300,
                          ),
                        // Основной контент
                        Expanded(
                          child: _buildMainContent(
                            selectedSubject,
                            questions,
                            isDesktop,
                          ),
                        ),
                      ],
                    );
                  } else {
                    // Мобильная версия: предметы в выпадающем списке или вверху
                    return Column(
                      children: [
                        // Компактная панель предметов для мобильных
                        _buildMobileSubjectsBar(testModel),
                        // Основной контент
                        Expanded(
                          child: _buildMainContent(
                            selectedSubject,
                            questions,
                            isDesktop,
                          ),
                        ),
                      ],
                    );
                  }
                },
              );
            },
          ),
        );
      },
    );
  }

  // Боковая панель с предметами для десктопа
  Widget _buildSubjectsSidebar(ExamAttempt testModel, bool isDesktop) {
    return Container(
      width: isDesktop ? 220 : 200,
      color: Colors.grey.shade50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Заголовок панели
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.mainBlue,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Row(
              children: [
                const Icon(Icons.menu_book, color: Colors.white, size: 18),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'Пәндер',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Список предметов
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: testModel.subjects.length,
              itemBuilder: (context, index) {
                final subject = testModel.subjects[index];
                final isSelected = index == _selectedSubjectIndex;
                final subjectQuestions = subject.questions ?? [];
                
                // Подсчитываем отвеченные вопросы
                int answeredCount = 0;
                for (final question in subjectQuestions) {
                  try {
                    final questionMap = question as Map<String, dynamic>;
                    final attemptQuestionId = questionMap['attempt_question_id'];
                    int? questionId;
                    if (attemptQuestionId is int) {
                      questionId = attemptQuestionId;
                    } else if (attemptQuestionId is num) {
                      questionId = attemptQuestionId.toInt();
                    }
                    if (questionId != null) {
                      final answerKey = '${subject.id}_$questionId';
                      if (_answers.containsKey(answerKey) && _answers[answerKey] != null) {
                        answeredCount++;
                      }
                    }
                  } catch (e) {
                    // Игнорируем ошибки
                  }
                }

                return InkWell(
                  onTap: () {
                    setState(() {
                      _selectedSubjectIndex = index;
                      _currentQuestionIndex = 0;
                      _selectedRowId = null;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.mainBlue
                          : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: isSelected
                            ? AppColors.mainBlue
                            : Colors.grey.shade300,
                        width: isSelected ? 1.5 : 1,
                      ),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: AppColors.mainBlue.withOpacity(0.3),
                                blurRadius: 4,
                                offset: const Offset(0, 1),
                              ),
                            ]
                          : null,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                subject.displayName,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: isSelected ? Colors.white : Colors.black87,
                                ),
                              ),
                            ),
                            if (isSelected)
                              const Icon(
                                Icons.check_circle,
                                color: Colors.white,
                                size: 16,
                              ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(
                              Icons.help_outline,
                              size: 14,
                              color: isSelected
                                  ? Colors.white70
                                  : Colors.grey[600],
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${answeredCount}/${subjectQuestions.length}',
                              style: TextStyle(
                                fontSize: 12,
                                color: isSelected
                                    ? Colors.white70
                                    : Colors.grey[700],
                              ),
                            ),
                            const Spacer(),
                            if (subject.maxScore != null)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 3,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Colors.white.withOpacity(0.2)
                                      : AppColors.mainBlue.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  '${subject.maxScore} балл',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: isSelected
                                        ? Colors.white
                                        : AppColors.mainBlue,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Компактная панель предметов для мобильных
  Widget _buildMobileSubjectsBar(ExamAttempt testModel) {
    return Container(
      height: 50,
      color: Colors.grey.shade100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        itemCount: testModel.subjects.length,
        itemBuilder: (context, index) {
          final subject = testModel.subjects[index];
          final isSelected = index == _selectedSubjectIndex;
          
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedSubjectIndex = index;
                _currentQuestionIndex = 0;
                _selectedRowId = null;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 3),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.mainBlue : Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isSelected ? AppColors.mainBlue : Colors.grey.shade300,
                  width: isSelected ? 1.5 : 1,
                ),
              ),
              child: Center(
                child: Text(
                  subject.displayName,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Основной контент с вопросами
  Widget _buildMainContent(SubjectAttempt selectedSubject, List<dynamic> questions, bool isDesktop) {
    return Column(
      children: [
        // Компактная панель с информацией о предмете и кнопками управления
        Container(
          padding: EdgeInsets.all(isDesktop ? 6 : 4),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade200, width: 1),
            ),
          ),
          child: Row(
            children: [
              // Кнопка для показа/скрытия боковой панели (только на десктопе)
              if (isDesktop)
                IconButton(
                  icon: Icon(_isSidebarCollapsed ? Icons.menu : Icons.menu_open),
                  onPressed: () {
                    setState(() {
                      _isSidebarCollapsed = !_isSidebarCollapsed;
                    });
                  },
                  tooltip: _isSidebarCollapsed ? 'Показать предметы' : 'Скрыть предметы',
                ),
              // Компактная информация о предмете
              Expanded(
                child: Row(
                  children: [
                    Text(
                      selectedSubject.displayName,
                      style: TextStyle(
                        fontSize: isDesktop ? 14 : 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainBlue,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${_currentQuestionIndex + 1}/${questions.length}',
                      style: TextStyle(
                        fontSize: isDesktop ? 12 : 11,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              // Компактная навигация по вопросам (только первые 5 кнопок)
              if (questions.isNotEmpty && questions.length <= 10)
                SizedBox(
                  height: 32,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: questions.length,
                    itemBuilder: (context, index) {
                      final question = questions[index] as Map<String, dynamic>;
                      final isCurrent = index == _currentQuestionIndex;
                      final answerKey = '${selectedSubject.id}_${question['attempt_question_id'] as int}';
                      final hasAnswer = _answers.containsKey(answerKey) && _answers[answerKey] != null;
                      
                      return GestureDetector(
                        onTap: () => _scrollToQuestion(index),
                        child: Container(
                          width: 28,
                          height: 28,
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                            color: isCurrent
                                ? AppColors.mainBlue
                                : hasAnswer
                                    ? Colors.green.shade400
                                    : Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: isCurrent
                                  ? AppColors.mainBlue
                                  : hasAnswer
                                      ? Colors.green.shade600
                                      : Colors.grey.shade400,
                              width: isCurrent ? 2 : 1,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                color: isCurrent ? Colors.white : Colors.black87,
                                fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
        // Показываем только выбранный вопрос - занимает все доступное пространство
        Expanded(
          child: questions.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.help_outline, size: 64, color: Colors.grey[400]),
                      const SizedBox(height: 10),
                      Text(
                        'Нет вопросов в этом предмете',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  controller: _scrollController,
                  padding: EdgeInsets.all(isDesktop ? 8 : 6),
                  child: _currentQuestionIndex < questions.length
                      ? _buildQuestionCard(
                          questions[_currentQuestionIndex] as Map<String, dynamic>,
                          _currentQuestionIndex + 1,
                          selectedSubject.id,
                          true,
                        )
                      : const SizedBox.shrink(),
                ),
        ),
        // Кнопки навигации и завершения
        if (questions.isNotEmpty)
          Container(
            padding: EdgeInsets.all(isDesktop ? 8 : 6),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 4,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: _currentQuestionIndex > 0
                          ? () => _goToPreviousQuestion()
                          : null,
                      icon: const Icon(Icons.arrow_back),
                      tooltip: 'Артқа',
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.mainBlue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(12),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '${_currentQuestionIndex + 1} / ${questions.length}',
                        style: TextStyle(
                          fontSize: isDesktop ? 12 : 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: _currentQuestionIndex < questions.length - 1
                          ? () => _goToNextQuestion(questions.length)
                          : null,
                      icon: const Icon(Icons.arrow_forward),
                      tooltip: 'Келесі',
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.mainBlue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildQuestionCard(
    Map<String, dynamic> question,
    int questionNumber,
    int subjectId,
    bool isCurrent,
  ) {
    final questionType = question['question_type'] as String? ?? 'single';
    final attemptQuestionId = question['attempt_question_id'] as int;
    final renderPayload = question['render_payload'] as Map<String, dynamic>? ?? {};
    final contextPayload = question['context_payload'] as Map<String, dynamic>?;
    final promptHtml = (renderPayload['prompt_html'] as String? ?? '').trim();
    final answerKey = '${subjectId}_$attemptQuestionId';
    
    // Пропускаем пустые вопросы
    if (promptHtml.isEmpty && contextPayload == null) {
      return const SizedBox.shrink();
    }

    return Card(
      key: ValueKey('question_$questionNumber'),
      margin: EdgeInsets.zero,
      elevation: isCurrent ? 2 : 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: isCurrent
            ? BorderSide(color: AppColors.mainBlue, width: 1.5)
            : BorderSide.none,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Компактный номер вопроса
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.mainBlue,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Вопрос $questionNumber',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: _getQuestionTypeColor(questionType).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Text(
                    _getQuestionTypeLabel(questionType),
                    style: TextStyle(
                      color: _getQuestionTypeColor(questionType),
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            // Контекст (для context_single)
            if (contextPayload != null) ...[
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.blue.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (contextPayload['title'] != null)
                      Text(
                        contextPayload['title'] as String,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade900,
                          fontSize: 13,
                        ),
                      ),
                    if (contextPayload['body_html'] != null) ...[
                      const SizedBox(height: 6),
                      _buildHtmlWithImages(
                        contextPayload['body_html'] as String,
                        fontSize: 12,
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 6),
            ],
            // Текст вопроса
            if (promptHtml.isNotEmpty)
              _buildHtmlWithImages(
                promptHtml,
                fontSize: 15,
                lineHeight: 1.5,
              )
            else if (contextPayload == null)
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Текст вопроса отсутствует',
                  style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic, fontSize: 12),
                ),
              ),
            const SizedBox(height: 8),
            // Варианты ответов в зависимости от типа
            _buildQuestionOptions(
              questionType,
              renderPayload,
              answerKey,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionOptions(
    String questionType,
    Map<String, dynamic> renderPayload,
    String answerKey,
  ) {
    switch (questionType) {
      case 'single':
        return _buildSingleChoiceOptions(renderPayload, answerKey);
      case 'multiple':
        return _buildMultipleChoiceOptions(renderPayload, answerKey);
      case 'matching':
        return _buildMatchingOptions(renderPayload, answerKey);
      case 'context_single':
        return _buildSingleChoiceOptions(renderPayload, answerKey);
      default:
        return _buildSingleChoiceOptions(renderPayload, answerKey);
    }
  }

  Widget _buildSingleChoiceOptions(
    Map<String, dynamic> renderPayload,
    String answerKey,
  ) {
    final options = (renderPayload['options'] as List<dynamic>?) ?? [];
    final currentAnswer = _answers[answerKey] as String?;
    
    if (options.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Варианты ответов отсутствуют',
          style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
        ),
      );
    }

    return Column(
      children: options.where((option) {
        final optionMap = option as Map<String, dynamic>;
        final optionId = optionMap['id'] as String? ?? '';
        return optionId.isNotEmpty;
      }).map((option) {
        final optionMap = option as Map<String, dynamic>;
        final optionId = optionMap['id'] as String? ?? '';
        final labelHtml = (optionMap['label_html'] as String? ?? '').trim();
        final isSelected = currentAnswer == optionId;

        return Container(
          margin: const EdgeInsets.only(bottom: 6),
          child: InkWell(
            onTap: () {
              setState(() {
                _answers[answerKey] = optionId;
              });
            },
            borderRadius: BorderRadius.circular(6),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.mainBlue.withOpacity(0.1)
                    : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: isSelected ? AppColors.mainBlue : Colors.grey.shade300,
                  width: isSelected ? 1.5 : 1,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected
                            ? AppColors.mainBlue
                            : Colors.grey.shade400,
                        width: 1.5,
                      ),
                      color: isSelected
                          ? AppColors.mainBlue
                          : Colors.transparent,
                    ),
                    child: isSelected
                        ? const Icon(
                            Icons.check,
                            size: 12,
                            color: Colors.white,
                          )
                        : null,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildHtmlWithImages(
                      labelHtml,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildMultipleChoiceOptions(
    Map<String, dynamic> renderPayload,
    String answerKey,
  ) {
    final options = (renderPayload['options'] as List<dynamic>?) ?? [];
    final maxSelect = renderPayload['max_select'] as int? ?? options.length;
    final currentAnswers = (_answers[answerKey] as List<dynamic>?)?.cast<String>() ?? [];
    
    if (options.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Варианты ответов отсутствуют',
          style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
        ),
      );
    }

    return Column(
      children: options.where((option) {
        final optionMap = option as Map<String, dynamic>;
        final optionId = optionMap['id'] as String? ?? '';
        return optionId.isNotEmpty;
      }).map((option) {
        final optionMap = option as Map<String, dynamic>;
        final optionId = optionMap['id'] as String? ?? '';
        final labelHtml = (optionMap['label_html'] as String? ?? '').trim();
        final isSelected = currentAnswers.contains(optionId);

        return Container(
          margin: const EdgeInsets.only(bottom: 6),
          child: InkWell(
            onTap: () {
              setState(() {
                final newAnswers = List<String>.from(currentAnswers);
                if (isSelected) {
                  newAnswers.remove(optionId);
                } else {
                  if (newAnswers.length < maxSelect) {
                    newAnswers.add(optionId);
                  }
                }
                _answers[answerKey] = newAnswers;
              });
            },
            borderRadius: BorderRadius.circular(6),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.mainBlue.withOpacity(0.1)
                    : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: isSelected ? AppColors.mainBlue : Colors.grey.shade300,
                  width: isSelected ? 1.5 : 1,
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(
                        color: isSelected
                            ? AppColors.mainBlue
                            : Colors.grey.shade400,
                        width: 1.5,
                      ),
                      color: isSelected
                          ? AppColors.mainBlue
                          : Colors.transparent,
                    ),
                    child: isSelected
                        ? const Icon(
                            Icons.check,
                            size: 12,
                            color: Colors.white,
                          )
                        : null,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildHtmlWithImages(
                      labelHtml,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildMatchingOptions(
    Map<String, dynamic> renderPayload,
    String answerKey,
  ) {
    final rows = (renderPayload['rows'] as List<dynamic>?) ?? [];
    final options = (renderPayload['options'] as List<dynamic>?) ?? [];
    final currentMatches = (_answers[answerKey] as Map<String, String>?) ?? {};
    
    if (rows.isEmpty || options.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Элементы для сопоставления отсутствуют',
          style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
        ),
      );
    }

    // Цвета для пар (каждая пара получает свой цвет)
    final matchColors = [
      AppColors.mainBlue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.pink,
      Colors.indigo,
      Colors.amber,
    ];

    // Функция для получения цвета пары по rowId
    Color? getMatchColorForRow(String rowId) {
      if (!currentMatches.containsKey(rowId)) return null;
      // Находим индекс row в списке для определения цвета
      final rowIndex = rows.indexWhere((r) => (r as Map<String, dynamic>)['id'] == rowId);
      if (rowIndex == -1) return null;
      return matchColors[rowIndex % matchColors.length];
    }
    
    // Функция для получения цвета пары по optionId
    Color? getMatchColorForOption(String optionId) {
      final matchedRowId = currentMatches.entries
          .firstWhere((e) => e.value == optionId, orElse: () => const MapEntry('', '')).key;
      if (matchedRowId.isEmpty) return null;
      return getMatchColorForRow(matchedRowId);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Сопоставьте элементы:',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 10),
        // Две колонки: слева rows, справа options
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Левая колонка - rows
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Слева:',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 6),
                  ...rows.map((row) {
                    final rowMap = row as Map<String, dynamic>;
                    final rowId = rowMap['id'] as String;
                    final rowPrompt = (rowMap['prompt_html'] as String? ?? '').trim();
                    final isSelected = _selectedRowId == rowId;
                    final matchColor = getMatchColorForRow(rowId);

                    return Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            // Если уже выбран этот же элемент, снимаем выбор
                            _selectedRowId = _selectedRowId == rowId ? null : rowId;
                          });
                        },
                        borderRadius: BorderRadius.circular(6),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.mainBlue.withOpacity(0.2)
                                : matchColor != null
                                    ? matchColor.withOpacity(0.15)
                                    : Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.mainBlue
                                  : matchColor != null
                                      ? matchColor
                                      : Colors.grey.shade300,
                              width: isSelected ? 1.5 : 1,
                            ),
                          ),
                          child: _buildHtmlWithImages(
                            rowPrompt,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
            const SizedBox(width: 16),
            // Правая колонка - options
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Справа:',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 6),
                  ...options.where((option) {
                    final optionMap = option as Map<String, dynamic>;
                    final optionId = optionMap['id'] as String? ?? '';
                    return optionId.isNotEmpty;
                  }).map((option) {
                    final optionMap = option as Map<String, dynamic>;
                    final optionId = optionMap['id'] as String? ?? '';
                    final optionLabel = (optionMap['label_html'] as String? ?? '').trim();
                    
                    // Находим, с каким row сопоставлен этот option
                    final matchedRowId = currentMatches.entries
                        .firstWhere((e) => e.value == optionId, orElse: () => const MapEntry('', '')).key;
                    final matchColor = getMatchColorForOption(optionId);
                    final isMatched = matchedRowId.isNotEmpty;

                    return Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (_selectedRowId != null) {
                              // Сопоставляем выбранный row с этим option
                              final newMatches = Map<String, String>.from(currentMatches);
                              // Удаляем предыдущее сопоставление для этого row
                              newMatches.remove(_selectedRowId);
                              // Удаляем предыдущее сопоставление для этого option
                              newMatches.removeWhere((key, value) => value == optionId);
                              // Создаем новое сопоставление
                              newMatches[_selectedRowId!] = optionId;
                              _answers[answerKey] = newMatches;
                              _selectedRowId = null; // Сбрасываем выбор
                            }
                          });
                        },
                        borderRadius: BorderRadius.circular(6),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: matchColor != null
                                ? matchColor.withOpacity(0.15)
                                : Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: matchColor != null
                                  ? matchColor
                                  : Colors.grey.shade300,
                              width: isMatched ? 1.5 : 1,
                            ),
                          ),
                          child: _buildHtmlWithImages(
                            optionLabel,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        // Кнопка "Заново выбрать"
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {
              setState(() {
                _answers[answerKey] = <String, String>{};
                _selectedRowId = null;
              });
            },
            icon: const Icon(Icons.refresh, size: 16),
            label: const Text('Заново выбрать', style: TextStyle(fontSize: 12)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade300,
              foregroundColor: Colors.black87,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Color _getQuestionTypeColor(String type) {
    switch (type) {
      case 'single':
        return Colors.green;
      case 'multiple':
        return Colors.orange;
      case 'matching':
        return Colors.purple;
      case 'context_single':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  String _getQuestionTypeLabel(String type) {
    switch (type) {
      case 'single':
        return 'Один ответ';
      case 'multiple':
        return 'Несколько ответов';
      case 'matching':
        return 'Сопоставление';
      case 'context_single':
        return 'С контекстом';
      default:
        return type;
    }
  }

  // Метод для отображения HTML с изображениями
  Widget _buildHtmlWithImages(String htmlContent, {double? fontSize, double? lineHeight}) {
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
        builder: (context) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ..._extractAndShowImages(context, htmlContent),
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

  // Извлечение изображений из HTML
  List<Widget> _extractAndShowImages(BuildContext context, String htmlContent) {
    final List<Widget> imageWidgets = [];
    final RegExp imgRegex = RegExp(r'<img[^>]*>', caseSensitive: false);
    final matches = imgRegex.allMatches(htmlContent);

    for (final match in matches) {
      final imgTag = match.group(0)!;

      // Пробуем разные варианты извлечения src
      String? src;
      
      // Вариант 1: src="..."
      var srcRegex = RegExp(r'src="([^"]*)"', caseSensitive: false);
      var srcMatch = srcRegex.firstMatch(imgTag);
      src = srcMatch?.group(1);
      
      // Вариант 2: src='...'
      if (src == null || src.isEmpty) {
        srcRegex = RegExp(r"src='([^']*)'", caseSensitive: false);
        srcMatch = srcRegex.firstMatch(imgTag);
        src = srcMatch?.group(1);
      }
      
      // Вариант 3: src=... (без кавычек)
      if (src == null || src.isEmpty) {
        srcRegex = RegExp(r'src=([^\s>]*)', caseSensitive: false);
        srcMatch = srcRegex.firstMatch(imgTag);
        src = srcMatch?.group(1);
      }

      // Декодируем HTML-сущности в URL
      if (src != null && src.isNotEmpty) {
        src = src
            .replaceAll('&amp;', '&')
            .replaceAll('&lt;', '<')
            .replaceAll('&gt;', '>')
            .replaceAll('&quot;', '"')
            .replaceAll('&#39;', "'")
            .replaceAll('&nbsp;', ' ')
            .trim();
        
        // Удаляем лишние пробелы и переносы строк
        src = src.replaceAll(RegExp(r'\s+'), '');
        
        // Логируем для отладки
        debugPrint('Extracted image URL: $src');
      }

      final styleRegex = RegExp(r'style="([^"]*)"', caseSensitive: false);
      final styleMatch = styleRegex.firstMatch(imgTag);
      final style = styleMatch?.group(1);

      if (src != null && src.isNotEmpty) {
        final imageUrl = src; // Сохраняем в локальную переменную для использования
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
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: GestureDetector(
              onTap: () => _showFullScreenImage(context, imageUrl),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      width: width ?? 300,
                      height: height ?? 200,
                      fit: BoxFit.contain,
                      httpHeaders: const {
                        'Accept': 'image/*',
                      },
                      errorWidget: (context, url, error) {
                        debugPrint('Image load error: $error for URL: $url');
                        return Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.red.shade50,
                            border: Border.all(color: Colors.red.shade200),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.error, color: Colors.red),
                              const SizedBox(height: 8),
                              const Text('Изображение не загружено'),
                              Text(
                                imageUrl,
                                style: const TextStyle(fontSize: 12, color: Colors.grey),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      },
                      progressIndicatorBuilder: (context, url, loadingProgress) {
                        return Container(
                          height: height ?? 200,
                          width: width ?? 300,
                          color: Colors.grey.shade100,
                          child: Center(
                            child: loadingProgress.progress != null
                                ? CircularProgressIndicator(
                                    value: loadingProgress.progress,
                                  )
                                : const CircularProgressIndicator(),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Icon(
                        Icons.fullscreen,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }

    return imageWidgets;
  }

  // Удаление изображений из HTML
  String _removeImagesFromHtml(String htmlContent) {
    return htmlContent.replaceAll(RegExp(r'<img[^>]*>', caseSensitive: false), '');
  }

  // Показ изображения в полноэкранном режиме
  void _showFullScreenImage(BuildContext context, String imageUrl) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => _FullScreenImageViewer(imageUrl: imageUrl),
      ),
    );
  }

  TagExtension _mathExtension() => TagExtension(
        tagsToExtend: {"span"},
        builder: (ctx) {
          try {
            final innerHtml = ctx.innerHtml;
            // Проверяем, содержит ли span математическую формулу
            if (!innerHtml.contains(r'\(') && !innerHtml.contains(r'\[')) {
              // Если нет формулы, возвращаем обычный текст
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
            // Если ошибка при парсинге формулы, возвращаем обычный текст
            return Text(ctx.innerHtml);
          }
        },
      );

  TagExtension _mathExtension2() => TagExtension(
        tagsToExtend: {"span"},
        builder: (ctx) {
          try {
            final innerHtml = ctx.innerHtml;
            // Проверяем, содержит ли span математическую формулу
            if (!innerHtml.contains(r'\(') && !innerHtml.contains(r'\[')) {
              // Если нет формулы, возвращаем обычный текст
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
            // Если ошибка при парсинге формулы, возвращаем обычный текст
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
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: Center(
        child: InteractiveViewer(
          panEnabled: true,
          boundaryMargin: const EdgeInsets.all(20),
          minScale: 0.5,
          maxScale: 4.0,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.contain,
            width: double.infinity,
            height: double.infinity,
            progressIndicatorBuilder: (context, url, loadingProgress) => const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
            errorWidget: (context, url, error) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: Colors.white,
                    size: 64,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Не удалось загрузить изображение',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    imageUrl,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

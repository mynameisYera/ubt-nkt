import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:brand_test/config/constants/app_colors.dart';
import 'package:brand_test/config/widgets/cors_aware_image.dart';
import 'package:brand_test/config/getit/get_injection.dart';
import 'package:brand_test/config/widgets/app_button.dart';
import 'package:brand_test/config/endpoints/dio_sender.dart';
import 'package:brand_test/config/endpoints/endpoints.dart';
import 'package:brand_test/config/storage/flutter_secure_storage_func.dart';
import 'package:brand_test/features/home/pages/bloc/home_bloc.dart';
import 'package:brand_test/features/home/pages/widgets/finish_dialog_widget.dart';
import 'package:brand_test/features/home/models/test_model.dart';

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
  final ScrollController _questionsNavScrollController = ScrollController();
  // ignore: unused_field
  String? _selectedRowId;
  Timer? _autoSaveTimer;
  Timer? _countdownTimer;
  int _remainingSeconds = 0;
  bool _isTimeExpired = false;
  bool _timerInitialized = false;
  bool _isSidebarCollapsed = true;
  bool _isDialogOpen = false; 
  bool _isInitializing = false;

  @override
  void initState() {
    super.initState();
    
    // Предотвращаем повторную инициализацию
    if (_isInitializing) {
      debugPrint('⚠️ Already initializing, skipping');
      return;
    }
    _isInitializing = true;
    
    _homeBloc = sl.get<HomeBloc>();
    
    // Проверяем текущее состояние блока
    final currentState = _homeBloc.state;
    final hasActiveTest = currentState.maybeWhen(
      loaded: (examModel) => examModel.testModel != null,
      orElse: () => false,
    );
    
    if (widget.examAttempt != null && !_homeBloc.isClosed) {
      // Если передан examAttempt, используем его
      _homeBloc.add(HomeEvent.setExamAttempt(examAttempt: widget.examAttempt!));
      // Инициализируем таймер сразу, если есть examAttempt
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && !_timerInitialized) {
          _timerInitialized = true;
          _startCountdownTimer(widget.examAttempt!);
        }
      });
    } else if (widget.pairId != null && !_homeBloc.isClosed) {
      // Запускаем новый тест только если:
      // 1. Нет активного теста в состоянии блока
      // 2. Или текущий тест не соответствует переданному pairId
      if (!hasActiveTest) {
        debugPrint('📤 Starting exam with pairId: ${widget.pairId}');
        _homeBloc.add(HomeEvent.startExam(id: widget.pairId!));
      } else {
        // Если тест уже активен, просто используем существующее состояние
        debugPrint('ℹ️ Test already active, using existing state');
      }
    }
    _startAutoSaveTimer();
  }

  @override
  void dispose() {
    _autoSaveTimer?.cancel();
    _countdownTimer?.cancel();
    _scrollController.dispose();
    _questionsNavScrollController.dispose();
    super.dispose();
  }

  void _startAutoSaveTimer() {
    _autoSaveTimer?.cancel();
    _autoSaveTimer = Timer.periodic(const Duration(seconds: 20), (timer) {
      _sendAnswersToBackend();
    });
  }

  void _startCountdownTimer(ExamAttempt examAttempt, {bool useCurrentTime = false}) {
    _countdownTimer?.cancel();
    
    if (!useCurrentTime) {
      if (examAttempt.remainingSeconds > 0) {
        _remainingSeconds = examAttempt.remainingSeconds;
      } else {
        try {
          final expiresAt = DateTime.parse(examAttempt.expiresAt);
          final now = DateTime.now();
          final difference = expiresAt.difference(now);
          _remainingSeconds = difference.inSeconds.clamp(0, 999999);
        } catch (e) {
          debugPrint('⚠️ Error parsing expires_at: $e');
          // Используем time_limit_minutes как fallback
          _remainingSeconds = examAttempt.timeLimitMinutes * 60;
        }
      }
    }
    // Если useCurrentTime = true, _remainingSeconds уже содержит актуальное значение

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

      // Обновляем состояние без полной перерисовки всего виджета
      if (_remainingSeconds > 0) {
        _remainingSeconds--;
        
        // Показываем предупреждение при остатке 5 минут и 1 минута
        if (_remainingSeconds == 300) {
          // 5 минут
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Ескерту: 5 минут қалды!'),
                backgroundColor: Colors.orange,
                duration: Duration(seconds: 3),
              ),
            );
          }
        } else if (_remainingSeconds == 60) {
          // 1 минута
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Ескерту: 1 минут қалды!'),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 3),
              ),
            );
          }
        }
        
        // Обновляем только таймер в AppBar, используя минимальный setState
        // НЕ обновляем, если диалог открыт
        if (mounted && !_isDialogOpen) {
          setState(() {
            // Только обновляем счетчик секунд
          });
        }
      } else {
        _remainingSeconds = 0;
        _isTimeExpired = true;
        timer.cancel();
        // Автоматически завершаем тест
        if (mounted) {
          _autoFinishTest();
        }
      }
    });
  }

  Future<void> _autoFinishTest() async {
    if (_isTimeExpired && mounted) {
      try {
        // Отправляем ответы перед завершением
        await _sendAnswersToBackend();
        
        if (!mounted) return;
        
        // Автоматически завершаем тест через бэкенд
        final attemptId = await FlutterSecureStorageFunc.getAttemptId();
        if (attemptId == null) {
          debugPrint('⚠️ AttemptId is null, cannot finish test');
          if (mounted) {
            Navigator.of(context).popUntil((route) => route.isFirst);
          }
          return;
        }

        // Шаг 1: Запрос на завершение теста
        debugPrint('📤 Requesting finish exam...');
        final finishRequestResponse = await DioSender.post(
          Endpoints.finishExamRequest(attemptId),
          {},
        );

        if (finishRequestResponse.statusCode == 200) {
          final finishData = finishRequestResponse.data as Map<String, dynamic>;
          final challenge = finishData['challenge'] as Map<String, dynamic>?;
          
          if (challenge != null) {
            // Вычисляем решение challenge автоматически
            final left = challenge['left'] as int? ?? 0;
            final right = challenge['right'] as int? ?? 0;
            final solution = left + right;
            
            debugPrint('✅ Challenge solved: $left + $right = $solution');
            
            // Шаг 2: Подтверждение завершения с решением
            final finishConfirmResponse = await DioSender.post(
              Endpoints.finishExamConfirm(attemptId),
              {'solution': solution},
            );

            if (finishConfirmResponse.statusCode == 200) {
              final confirmData = finishConfirmResponse.data as Map<String, dynamic>;
              if (confirmData['ok'] == true) {
                debugPrint('✅ Test finished successfully');
                
                // Очищаем attemptId после завершения теста
                await FlutterSecureStorageFunc.deleteAttemptId();
                
                // Показываем сообщение на казахском языке
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Сізде уақыт бітті, жауабын тесттер тарихынан көре аласыз'),
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 4),
                    ),
                  );
                  
                  // Небольшая задержка перед переходом
                  await Future.delayed(const Duration(seconds: 1));
                  
                  if (mounted) {
                    // Возвращаемся на главную страницу
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  }
                }
                return;
              }
            }
          }
        }
        
        // Если автоматическое завершение не удалось, показываем сообщение и переходим на главную
        debugPrint('⚠️ Auto finish failed, navigating to home');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Сізде уақыт бітті, жауабын тесттер тарихынан көре аласыз'),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 4),
            ),
          );
          
          await Future.delayed(const Duration(seconds: 1));
          
          if (mounted) {
            Navigator.of(context).popUntil((route) => route.isFirst);
          }
        }
      } catch (e, stackTrace) {
        debugPrint('❌ Error auto finishing test: $e');
        debugPrint('   StackTrace: $stackTrace');
        
        // В случае ошибки все равно переходим на главную страницу
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Сізде уақыт бітті, жауабын тесттер тарихынан көре аласыз'),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 4),
            ),
          );
          
          await Future.delayed(const Duration(seconds: 1));
          
          if (mounted) {
            Navigator.of(context).popUntil((route) => route.isFirst);
          }
        }
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
      // Прокрутка навигационных кнопок к текущему вопросу
      if (_questionsNavScrollController.hasClients) {
        final buttonWidth = 32.0; // 28 + 4 (margin)
        final scrollPosition = (index * buttonWidth) - 100; // Центрируем с отступом
        _questionsNavScrollController.animateTo(
          scrollPosition.clamp(0.0, _questionsNavScrollController.position.maxScrollExtent),
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

        for (final subject in testModel.subjects) {
          final questions = subject.questions ?? [];
          
          for (final question in questions) {
            try {
              final questionMap = question as Map<String, dynamic>;
              final attemptQuestionId = questionMap['attempt_question_id'];
              
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
                if (answer is String) {
                  answerPayload['selected_option_id'] = answer;
                } else {
                  debugPrint('⚠️ Invalid answer type for single question: ${answer.runtimeType}');
                  continue;
                }
              } else if (questionType == 'multiple') {
                if (answer is List) {
                  answerPayload['selected_option_ids'] = answer.cast<String>();
                } else {
                  debugPrint('⚠️ Invalid answer type for multiple question: ${answer.runtimeType}');
                  continue;
                }
              } else if (questionType == 'matching') {
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
              BlocBuilder<HomeBloc, HomeState>(
                bloc: _homeBloc,
                buildWhen: (previous, current) {
                  // Не перерисовываем таймер, если диалог открыт
                  return !_isDialogOpen;
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    loaded: (examModel) {
                      final testModel = examModel.testModel;
                      if (testModel != null) {
                        // Инициализируем таймер только один раз, если еще не инициализирован
                        if (!_timerInitialized && !_isTimeExpired && !_isDialogOpen) {
                          _timerInitialized = true;
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            if (mounted && !_isTimeExpired && !_isDialogOpen) {
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
                buildWhen: (previous, current) {
                  // Не перерисовываем кнопку, если диалог открыт
                  return !_isDialogOpen;
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    loaded: (_) => Container(
                      margin: const EdgeInsets.only(right: 8),
                      child: ElevatedButton.icon(
                        onPressed: (_isTimeExpired || _isDialogOpen)
                            ? null
                            : () async {
                                // Предотвращаем множественные нажатия
                                if (_isDialogOpen) return;
                                
                                // Устанавливаем флаг, что диалог открыт (блокируем обновление UI)
                                setState(() {
                                  _isDialogOpen = true;
                                });
                                
                                await _sendAnswersToBackend();
                                
                                if (!mounted) {
                                  _isDialogOpen = false;
                                  return;
                                }
                                
                                try {
                                  await showDialog<bool>(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) => WillPopScope(
                                      onWillPop: () async => false, // Предотвращаем закрытие по кнопке назад
                                      child: FinishDialogWidget(
                                        onBeforeFinish: _sendAnswersToBackend,
                                      ),
                                    ),
                                  );
                                  
                                  // Сбрасываем флаг после закрытия диалога
                                  if (mounted) {
                                    setState(() {
                                      _isDialogOpen = false;
                                    });
                                  }
                                  
                                  // Если тест завершен (result == true), переход на result_page
                                  // уже происходит в finish_dialog_widget.dart через appRouter.pushReplacement
                                  // Здесь ничего не делаем, просто сбрасываем флаг
                                } catch (e) {
                                  // В случае ошибки сбрасываем флаг
                                  if (mounted) {
                                    setState(() {
                                      _isDialogOpen = false;
                                    });
                                  }
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
                quotaExhausted: () => const Center(child: Text('У вас нет квоты для прохождения теста')),
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
                          onPressed: (_isTimeExpired || _isDialogOpen)
                            ? null
                            : () async {
                                // Предотвращаем множественные нажатия
                                if (_isDialogOpen) return;
                                
                                // Устанавливаем флаг, что диалог открыт (блокируем обновление UI)
                                setState(() {
                                  _isDialogOpen = true;
                                });
                                
                                await _sendAnswersToBackend();
                                
                                if (!mounted) {
                                  _isDialogOpen = false;
                                  return;
                                }
                                
                                try {
                                  await showDialog<bool>(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) => WillPopScope(
                                      onWillPop: () async => false, // Предотвращаем закрытие по кнопке назад
                                      child: FinishDialogWidget(
                                        onBeforeFinish: _sendAnswersToBackend,
                                      ),
                                    ),
                                  );
                                  
                                  // Сбрасываем флаг после закрытия диалога
                                  if (mounted) {
                                    setState(() {
                                      _isDialogOpen = false;
                                    });
                                  }
                                  
                                  // Если тест завершен (result == true), переход на result_page
                                  // уже происходит в finish_dialog_widget.dart через appRouter.pushReplacement
                                  // Здесь ничего не делаем, просто сбрасываем флаг
                                } catch (e) {
                                  // В случае ошибки сбрасываем флаг
                                  if (mounted) {
                                    setState(() {
                                      _isDialogOpen = false;
                                    });
                                  }
                                }
                          },
                          text: 'Тестті аяқтау',
                          isLoading: false,
                          isDisabled: false,
                        ),
                        const SizedBox(height: 10),
                        AppButton(
                          onPressed: () async {
                            final attemptId = await FlutterSecureStorageFunc.getAttemptId();
                            if (attemptId != null) {
                              _homeBloc.add(HomeEvent.continueExam(attemptId: attemptId));
                            }
                          },
                          text: 'Тестті жалғастыру',
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
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.error_outline,
                              size: 64,
                              color: Colors.grey,
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Нет данных',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Тест не загружен или не содержит вопросов',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 24),
                            if (widget.pairId != null)
                              AppButton(
                                onPressed: () {
                                  if (!_homeBloc.isClosed) {
                                    _homeBloc.add(HomeEvent.startExam(id: widget.pairId!));
                                  }
                                },
                                text: 'Повторить попытку',
                                isLoading: false,
                                isDisabled: false,
                              ),
                          ],
                        ),
                      ),
                    );
                  }

                  if (_selectedSubjectIndex >= testModel.subjects.length) {
                    _selectedSubjectIndex = 0;
                  }

                  final selectedSubject = testModel.subjects[_selectedSubjectIndex];
                  final questions = selectedSubject.questions ?? [];
                  
                  if (_currentQuestionIndex >= questions.length) {
                    _currentQuestionIndex = 0;
                  }

                  if (isDesktop) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!_isSidebarCollapsed)
                          _buildSubjectsSidebar(testModel, isDesktop),
                        if (!_isSidebarCollapsed)
                          Container(
                            width: 1,
                            color: Colors.grey.shade300,
                          ),
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
                    return Column(
                      children: [
                        _buildMobileSubjectsBar(testModel),
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
              // Компактная навигация по вопросам с прокруткой
              if (questions.isNotEmpty)
                Flexible(
                  child: SizedBox(
                    height: 32,
                    child: ListView.builder(
                      controller: _questionsNavScrollController,
                      scrollDirection: Axis.horizontal,
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

    final validOptions = options.where((option) {
      final optionMap = option as Map<String, dynamic>;
      final optionId = optionMap['id'] as String? ?? '';
      return optionId.isNotEmpty;
    }).toList();

    final dropdownItems = <String?>[null];
    final optionLabels = <String, String>{};
    
    for (final option in validOptions) {
      final optionMap = option as Map<String, dynamic>;
      final optionId = optionMap['id'] as String;
      final labelHtml = (optionMap['label_html'] as String? ?? '').trim();
      dropdownItems.add(optionId);
      optionLabels[optionId] = labelHtml;
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
        ...rows.map((row) {
          final rowMap = row as Map<String, dynamic>;
          final rowId = rowMap['id'] as String;
          final rowPrompt = (rowMap['prompt_html'] as String? ?? '').trim();
          final selectedOptionId = currentMatches[rowId];

          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 1,
                      ),
                    ),
                    child: _buildHtmlWithImages(
                      rowPrompt,
                      fontSize: 13,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: selectedOptionId != null
                            ? AppColors.mainBlue
                            : Colors.grey.shade300,
                        width: selectedOptionId != null ? 1.5 : 1,
                      ),
                    ),
                    child: DropdownButtonFormField<String>(
                      value: selectedOptionId,
                      isExpanded: true,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      selectedItemBuilder: (BuildContext context) {
                        return dropdownItems.map((optionId) {
                          if (optionId == null) {
                            return Text(
                              'Таңдаңыз',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 13,
                              ),
                              overflow: TextOverflow.ellipsis,
                            );
                          }
                          final labelHtml = optionLabels[optionId] ?? '';
                          final textOnly = labelHtml
                              .replaceAll(RegExp(r'<[^>]*>'), '')
                              .replaceAll('&nbsp;', ' ')
                              .trim();
                          return Text(
                            textOnly.isEmpty ? optionId : textOnly,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black87,
                            ),
                            overflow: TextOverflow.ellipsis,
                          );
                        }).toList();
                      },
                      items: dropdownItems.map((optionId) {
                        if (optionId == null) {
                          return DropdownMenuItem<String>(
                            value: null,
                            child: Text(
                              'Таңдаңыз',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 13,
                              ),
                            ),
                          );
                        }
                        final labelHtml = optionLabels[optionId] ?? '';
                        return DropdownMenuItem<String>(
                          value: optionId,
                          child: _buildHtmlWithImages(
                            labelHtml,
                            fontSize: 13,
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newOptionId) {
                        setState(() {
                          final newMatches = Map<String, String>.from(currentMatches);
                          if (newOptionId == null) {
                            newMatches.remove(rowId);
                          } else {
                            newMatches[rowId] = newOptionId;
                          }
                          _answers[answerKey] = newMatches;
                        });
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.mainBlue,
                        size: 20,
                      ),
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {
              setState(() {
                _answers[answerKey] = <String, String>{};
              });
            },
            icon: const Icon(Icons.refresh, size: 16),
            label: const Text('Қайта таңдау', style: TextStyle(fontSize: 12)),
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
                    child: CorsAwareImage(
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
                      placeholder: Container(
                        height: height ?? 200,
                        width: width ?? 300,
                        color: Colors.grey.shade100,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
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
          child: CorsAwareImage(
            imageUrl: imageUrl,
            fit: BoxFit.contain,
            width: double.infinity,
            height: double.infinity,
            placeholder: const Center(
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

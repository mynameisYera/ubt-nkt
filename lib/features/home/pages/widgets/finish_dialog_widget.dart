import 'package:flutter/material.dart';
import 'package:ubt_pbb/config/constants/app_colors.dart';
import 'package:ubt_pbb/config/endpoints/dio_sender.dart';
import 'package:ubt_pbb/config/endpoints/endpoints.dart';
import 'package:ubt_pbb/config/route/go_router_help.dart';
import 'package:ubt_pbb/config/storage/flutter_secure_storage_func.dart';
import 'package:ubt_pbb/features/home/models/finish_request_model.dart';

enum FinishDialogStep {
  confirmation,
  loading,
  challenge,
  confirming,
  success,
  error,
}

class FinishDialogWidget extends StatefulWidget {
  final Future<void> Function()? onBeforeFinish;
  
  const FinishDialogWidget({
    super.key,
    this.onBeforeFinish,
  });

  @override
  State<FinishDialogWidget> createState() => _FinishDialogWidgetState();
}

class _FinishDialogWidgetState extends State<FinishDialogWidget> {
  FinishDialogStep _currentStep = FinishDialogStep.confirmation;
  FinishRequestModel? _finishRequestModel;
  final TextEditingController _answerController = TextEditingController();
  String? _errorMessage;

  Future<void> _requestFinish() async {
    setState(() {
      _currentStep = FinishDialogStep.loading;
      _errorMessage = null;
    });

    try {
      if (widget.onBeforeFinish != null) {
        await widget.onBeforeFinish!();
      }
      
      final attemptId = await FlutterSecureStorageFunc.getAttemptId();
      final response = await DioSender.post(
        Endpoints.finishExamRequest(attemptId ?? 0),
        {},
      );

      if (response.statusCode == 200) {
        setState(() {
          _finishRequestModel = FinishRequestModel.fromJson(
            response.data as Map<String, dynamic>,
          );
          _currentStep = FinishDialogStep.challenge;
        });
      } else {
        setState(() {
          _currentStep = FinishDialogStep.error;
          _errorMessage = 'Ошибка при запросе завершения теста';
        });
      }
    } catch (e) {
      setState(() {
        _currentStep = FinishDialogStep.error;
        _errorMessage = 'Ошибка: ${e.toString()}';
      });
    }
  }

  Future<void> _confirmFinish() async {
    if (_answerController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Пожалуйста, введите ответ')),
      );
      return;
    }

    setState(() {
      _currentStep = FinishDialogStep.confirming;
      _errorMessage = null;
    });

    try {
      final attemptId = await FlutterSecureStorageFunc.getAttemptId();
      final solution = int.tryParse(_answerController.text);
      
      if (solution == null) {
        setState(() {
          _currentStep = FinishDialogStep.challenge;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Пожалуйста, введите корректное число')),
        );
        return;
      }

      final response = await DioSender.post(
        Endpoints.finishExamConfirm(attemptId ?? 0),
        {'solution': solution},
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        if (data['ok'] == true) {
          setState(() {
            _currentStep = FinishDialogStep.success;
          });
          
          Future.delayed(const Duration(seconds: 1), () async {
            if (mounted) {
              Navigator.of(context).pop(true);
              // Переход на страницу результатов
              final attemptId = await FlutterSecureStorageFunc.getAttemptId();
              if (attemptId != null && mounted) {
                appRouter.push('/result', extra: attemptId);
              }
            }
          });
        } else {
          setState(() {
            _currentStep = FinishDialogStep.error;
            _errorMessage = 'Неверный ответ на вопрос';
          });
        }
      } else {
        setState(() {
          _currentStep = FinishDialogStep.error;
          _errorMessage = 'Ошибка при подтверждении завершения теста';
        });
      }
    } catch (e) {
      setState(() {
        _currentStep = FinishDialogStep.error;
        _errorMessage = 'Ошибка: ${e.toString()}';
      });
    }
  }

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500, maxHeight: 600),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Заголовок с градиентом
            Container(
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
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    _getTitleIcon(),
                    color: Colors.white,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      _getTitle(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Контент
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: _buildContent(),
              ),
            ),
            // Кнопки действий
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: _buildActions(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getTitleIcon() {
    switch (_currentStep) {
      case FinishDialogStep.confirmation:
        return Icons.warning_amber_rounded;
      case FinishDialogStep.loading:
      case FinishDialogStep.confirming:
        return Icons.hourglass_empty;
      case FinishDialogStep.challenge:
        return Icons.assessment;
      case FinishDialogStep.success:
        return Icons.check_circle;
      case FinishDialogStep.error:
        return Icons.error_outline;
    }
  }

  String _getTitle() {
    switch (_currentStep) {
      case FinishDialogStep.confirmation:
        return 'Тестті аяқтау';
      case FinishDialogStep.loading:
      case FinishDialogStep.confirming:
        return 'Жүктелуде...';
      case FinishDialogStep.challenge:
        return 'Тест нәтижелері';
      case FinishDialogStep.success:
        return 'Сәтті!';
      case FinishDialogStep.error:
        return 'Қате';
    }
  }

  Widget _buildContent() {
    switch (_currentStep) {
      case FinishDialogStep.confirmation:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.orange.shade200),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.info_outline,
                    size: 48,
                    color: Colors.orange.shade700,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Сенімдісіз бе?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Бұл тестті аяқтау керек пе?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );

      case FinishDialogStep.loading:
      case FinishDialogStep.confirming:
        return const SizedBox(
          height: 100,
          child: Center(
            child: CircularProgressIndicator(
              backgroundColor: AppColors.mainBlue,
            ),
          ),
        );

      case FinishDialogStep.challenge:
        if (_finishRequestModel == null) {
          return const Center(
            child: Text('Ошибка загрузки данных'),
          );
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Показываем результаты по предметам
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.assessment,
                        color: Colors.blue.shade700,
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Нәтижелер:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ..._finishRequestModel!.subjects.map((subject) {
                    final progress = subject.total > 0
                        ? subject.answered / subject.total
                        : 0.0;
                    final isComplete = subject.answered == subject.total;
                    
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isComplete
                              ? Colors.green.shade300
                              : Colors.grey.shade300,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  subject.name,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: isComplete
                                      ? Colors.green.shade100
                                      : Colors.orange.shade100,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  '${subject.answered} / ${subject.total}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: isComplete
                                        ? Colors.green.shade700
                                        : Colors.orange.shade700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: LinearProgressIndicator(
                              value: progress,
                              backgroundColor: Colors.grey.shade200,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                isComplete
                                    ? Colors.green
                                    : Colors.orange,
                              ),
                              minHeight: 6,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Вопрос challenge
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.purple.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.quiz,
                        color: Colors.purple.shade700,
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Қауіпсіздік сұрағы:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        '${_finishRequestModel!.challenge.left} + ${_finishRequestModel!.challenge.right} = ?',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _answerController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.purple.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.purple.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.purple.shade600,
                          width: 2,
                        ),
                      ),
                      labelText: 'Жауап',
                      // hintText: 'Санды енгізіңіз',
                      prefixIcon: Icon(
                        Icons.calculate,
                        color: Colors.purple.shade600,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        );

      case FinishDialogStep.success:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green.shade200),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 64,
                    color: Colors.green.shade700,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Тест сәтті аяқталды!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Сіздің нәтижелеріңіз сақталды',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );

      case FinishDialogStep.error:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 48,
                    color: Colors.red.shade700,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _errorMessage ?? 'Белгісіз қателік',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red.shade700,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
    }
  }

  List<Widget> _buildActions() {
    switch (_currentStep) {
      case FinishDialogStep.confirmation:
        return [
          OutlinedButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
            label: const Text('Жок'),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.error,
              side: const BorderSide(color: AppColors.error),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(width: 12),
          ElevatedButton.icon(
            onPressed: _requestFinish,
            icon: const Icon(Icons.check),
            label: const Text('Иә'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.mainBlue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ];

      case FinishDialogStep.loading:
      case FinishDialogStep.confirming:
        return [];

      case FinishDialogStep.challenge:
        return [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Болдырмау',
              style: TextStyle(color: AppColors.error),
            ),
          ),
          TextButton(
            onPressed: _confirmFinish,
            child: const Text(
              'Растау',
              style: TextStyle(color: AppColors.mainBlue),
            ),
          ),
        ];

      case FinishDialogStep.success:
        return [
          // ElevatedButton.icon(
          //   onPressed: () => Navigator.pop(context, true),
          //   icon: const Icon(Icons.check),
          //   label: const Text('OK'),
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Colors.green,
          //     foregroundColor: Colors.white,
          //     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(8),
          //     ),
          //   ),
          // ),
        ];

      case FinishDialogStep.error:
        return [
          OutlinedButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close),
            label: const Text('Жабу'),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.error,
              side: const BorderSide(color: AppColors.error),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          if (_currentStep == FinishDialogStep.error &&
              _finishRequestModel != null) ...[
            const SizedBox(width: 12),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _currentStep = FinishDialogStep.challenge;
                  _errorMessage = null;
                });
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Қайталау'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.mainBlue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ];
    }
  }
}

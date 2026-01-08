import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:brand_test/config/storage/flutter_secure_storage_func.dart';
import 'package:brand_test/config/widgets/app_button.dart';
import 'package:brand_test/config/route/go_router_help.dart';
import 'package:brand_test/config/getit/get_injection.dart';
import 'package:brand_test/features/home/pages/bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _selectedPair;
  int? _selectedNktSubjectId;
  late HomeBloc _homeBloc;
  bool _hasNavigatedToTest = false; 
  bool _hasLoadedPairs = false; 

  @override
  void initState() {
    super.initState();
    _homeBloc = sl.get<HomeBloc>();
    _loadDataIfNeeded();
  }

  void _loadDataIfNeeded() {
    if (_homeBloc.isClosed) {
      debugPrint('⚠️ HomeBloc is closed, this should not happen with singleton');
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Ошибка инициализации. Пожалуйста, перезагрузите приложение.'),
            ),
          );
        }
      });
      return;
    }
    
    final currentState = _homeBloc.state;
    final shouldLoadPairs = currentState.maybeWhen(
      initial: () => true,
      loaded: (examModel) {
        if (examModel.testModel != null && examModel.examModel == null && examModel.nktExamModel == null) {
          return true;
        }
        return examModel.examModel == null && examModel.nktExamModel == null;
      },
      orElse: () => false,
    );
    
    if (shouldLoadPairs && !_homeBloc.isClosed && !_hasLoadedPairs) {
      _hasLoadedPairs = true;
      _homeBloc.add(const HomeEvent.getPairs());
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && !_homeBloc.isClosed) {
        final currentState = _homeBloc.state;
        final needsReload = currentState.maybeWhen(
          initial: () => true,
          loaded: (examModel) {
            if (examModel.testModel != null) {
              return false;
            }
            return examModel.examModel == null && examModel.nktExamModel == null;
          },
          loadingFailure: (_) => false,
          orElse: () => false,
        );
        
        if (needsReload) {
          _hasLoadedPairs = false;
          _loadDataIfNeeded();
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider.value(
      value: _homeBloc,
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          state.maybeWhen(
            loaded: (examModel) {
              if (examModel.testModel != null && !_hasNavigatedToTest) {
                _hasNavigatedToTest = true; // Устанавливаем флаг перед навигацией
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted) {
                    appRouter.pushReplacement('/test', extra: examModel.testModel);
                  }
                });
              }
              if (examModel.nktExamModel != null) {
              }
            },
            loadingFailure: (message) {
              _hasNavigatedToTest = false; // Сбрасываем флаг при ошибке
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
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            actions: [
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.logout,
                                color: Colors.red,
                                size: 32,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Аккаунттан шығу',
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Сіз аккаунттан шығып бара жатырсыз ба?',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: Colors.grey[600],
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 24),
                            Row(
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    style: OutlinedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(vertical: 14),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      side: BorderSide(
                                        color: Colors.grey[300]!,
                                      ),
                                    ),
                                    child: Text(
                                      'Жоқ',
                                      style: TextStyle(
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      FlutterSecureStorageFunc.deleteToken();
                                      FlutterSecureStorageFunc.deleteRefreshToken();
                                      appRouter.pushReplacement("/login");
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(vertical: 14),
                                      backgroundColor: Colors.red,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      elevation: 0,
                                    ),
                                    child: const Text(
                                      'Шығу',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: 150,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.red[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text('Выйти', style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white),),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  appRouter.push("/profile");
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: 150,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.blue[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text('Профиль', style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white),),
                  ),
                ),
              ),
              
            ],
            title: Text(
              'Brand Online',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: false,
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              final isDesktop = constraints.maxWidth >= 900;
              final horizontalPadding = isDesktop ? 64.0 : 16.0;

              return BlocBuilder<HomeBloc, HomeState>(
                bloc: _homeBloc,
                builder: (context, state) {
                  // Для состояний ошибки показываем центрированный контент
                  if (state.maybeWhen(
                    loadingFailure: (_) => true,
                    quotaExhausted: () => true,
                    orElse: () => false,
                  )) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                        child: state.when(
                          quotaExhausted: () => Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('У вас нет квоты для прохождения теста'),
                              const SizedBox(height: 16),
                              AppButton(
                                onPressed: () {
                                  if (!_homeBloc.isClosed) {
                                    _hasLoadedPairs = false; // Сбрасываем флаг при ручном вызове
                                    _homeBloc.add(const HomeEvent.getPairs());
                                  }
                                },
                                text: 'Түсінікті',
                              ),
                            ],
                          ),
                          loadingFailure: (message) => Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(message),
                              const SizedBox(height: 16),
                              AppButton(
                                onPressed: () {
                                  if (!_homeBloc.isClosed) {
                                    _hasLoadedPairs = false; // Сбрасываем флаг при ручном вызове
                                    _homeBloc.add(const HomeEvent.getPairs());
                                  }
                                },
                                text: 'Түсінікті',
                              ),
                            ],
                          ),
                          initial: () => const SizedBox.shrink(),
                          loading: () => const SizedBox.shrink(),
                          loaded: (_) => const SizedBox.shrink(),
                        ),
                      ),
                    );
                  }

              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding, vertical: 24),
                child: state.when(
                      quotaExhausted: () => const SizedBox.shrink(),
                      initial: () => const Center(child: Text('Жүктелуде...')),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      loadingFailure: (_) => const SizedBox.shrink(),
                      loaded: (examModel) {
                        if (examModel.nktExamModel != null) {
                          final nktModel = examModel.nktExamModel!;
                          final activeSubjects = nktModel.subjects
                              .where((s) => s.isActive)
                              .toList();

                          if (_selectedNktSubjectId == null &&
                              activeSubjects.isNotEmpty) {
                            _selectedNktSubjectId = activeSubjects.first.id;
                          }

                          Widget subjectsCard = Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            elevation: 4,
                            margin: const EdgeInsets.only(bottom: 24),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'NKT Пәндер',
                                    style: theme.textTheme.titleMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 12),
                                  DropdownButtonFormField<int>(
                                    value: _selectedNktSubjectId,
                                    isExpanded: true,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 8),
                                    ),
                                    items: activeSubjects
                                        .map(
                                          (s) => DropdownMenuItem(
                                            value: s.id,
                                            child: Text(
                                                '${s.name} (${s.questionQuota} сұрақ)'),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedNktSubjectId = value;
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  if (nktModel.orderingRules.isNotEmpty) ...[
                                    Text(
                                      'Ережелер:',
                                      style: theme.textTheme.titleSmall
                                          ?.copyWith(fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 8),
                                    ...nktModel.orderingRules.map(
                                      (rule) => Padding(
                                        padding: const EdgeInsets.only(bottom: 4),
                                        child: Text(
                                          '• $rule',
                                          style: theme.textTheme.bodySmall,
                                        ),
                                      ),
                                    ),
                                  ],
                                  if (nktModel.tools.isNotEmpty) ...[
                                    const SizedBox(height: 16),
                                    Text(
                                      'Қолданылатын құралдар:',
                                      style: theme.textTheme.titleSmall
                                          ?.copyWith(fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 8),
                                    Wrap(
                                      spacing: 8,
                                      children: nktModel.tools
                                          .map(
                                            (tool) => Chip(
                                              label: Text(tool),
                                              padding: const EdgeInsets.all(4),
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ],
                                  const SizedBox(height: 16),
                                  Text(
                                    'Уақыт шегі: ${nktModel.timeLimitMinutes.default_} минут',
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                  Text(
                                    'Қалған квота: ${nktModel.quota}',
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                          );

                         Widget startButton = AppButton(
                            onPressed: () {
                              if (_selectedNktSubjectId != null && !_homeBloc.isClosed) {
                                _homeBloc.add(HomeEvent.startExam(
                                    id: _selectedNktSubjectId!));
                              }
                            },
                            isLoading: false,
                            isDisabled: nktModel.quota <= 0 || _selectedNktSubjectId == null,
                            icon: Icons.arrow_forward,
                            text: 'Бастау ${nktModel.quota}',
                          );

                          if (isDesktop) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(child: subjectsCard),
                                const SizedBox(width: 24),
                                Expanded(
                                  child: Column(
                                    children: [
                                      startButton,
                                      const SizedBox(height: 16),
                                      AppButton(
                                        onPressed: () {
                                          appRouter.push("/history");
                                        },
                                        text: 'Менің тесттерім',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                subjectsCard,
                                startButton,
                                const SizedBox(height: 16),
                                AppButton(
                                  onPressed: () {
                                    appRouter.push("/history");
                                  },
                                  text: 'Менің тесттерім',
                                ),
                              ],
                            );
                          }
                        }

                        // Handle regular Exam Model (for student)
                        if (examModel.examModel != null) {
                          final pairs = examModel.examModel!.pairs;

                          if (_selectedPair == null && pairs.isNotEmpty) {
                            _selectedPair = pairs.first.label;
                          }

                          Widget block1 = Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            elevation: 4,
                            margin: const EdgeInsets.only(bottom: 24),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '1-блок (міндетті предметтер)',
                                    style: theme.textTheme.titleMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 12),
                                  ...examModel.examModel!.block1_subjects.map(
                                    (s) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(s.name),
                                          Text('${s.question_count} сұрақ'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );

                          Widget block2 = Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            elevation: 4,
                            margin: const EdgeInsets.only(bottom: 24),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '2-блок (пәндерді таңдау)',
                                    style: theme.textTheme.titleMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 12),
                                  DropdownButtonFormField<String>(
                                    value: _selectedPair,
                                    isExpanded: true,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 8),
                                    ),
                                    items: pairs
                                        .map(
                                          (p) => DropdownMenuItem(
                                            value: p.label,
                                            child: Text(
                                                '${p.label} (${p.first_subject.question_quota}+${p.second_subject.question_quota} сұрақ)'),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedPair = value;
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'Таңдалған пән: $_selectedPair',
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                          );

                          Widget startButton = AppButton(
                            onPressed: () {
                              appRouter.pushReplacement("/test",
                                  extra: pairs
                                      .firstWhere(
                                          (p) => p.label == _selectedPair)
                                      .id);
                            },
                            isLoading: false,
                            isDisabled: examModel.examModel!.quota <= 0 || _selectedPair == null,
                            icon: Icons.arrow_forward,
                            text: 'Бастау ${examModel.examModel!.quota}',
                          );

                          if (isDesktop) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(child: block1),
                                const SizedBox(width: 24),
                                Expanded(
                                  child: Column(
                                    children: [
                                      block2,
                                      startButton,
                                      const SizedBox(height: 16),
                                      AppButton(
                                        onPressed: () {
                                          appRouter.push("/history");
                                        },
                                        text: 'Менің тесттерім',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                block1,
                                block2,
                                startButton,
                                const SizedBox(height: 16),
                                AppButton(
                                  onPressed: () {
                                    appRouter.push("/history");
                                  },
                                  text: 'Менің тесттерім',
                                ),
                              ],
                            );
                          }
                        }
                        return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text('Деректер жоқ, қайталап көріңіз'),
                                const SizedBox(height: 16),
                                AppButton(
                                  onPressed: () {
                                    if (!_homeBloc.isClosed) {
                                      _hasLoadedPairs = false; // Сбрасываем флаг при ручном вызове
                                      _homeBloc.add(const HomeEvent.getPairs());
                                    } else {
                                      // Если блок закрыт, перезагружаем страницу
                                      // или показываем сообщение об ошибке
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text('Ошибка: блок закрыт. Пожалуйста, перезагрузите приложение.'),
                                        ),
                                      );
                                    }
                                  },
                                  text: 'Қайталау',
                                ),
                              ],
                            )
                          );
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

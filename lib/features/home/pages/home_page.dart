import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ubt_pbb/config/storage/flutter_secure_storage_func.dart';
import 'package:ubt_pbb/config/widgets/app_button.dart';
import 'package:ubt_pbb/config/route/go_router_help.dart';
import 'package:ubt_pbb/features/home/pages/bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _selectedPair;
  int? _selectedNktSubjectId;
  late HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = HomeBloc();
    _homeBloc.add(const HomeEvent.getPairs());
  }

  @override
  void dispose() {
    _homeBloc.close();
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
              if (examModel.testModel != null) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  appRouter.push('/test', extra: examModel.testModel);
                });
              }
              if (examModel.nktExamModel != null) {
                // NKT exam model loaded - can show subject selection
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
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            actions: [
              IconButton(
                onPressed: () {
                  FlutterSecureStorageFunc.deleteToken();
                  FlutterSecureStorageFunc.deleteRefreshToken();
                  appRouter.pushReplacement("/login");
                },
                icon: const Icon(Icons.logout),
              )
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

              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding, vertical: 24),
                child: BlocBuilder<HomeBloc, HomeState>(
                  bloc: _homeBloc,
                  builder: (context, state) {
                    return state.when(
                      initial: () => const Center(child: Text('Жүктелуде...')),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      loadingFailure: (message) =>
                          Center(child: Text(message)),
                      loaded: (examModel) {
                        // Handle NKT Exam Model (for teacher)
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
                                    'Қалған квота: ${nktModel.quota.nktRemaining}',
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                          );

                          Widget startButton = AppButton(
                            onPressed: () {
                              if (_selectedNktSubjectId != null) {
                                _homeBloc.add(HomeEvent.startExam(
                                    id: _selectedNktSubjectId!));
                              }
                            },
                            isLoading: false,
                            isDisabled: _selectedNktSubjectId == null,
                            icon: Icons.arrow_forward,
                            text: 'Бастау',
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
                              appRouter.push("/test",
                                  extra: pairs
                                      .firstWhere(
                                          (p) => p.label == _selectedPair)
                                      .id);
                            },
                            isLoading: false,
                            isDisabled: _selectedPair == null,
                            icon: Icons.arrow_forward,
                            text: 'Бастау',
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

                        // Fallback if no model is available
                        return const Center(
                            child: Text('Деректер жоқ / No data available'));
                      },
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

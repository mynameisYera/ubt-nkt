import 'package:brand_test/config/route/go_router_help.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:brand_test/config/constants/app_colors.dart';
import 'package:brand_test/config/getit/get_injection.dart';
import 'package:brand_test/features/home/pages/bloc/home_bloc.dart';
import 'package:brand_test/features/home/models/profile_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = sl.get<HomeBloc>();
    _homeBloc.add(const HomeEvent.getProfile());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.mainBlue,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            appRouter.pushReplacement("/home");
          },
        ),
        title: const Text(
          'Профиль',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: BlocProvider.value(
        value: _homeBloc,
        child: BlocBuilder<HomeBloc, HomeState>(
          bloc: _homeBloc,
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const Center(
                child: CircularProgressIndicator(
                  backgroundColor: AppColors.mainBlue,
                ),
              ),
              loadingFailure: (message) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      message,
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        _homeBloc.add(const HomeEvent.getProfile());
                      },
                      child: const Text('Қайталау'),
                    ),
                  ],
                ),
              ),
              loaded: (examModel) {
                final profile = examModel.profileModel;
                if (profile == null) {
                  return const Center(
                    child: Text('Профиль деректері жоқ'),
                  );
                }
                return _buildProfileContent(context, profile, theme);
              },
              orElse: () => const Center(
                child: Text('Деректер жоқ'),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildProfileContent(
    BuildContext context,
    ProfileModel profile,
    ThemeData theme,
  ) {
    final attempts = profile.attempts;
    final finishedAttempts = attempts.where((a) => a.status == 'finished').toList();
    
    // Sort attempts by date for the chart
    final sortedAttempts = List<AttemptModel>.from(finishedAttempts)
      ..sort((a, b) => a.startedAt.compareTo(b.startedAt));

    // Calculate statistics
    final totalAttempts = attempts.length;
    final finishedCount = finishedAttempts.length;
    final expiredCount = attempts.where((a) => a.status == 'expired').length;
    final bestScore = finishedAttempts.isNotEmpty
        ? finishedAttempts.map((a) => a.totalScore).reduce((a, b) => a > b ? a : b)
        : 0;
    final averageScore = finishedAttempts.isNotEmpty
        ? finishedAttempts.map((a) => a.totalScore).reduce((a, b) => a + b) / finishedAttempts.length
        : 0.0;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Info Card
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.mainBlue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.school,
                          color: AppColors.mainBlue,
                          size: 32,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              profile.school.name,
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Мектеп ID: ${profile.school.id}',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (profile.group != null) ...[
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.group, size: 20, color: Colors.grey[600]),
                        const SizedBox(width: 8),
                        Text(
                          'Топ: ${profile.group}',
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.orange.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Қалған квота',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              profile.quota.entQuota != null
                                  ? '${profile.quota.entQuota}'
                                  : profile.quota.nktQuota != null
                                      ? '${profile.quota.nktQuota}'
                                      : '0',
                              style: theme.textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.orange,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.assignment,
                          size: 40,
                          color: AppColors.orange,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Statistics Cards
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  'Барлығы',
                  '$totalAttempts',
                  Icons.quiz,
                  AppColors.mainBlue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  'Аяқталды',
                  '$finishedCount',
                  Icons.check_circle,
                  Colors.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  'Уақыт аяқталды',
                  '$expiredCount',
                  Icons.timer_off,
                  Colors.red,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Best and Average Score
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  'Ең жоғары',
                  '$bestScore',
                  Icons.emoji_events,
                  AppColors.orange,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  'Орташа',
                  averageScore.toStringAsFixed(1),
                  Icons.trending_up,
                  AppColors.mainBlue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Progress Chart
          if (sortedAttempts.isNotEmpty) ...[
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Прогресс графигі',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Баллдар уақыт бойынша',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      height: 250,
                      child: _buildProgressChart(sortedAttempts),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon, Color color) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressChart(List<AttemptModel> attempts) {
    if (attempts.isEmpty) {
      return const Center(
        child: Text('Деректер жоқ'),
      );
    }

    final maxScore = attempts.map((a) => a.maxScore).first;
    final maxY = (maxScore * 1.2).round().toDouble(); // Add 20% padding

    final spots = attempts.asMap().entries.map((entry) {
      final index = entry.key;
      final attempt = entry.value;
      return FlSpot(index.toDouble(), attempt.totalScore.toDouble());
    }).toList();

    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: maxY / 5,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.grey.withOpacity(0.2),
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: attempts.length > 10 ? (attempts.length / 5).ceil().toDouble() : 1,
              getTitlesWidget: (value, meta) {
                if (value.toInt() >= 0 && value.toInt() < attempts.length) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      '${value.toInt() + 1}',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      ),
                    ),
                  );
                }
                return const Text('');
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 50,
              interval: maxY / 5,
              getTitlesWidget: (value, meta) {
                return Text(
                  value.toInt().toString(),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                );
              },
            ),
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Colors.grey.withOpacity(0.3)),
        ),
        minX: 0,
        maxX: (attempts.length - 1).toDouble(),
        minY: 0,
        maxY: maxY,
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            color: AppColors.mainBlue,
            barWidth: 3,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 4,
                  color: AppColors.mainBlue,
                  strokeWidth: 2,
                  strokeColor: Colors.white,
                );
              },
            ),
            belowBarData: BarAreaData(
              show: true,
              color: AppColors.mainBlue.withOpacity(0.1),
            ),
          ),
        ],
      ),
    );
  }
}


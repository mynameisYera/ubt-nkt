import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ubt_pbb/config/constants/app_colors.dart';
import 'package:ubt_pbb/features/auth/pages/login_page.dart';
import 'package:ubt_pbb/features/auth/pages/register_page.dart';
import 'package:ubt_pbb/features/auth/pages/restore_page.dart';
import 'package:ubt_pbb/features/home/models/solution_model.dart';
import 'package:ubt_pbb/features/home/pages/history_page.dart';
import 'package:ubt_pbb/features/home/pages/home_page.dart';
import 'package:ubt_pbb/config/storage/flutter_secure_storage_func.dart';
import 'package:ubt_pbb/features/home/pages/solution_page.dart';
import 'package:ubt_pbb/features/home/pages/test_page.dart';
import 'package:ubt_pbb/features/home/pages/result_page.dart';
import 'package:ubt_pbb/features/home/models/test_model.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => NoTransitionPage(
        child: FutureBuilder(
          future: Future.wait([
            FlutterSecureStorageFunc.getToken(),
            FlutterSecureStorageFunc.getRefreshToken(),
          ]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator.adaptive(backgroundColor: AppColors.mainBlue,));
            }
            if (snapshot.hasError) {
              return const LoginPage();
            }
            if (snapshot.hasData && snapshot.data != null) {
              final tokens = snapshot.data as List<dynamic>;
              // final accessToken = tokens[0] as String?;
              final refreshToken = tokens[1] as String?;
              
              if (refreshToken == null || refreshToken.isEmpty) {
                return const LoginPage();
              }
              
              return const HomePage();
            }
            return const LoginPage();
          },
        ),
      ),
    ),
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) => const NoTransitionPage(child: LoginPage()),
    ),
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) => const NoTransitionPage(child: HomePage()),
    ),
    GoRoute(
      path: '/test',
      pageBuilder: (context, state) {
        if (state.extra is ExamAttempt) {
          final examAttempt = state.extra as ExamAttempt;
          return NoTransitionPage(child: TestPage(examAttempt: examAttempt));
        } else if (state.extra is int) {
          final pairId = state.extra as int;
          return NoTransitionPage(child: TestPage(pairId: pairId));
        } else {
          return NoTransitionPage(child: const HomePage());
        }
      },
    ),

    GoRoute(
      path: "/register",
      pageBuilder: (context, state) => const NoTransitionPage(child: RegisterPage()),
    ),

    GoRoute(
      path: "/history",
      pageBuilder: (context, state) => const NoTransitionPage(child: HistoryPage()),
    ),
    GoRoute(
      path: "/result",
      pageBuilder: (context, state) {
        final attemptId = state.extra as int;
        return NoTransitionPage(child: ResultPage(attemptId: attemptId));
      },
    ),
    GoRoute(
      path: "/solution",
      pageBuilder: (context, state) {
        final solutionQuestion = state.extra as SolutionQuestion;
        return NoTransitionPage(child: SolutionPage(solutionQuestion: solutionQuestion));
      },
    ),
    GoRoute(
      path: "/restore",
      pageBuilder: (context, state) {
        return NoTransitionPage(child: RestorePage());
      },
    ),
  ],
);

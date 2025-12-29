import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ubt_pbb/config/constants/app_colors.dart';
import 'package:ubt_pbb/config/getit/get_injection.dart';
import 'package:ubt_pbb/config/route/go_router_help.dart';
import 'package:ubt_pbb/config/storage/flutter_secure_storage_func.dart';
import 'package:ubt_pbb/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  GetIt.instance.debugEventsEnabled = true;

  await initDependencies();
  print("refresh token: ${await FlutterSecureStorageFunc.getRefreshToken()}");
  print("access token: ${await FlutterSecureStorageFunc.getToken()}");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mainBlue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Пробный: ҰБТ-НКТ',
      routerConfig: appRouter,
    );
  }
}
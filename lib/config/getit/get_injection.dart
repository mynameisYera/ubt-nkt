import 'package:get_it/get_it.dart';
import 'package:brand_test/features/auth/pages/bloc/auth_bloc.dart';
import 'package:brand_test/features/home/pages/bloc/home_bloc.dart';

final GetIt sl = GetIt.instance;

Future<void> initDependencies() async {
  
  sl.registerLazySingleton(() => AuthBloc());
  sl.registerLazySingleton(() => HomeBloc());
}


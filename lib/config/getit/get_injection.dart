import 'package:get_it/get_it.dart';
import 'package:ubt_pbb/features/auth/pages/bloc/auth_bloc.dart';
import 'package:ubt_pbb/features/home/pages/bloc/home_bloc.dart';

final GetIt sl = GetIt.instance;

Future<void> initDependencies() async {
  
  sl.registerLazySingleton(() => AuthBloc());
  sl.registerLazySingleton(() => HomeBloc());
}


import 'package:get_it/get_it.dart';
import 'package:hackaton_msb/features/dashboard_feature/data/data_source/dashboard_remote_data_source.dart';
import 'package:hackaton_msb/features/dashboard_feature/data/repositories/dashboard_repository_impl.dart';
import 'package:hackaton_msb/features/dashboard_feature/domain/repositories/dashboard_repository.dart';
import 'package:hackaton_msb/features/dashboard_feature/domain/usecases/get_all_pickings.dart';
import 'package:hackaton_msb/features/dashboard_feature/domain/usecases/get_all_stock.dart';
import 'package:hackaton_msb/features/dashboard_feature/presentation/bloc/dashboard_bloc/dashboard_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'features/dashboard_feature/data/Interceptor/AuthInterceptor.dart';

// instance of getIt
// sl : service locator
final sl = GetIt.instance;

// function initialise to apply dependecy injection
Future<void> init() async {
//! Features

// Bloc
  // Factory is a design pattern
  sl.registerFactory(() => DashboardBloc(
      getAllPickingsUseCase: sl(), httpClient: sl(), getAllStockUseCase: sl()));

// Usecases
  sl.registerLazySingleton(() => GetAllPickingsUseCase(sl()));
  sl.registerLazySingleton(() => GetAllStockUseCase(sl()));

// Repository
// lazy_singleton vs singleton
// lazy_singleton create the object only when i need it
// singleton when i open the app it will be created automatically
  sl.registerLazySingleton<DashBoardRepository>(() => DashBoardRepositoryImpl(
      dashboardRemoteDataSource: sl(), networkInfo: sl()));

// Datasources

  sl.registerLazySingleton<DashboardRemoteDataSource>(
      () => DashboardRemoteDataSourceImpl(httpClient: sl()));

//! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//! External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => AuthenticatedHttpClient(sharedPref: sl()));
}

import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture_ismail/app_prefs.dart';
import 'package:flutter_clean_architecture_ismail/src/core/api/api_consumer.dart';
import 'package:flutter_clean_architecture_ismail/src/core/api/api_interceptors.dart';
import 'package:flutter_clean_architecture_ismail/src/core/api/dio_consumer.dart';
import 'package:flutter_clean_architecture_ismail/src/core/network/network_info.dart';
import 'package:flutter_clean_architecture_ismail/src/features/random_quotes/data/data_sources/local_data_source/local_data_source.dart';
import 'package:flutter_clean_architecture_ismail/src/features/random_quotes/data/data_sources/remote_data_source/remote_data_source.dart';
import 'package:flutter_clean_architecture_ismail/src/features/random_quotes/data/repositories/repository_impl.dart';
import 'package:flutter_clean_architecture_ismail/src/features/random_quotes/presentation/cubit/random_quote_cubit_cubit.dart';
import 'package:flutter_clean_architecture_ismail/src/features/splash/data/data_sources/local_data_source/lanuage_local_data_source.dart';
import 'package:flutter_clean_architecture_ismail/src/features/splash/domain/repositories/language_repository.dart';
import 'package:flutter_clean_architecture_ismail/src/features/splash/domain/use_cases/change_language.dart';
import 'package:flutter_clean_architecture_ismail/src/features/splash/domain/use_cases/get_last_saved_language.dart';
import 'package:flutter_clean_architecture_ismail/src/features/splash/presentation/cubit/locale_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/random_quotes/domain/repositories/quote_repository.dart';
import 'features/random_quotes/domain/use_cases/get_random_quote_use_case.dart';
import 'features/splash/data/repositories/language_repository_impl.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  /// features

  //blocs
  instance.registerFactory<RandomQuoteCubit>(
      () => RandomQuoteCubit(instance<GetRandomQuoteUseCase>()));

  instance.registerFactory<LocaleCubit>(() => LocaleCubit(
      instance<GetLastSavedLanguageUseCase>(),
      instance<ChangeLanguageUseCase>()));

  //use cases
  instance.registerLazySingleton<GetRandomQuoteUseCase>(
      () => GetRandomQuoteUseCase(instance<Repository>()));

  instance.registerLazySingleton<GetLastSavedLanguageUseCase>(
      () => GetLastSavedLanguageUseCase(instance<LanguageRepository>()));

  instance.registerLazySingleton<ChangeLanguageUseCase>(
      () => ChangeLanguageUseCase(instance<LanguageRepository>()));

  //repositories
  instance.registerLazySingleton<Repository>(
    () => RepositoryImpl(
      instance<NetworkInfo>(),
      instance<RemoteDataSource>(),
      instance<LocalDataSource>(),
    ),
  );

  instance.registerLazySingleton<LanguageRepository>(
      () => LanguageRepositoryImpl(instance<LanaugeLocalDataSource>()));

  //data sources

  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance<ApiConsumer>()));

  instance.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl(instance<AppPreference>()));

  instance.registerLazySingleton<LanaugeLocalDataSource>(
      () => LanaugeLocalDataSourceImpl(instance<AppPreference>()));

  /// core

  //app preferences
  instance.registerLazySingleton<AppPreference>(
      () => AppPreference(instance<SharedPreferences>()));

  //network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(instance<InternetConnectionChecker>()));

  //api consumer
  instance
      .registerLazySingleton<ApiConsumer>(() => DioConsumer(instance<Dio>()));

  /// external

  //dio
  instance.registerLazySingleton<Dio>(() => Dio());

  //api interceptors
  instance.registerLazySingleton<ApiInterceptors>(() => ApiInterceptors());

  //log interceptors
  instance.registerLazySingleton<LogInterceptor>(() => LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ));

  //shared preference
  final sharedPreferences = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  //conntection checker
  instance.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());
}

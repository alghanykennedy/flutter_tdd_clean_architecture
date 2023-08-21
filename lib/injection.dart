import 'package:flutter_tdd_clean_architecture/domain/repositories/weather_repository.dart';
import 'package:flutter_tdd_clean_architecture/domain/usecase/get_current_weather.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

import 'data/datasources/remote_data_sources.dart';
import 'data/repositories/weather_repository_impl.dart';
import 'presentation/bloc/weather_bloc.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => WeatherBloc(locator()));

  // usecase
  locator.registerLazySingleton(() => GetCurrentWeather(locator()));

  // repository
  locator.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  // data source
  locator.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      client: locator(),
    ),
  );

  // external
  locator.registerLazySingleton(() => http.Client());
}

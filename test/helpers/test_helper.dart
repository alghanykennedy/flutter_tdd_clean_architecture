import 'package:flutter_tdd_clean_architecture/data/datasources/remote_data_sources.dart';
import 'package:flutter_tdd_clean_architecture/domain/repositories/weather_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks(
  [
    WeatherRepository,
    RemoteDataSource,
  ],
  customMocks: [
    MockSpec<WeatherRepository>(
      as: #MockCustomWeatherRepository,
    ),
    MockSpec<http.Client>(
      as: #MockHttpClient,
    ),
  ],
)
void main() {}

import 'package:dartz/dartz.dart';
import 'package:flutter_tdd_clean_architecture/domain/repositories/weather_repository.dart';
import '../../data/failure.dart';
import '../entities/weather.dart';

class GetCurrentWeather {
  final WeatherRepository repository;

  GetCurrentWeather(this.repository);

  Future<Either<Failure, Weather>> execute(String cityName) {
    return repository.getCurrentWeather(cityName);
  }
}

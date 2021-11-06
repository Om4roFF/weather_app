import 'package:weather_app/data/database/weather_dao.dart';
import 'package:weather_app/domain/model/forecast_day.dart';
import 'package:weather_app/domain/model/hour.dart';
import 'package:weather_app/domain/model/weather.dart';
import 'package:weather_app/domain/model/weather_condition.dart';

enum WeatherType {
  day,
  hour,
}

enum WeatherFetchType {
  none,
  loading,
  error,
  done,
}

class WeatherState {
  final Weather? weather;
  final List<WeatherCondition>? weatherCondition;
  final WeatherType? weatherType;
  final WeatherFetchType? weatherFetchType;
  final String city;
  WeatherState({
    this.weather,
    this.weatherCondition,
    this.weatherType,
    this.weatherFetchType,
    this.city = 'Kiev',
  });

  WeatherState copyWith({
    Weather? weather,
    List<WeatherCondition>? weatherCondition,
    WeatherType? weatherType,
    WeatherFetchType? weatherFetchType,
    String? city,
  }) {
    return WeatherState(
      weather: weather ?? this.weather,
      weatherCondition: weatherCondition ?? this.weatherCondition,
      weatherType: weatherType ?? this.weatherType,
      weatherFetchType: weatherFetchType ?? this.weatherFetchType,
      city: city ?? this.city,
    );
  }
}

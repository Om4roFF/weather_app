
import 'package:weather_app/domain/model/weather.dart';
import 'package:weather_app/domain/model/weather_condition.dart';

abstract class WeatherRepository{

  Future<Weather> fetchWeather({required String key, String? city, String? day});
  Future<List<WeatherCondition>> fetchWeatherConditions();

}
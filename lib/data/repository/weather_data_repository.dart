
import 'package:weather_app/data/api/api_util.dart';
import 'package:weather_app/domain/model/weather.dart';
import 'package:weather_app/domain/model/weather_condition.dart';
import 'package:weather_app/domain/repository/weather_repository.dart';

class WeatherDataRepository extends WeatherRepository{

  final ApiUtil _apiUtil;

  WeatherDataRepository(this._apiUtil);

  @override
  Future<Weather> fetchWeather({required String key, String? city, String? day}) {
    return _apiUtil.fetchWeather(key, city, day);
  }

  @override
  Future<List<WeatherCondition>> fetchWeatherConditions() {
    return _apiUtil.fetchWeatherConditions();
  }

}
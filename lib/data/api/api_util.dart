import 'package:weather_app/data/api/request/get_body.dart';
import 'package:weather_app/data/api/service/internal_service.dart';
import 'package:weather_app/data/api/service/wheather_service.dart';
import 'package:weather_app/domain/model/weather.dart';
import 'package:weather_app/domain/model/weather_condition.dart';

class ApiUtil {
  final WeatherService _weatherService;
  final InternalService _internalService;
  const ApiUtil(
      {required WeatherService weatherService,
      required InternalService internalService})
      : _weatherService = weatherService,
        _internalService = internalService;

  Future<Weather> fetchWeather(String key, String? city, String? day) async {
    final body = GetBody(key: key, city: city, day: day);
    return await _weatherService.fetchWeather(body);
  }

  Future<List<WeatherCondition>> fetchWeatherConditions() async{
    return await _weatherService.fetchWeatherConditions();
  }

  Future<String> getCurrentAddress() async {
    return await _internalService.getCurrentAddress();
  }

  Future<String> googleSignInWithFirebase() async {
    return await _internalService.googleSignInWithFirebase();
  }

  Future<void> signOutGoogle() async{
    return await _internalService.signOutGoogle();
  }

  Future<void> initMessaging() async{
    return await _internalService.initMessaging();
  }

}

import 'dart:developer';

import 'package:weather_app/data/api/api_util.dart';
import 'package:weather_app/data/api/service/internal_service.dart';
import 'package:weather_app/data/api/service/wheather_service.dart';


class ApiModule {
  static ApiUtil? _apiUtil;

  static ApiUtil apiUtil() {
    if (_apiUtil == null) {
      log('Api Util Initialized');
      _apiUtil = ApiUtil(weatherService: WeatherService(), internalService: InternalService());
    }
    return _apiUtil!;
  }
}

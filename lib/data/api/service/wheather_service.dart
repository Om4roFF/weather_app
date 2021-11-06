import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app/data/api/request/get_body.dart';
import 'package:weather_app/domain/model/weather.dart';
import 'package:weather_app/domain/model/weather_condition.dart';

import 'api_service.dart';

class WeatherService {

  final Dio _dio = HttpService.dio;

  Future<Weather> fetchWeather(GetBody body) async {
    final response =
        await _dio.get('/forecast.json', queryParameters: body.toJson());
    print(response.realUri.toString());
    if (response.statusCode == 200) {
      return await compute(parseWeather, response.data);
    }
    throw Exception('Error fetching weather');
  }
  
  Future<List<WeatherCondition>> fetchWeatherConditions() async{
    final response = await Dio().get('http://www.weatherapi.com/docs/conditions.json');
    if(response.statusCode == 200){
      return await compute(parseWeatherCondition, response.data);
    }
    throw Exception('Error fetching weather conditions');
  }
}

Weather parseWeather(dynamic responseBody) {
  // final json = jsonDecode(responseBody);
  return Weather.fromJson(responseBody);
}

List<WeatherCondition> parseWeatherCondition(dynamic responseBody){
  final List<dynamic> weatherCondJson = responseBody as List<dynamic>;
  return weatherCondJson.map((condition) => WeatherCondition.fromJson(condition)).toList();
}
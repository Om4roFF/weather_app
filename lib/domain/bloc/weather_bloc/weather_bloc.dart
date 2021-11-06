import 'dart:developer';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:weather_app/data/database/application_config.dart';
import 'package:weather_app/data/database/condition_dao.dart';
import 'package:weather_app/data/database/day_dao.dart';
import 'package:weather_app/data/database/forecast_day_dao.dart';
import 'package:weather_app/data/database/hour_dao.dart';
import 'package:weather_app/data/database/weather_dao.dart';
import 'package:weather_app/data/mapper/weather_mapper.dart';
import 'package:weather_app/domain/bloc/weather_bloc/weather_event.dart';
import 'package:weather_app/domain/bloc/weather_bloc/weather_state.dart';
import 'package:weather_app/domain/model/weather.dart';
import 'package:weather_app/domain/model/weather_condition.dart';
import 'package:weather_app/internal/dependencies/repository_module.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc(WeatherState initialState) : super(initialState);

  late Weather _weather;
  late List<WeatherCondition>? _weatherCondition;
  late String _city;

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherFetchEvent) {
      try {
        await checkInternetConnection();
        log('INTERNET CONNECTION DONE');
        _city = await RepositoryModule.internalRepository().getCurrentAddress();
        ApplicationConfig.setCity(_city);
        log('CITY GET DONE');
        yield state.copyWith(
            weatherFetchType: WeatherFetchType.loading, city: _city);
        _weather = await RepositoryModule.weatherRepository().fetchWeather(
            key: ApplicationConfig.getKey,
            city: _city,
            day: event.days.toString());
        _weatherCondition =
            await RepositoryModule.weatherRepository().fetchWeatherConditions();
        log('DATA FETCH DONE');
        await _saveToCache();
        log('DATA CACHE DONE');
        yield state.copyWith(
          weather: _weather,
          weatherCondition: _weatherCondition,
          weatherType: WeatherType.day,
          weatherFetchType: WeatherFetchType.done,
        );
      } catch (_) {
        log(_.toString());
        var weatherBox = await Hive.openBox(HiveBoxName.cache);
        if(weatherBox.isNotEmpty){
          final WeatherDao weatherDao = weatherBox.values.first;
          _weather = WeatherMapper.fromCache(weatherDao);
          yield state.copyWith(
            weatherFetchType: WeatherFetchType.done,
            weather: _weather,
            weatherType: WeatherType.day,
            weatherCondition: [],
            city: ApplicationConfig.getCity,
          );
        }else{
          yield state.copyWith(
            weatherFetchType: WeatherFetchType.error,
          );
        }
      }
    } else if (event is WeatherDaysEvent) {
      yield state.copyWith(
        weatherType: WeatherType.day,
      );
    } else if (event is WeatherHoursEvent) {
      yield state.copyWith(
        weatherType: WeatherType.hour,
      );
    }
  }

  Future<void> checkInternetConnection()async{
    ConnectivityResult isInternet = await Connectivity().checkConnectivity();
    if(isInternet == ConnectivityResult.none){
      throw Exception('No Internet Connection');
    }
  }





  Future<void> _saveToCache() async {
    var weatherBox = await Hive.openBox(HiveBoxName.cache);

    var day = _weather.forecast.forecastday.first.day;
    var dayCondition = day.condition;
    var hours = _weather.forecast.forecastday.first.hour;

    var hourDao = <HourDao>[];

    for (var hour in hours) {
      hourDao.add(
        HourDao(
          time: hour.time,
          tempC: hour.tempC,
          tempF: hour.tempF,
          isDay: hour.isDay,
          windMph: hour.windMph,
          windKph: hour.windKph,
          humidity: hour.humidity,
          cloud: hour.cloud,
          feelslikeC: hour.feelslikeC,
          windchillC: hour.windchillC,
          heatindexC: hour.heatindexC,
          heatindexF: hour.heatindexF,
          dewpointC: hour.dewpointC,
          willItRain: hour.willItRain,
          willItSnow: hour.willItSnow,
          condition: ConditionDao(
            text: hour.condition.text,
            icon: hour.condition.icon,
            code: hour.condition.code,
          ),
        ),
      );
    }

    var dayDao = DayDao(
        maxtempC: day.maxtempC,
        mintempC: day.maxtempC,
        avgtempC: day.avgtempC,
        maxwindKph: day.maxwindKph,
        dailyWillItRain: day.dailyWillItRain,
        dailyChanceOfRain: day.dailyChanceOfRain,
        dailyWillItSnow: day.dailyWillItSnow,
        dailyChanceOfSnow: day.dailyChanceOfSnow,
        condition: ConditionDao(
            icon: dayCondition.icon,
            text: dayCondition.text,
            code: dayCondition.code));
    var forecastDay = ForecastDayDao(dayDao, hourDao);
    var weatherCache = WeatherDao([forecastDay]);
    weatherBox.add(weatherCache);
  }
}

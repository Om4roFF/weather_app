import 'package:weather_app/data/database/weather_dao.dart';
import 'package:weather_app/domain/model/condition.dart';
import 'package:weather_app/domain/model/current.dart';
import 'package:weather_app/domain/model/day.dart';
import 'package:weather_app/domain/model/forecast.dart';
import 'package:weather_app/domain/model/forecast_day.dart';
import 'package:weather_app/domain/model/hour.dart';
import 'package:weather_app/domain/model/location.dart';
import 'package:weather_app/domain/model/weather.dart';

mixin WeatherMapper {
  static Weather fromCache(WeatherDao weatherDao) {
    return Weather(
      location: Location(
        name: '',
        region: '',
        country: '',
        localtime: '',
        tzId: '',
      ),
      current: Current(
          cloud: 0,
          lastUpdated: '',
          tempC: 0.0,
          isDay: 0,
          windKph: 0,
          feelslikeC: 0,
          windDegree: 0),
      forecast: Forecast(
        forecastday: [
          Forecastday(
            date: DateTime.now(),
            dateEpoch: 0,
            day: Day(
              maxtempC: weatherDao.forecastday.first.day.maxtempC,
              mintempC: weatherDao.forecastday.first.day.mintempC,
              avgtempC: weatherDao.forecastday.first.day.avgtempC,
              maxwindKph: weatherDao.forecastday.first.day.maxwindKph,
              dailyWillItRain: weatherDao.forecastday.first.day.dailyWillItRain,
              dailyChanceOfRain:
                  weatherDao.forecastday.first.day.dailyChanceOfRain,
              dailyWillItSnow: weatherDao.forecastday.first.day.dailyWillItSnow,
              dailyChanceOfSnow:
                  weatherDao.forecastday.first.day.dailyChanceOfSnow,
              condition: Condition(
                icon: weatherDao.forecastday.first.day.condition.icon,
                text: weatherDao.forecastday.first.day.condition.text,
                code: weatherDao.forecastday.first.day.condition.code,
              ),
            ),
            hour: weatherDao.forecastday.first.hour
                .map(
                  (e) => Hour(
                    time: e.time,
                    tempC: e.tempC,
                    tempF: e.tempF,
                    isDay: e.isDay,
                    windMph: e.windMph,
                    windKph: e.windKph,
                    humidity: e.humidity,
                    cloud: e.cloud,
                    feelslikeC: e.feelslikeC,
                    windchillC: e.windchillC,
                    heatindexC: e.heatindexC,
                    heatindexF: e.heatindexF,
                    dewpointC: e.dewpointC,
                    willItRain: e.willItRain,
                    willItSnow: e.willItSnow,
                    condition: Condition(
                        text: e.condition.text,
                        code: e.condition.code,
                        icon: e.condition.icon),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

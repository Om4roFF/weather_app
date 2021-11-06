
import 'package:hive_flutter/adapters.dart';

import 'forecast_day_dao.dart';

part 'weather_dao.g.dart';

@HiveType(typeId: 0)
class WeatherDao extends HiveObject{

  @HiveField(0)
  final List<ForecastDayDao> forecastday;

  WeatherDao(this.forecastday);

}
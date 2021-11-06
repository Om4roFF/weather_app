

import 'package:hive_flutter/adapters.dart';

import 'day_dao.dart';
import 'hour_dao.dart';

part 'forecast_day_dao.g.dart';

@HiveType(typeId: 1)
class ForecastDayDao extends HiveObject{
  
  
  @HiveField(0)
  final DayDao day;
  
  
  @HiveField(1)
  final List<HourDao> hour;

  ForecastDayDao(this.day, this.hour);
  
}
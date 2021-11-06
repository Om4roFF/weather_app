

import 'package:hive_flutter/adapters.dart';

import 'condition_dao.dart';

part 'hour_dao.g.dart';

@HiveType(typeId: 3)
class HourDao extends HiveObject{

  @HiveField(0)
  final String time;

  @HiveField(1)
  final double tempC;

  @HiveField(2)
  final double tempF;

  @HiveField(3)
  final int isDay;

  @HiveField(4)
  final double windMph;

  @HiveField(5)
  final double windKph;

  @HiveField(6)
  final int humidity;

  @HiveField(7)
  final int cloud;

  @HiveField(8)
  final double feelslikeC;

  @HiveField(9)
  final double windchillC;

  @HiveField(10)
  final double heatindexC;

  @HiveField(11)
  final double heatindexF;

  @HiveField(12)
  final double dewpointC;

  @HiveField(13)
  final int willItRain;

  @HiveField(14)
  final int willItSnow;

  @HiveField(15)
  final ConditionDao condition;

  HourDao(
      {required this.time,
      required this.tempC,
      required this.tempF,
      required this.isDay,
      required this.windMph,
      required this.windKph,
      required this.humidity,
      required this.cloud,
      required this.feelslikeC,
      required this.windchillC,
      required this.heatindexC,
      required this.heatindexF,
      required this.dewpointC,
      required this.willItRain,
      required this.willItSnow,
      required this.condition});

}
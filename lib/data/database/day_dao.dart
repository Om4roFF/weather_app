

import 'package:hive_flutter/adapters.dart';

import 'condition_dao.dart';

part 'day_dao.g.dart';

@HiveType(typeId: 2)
class DayDao extends HiveObject{

  
  @HiveField(0)
  final double maxtempC;
  
  @HiveField(1)
  final double mintempC;
  
  @HiveField(2)
  final double avgtempC;
  
  @HiveField(3)
  final double maxwindKph;
  
  @HiveField(4)
  final int dailyWillItRain;
  
  @HiveField(5)
  final int dailyChanceOfRain;
  
  @HiveField(6)
  final int dailyWillItSnow;
  
  @HiveField(7)
  final int dailyChanceOfSnow;
  
  @HiveField(8)
  final ConditionDao condition;

  DayDao(
      {required this.maxtempC,
      required this.mintempC,
      required this.avgtempC,
      required this.maxwindKph,
      required this.dailyWillItRain,
      required this.dailyChanceOfRain,
      required this.dailyWillItSnow,
      required this.dailyChanceOfSnow,
      required this.condition});
  
}
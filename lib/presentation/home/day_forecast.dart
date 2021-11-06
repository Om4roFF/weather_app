

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:weather_app/domain/model/forecast_day.dart';
import 'package:weather_app/domain/model/weather_condition.dart';
import 'package:easy_localization/easy_localization.dart';
import 'day_detail.dart';

class DayForeCast extends StatelessWidget {
  
  final Forecastday foreCastDay;
  final List<WeatherCondition> weatherConditions;
  
  const DayForeCast({Key? key, required this.foreCastDay, required this.weatherConditions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherCondition = _getWeatherCondition();
    return Card(
      elevation: 5,
      color: foreCastDay.date.day == DateTime.now().day ? Colors.green.withOpacity(0.4) : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: (){
          showDialog(context: context, builder: (context){
            return DayDetail(weatherCondition: weatherCondition, foreCastDay: foreCastDay, weekday: _weekday(foreCastDay.date.weekday));
          });
        },  
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(_weekday(foreCastDay.date.weekday)),
                  Text('${foreCastDay.day.mintempC}°C/${foreCastDay.day.maxtempC}°C'),
                  Image.asset('assets/weather/64x64/day/${weatherCondition.icon}.png', height: 100, width: 100,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  WeatherCondition _getWeatherCondition(){
    try{
      return weatherConditions.where((element) => element.code == foreCastDay.day.condition.code).first;
    }catch(_){
      return WeatherCondition(code: 113, day: '', night: '', icon: 113, languages: []);
    }
  }


  String _weekday(int weekday){
    switch(weekday){
      case 1:
        return 'week.monday'.tr();
      case 2:
        return 'week.tuesday'.tr();
      case 3:
        return 'week.wednesday'.tr();
      case 4:
        return 'week.thursday'.tr();
      case 5:
        return 'week.friday'.tr();
      case 6:
        return 'week.saturday'.tr();
      case 7:
        return 'week.sunday'.tr();
      default:
        return 'week.error'.tr();
    }
  }


}





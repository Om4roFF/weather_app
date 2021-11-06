

import 'package:flutter/material.dart';
import 'package:weather_app/domain/model/hour.dart';
import 'package:weather_app/domain/model/weather_condition.dart';
import 'package:intl/intl.dart';

import 'hour_detail.dart';

class HourForeCast extends StatelessWidget {

  final Hour hour;
  final List<WeatherCondition> weatherConditions;

  const HourForeCast({Key? key, required this.hour, required this.weatherConditions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherCondition = _getWeatherCondition();
    return Card(
      elevation: 5,
      color: hour.time == currentTime() ? Colors.greenAccent.withOpacity(0.4) : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: (){
          showDialog(context: context, builder: (context){
            return HourDetail(weatherCondition: weatherCondition, hour: hour,);
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(hour.time),
              Text('${hour.tempC}°C'),
              Image.asset(hour.isDay == 0 ? 'assets/weather/64x64/night/${weatherCondition.icon}.png':'assets/weather/64x64/day/${weatherCondition.icon}.png', height: 100, width: 100,),
            ],
          ),
        ),
      ),
    );
  }

  String currentTime(){
    var now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH');
    final String formatted = formatter.format(now) + ':00';
    return formatted;
  }


  WeatherCondition _getWeatherCondition(){
    try{
      return weatherConditions.where((element) => element.code == hour.condition.code).first;
    }catch(_){
      return WeatherCondition(code: 113, day: '', night: '', icon: 113, languages: []);
    }
  }

}

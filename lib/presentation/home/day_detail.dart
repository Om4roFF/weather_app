import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/domain/model/forecast_day.dart';
import 'package:weather_app/domain/model/weather_condition.dart';
import 'package:easy_localization/easy_localization.dart';

class DayDetail extends StatelessWidget {
  final Forecastday foreCastDay;
  final WeatherCondition weatherCondition;
  final String weekday;
  const DayDetail(
      {Key? key,
      required this.foreCastDay,
      required this.weatherCondition,
      required this.weekday})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      insetPadding: const EdgeInsets.all(20),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                weekday,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Center(
              child: Image.asset(
                'assets/weather/64x64/day/${weatherCondition.icon}.png',
                height: 150,
                width: 150,
                alignment: Alignment.center,
                fit: BoxFit.contain,
              ),
            ),
            Center(
              child: Text(
                '${foreCastDay.day.mintempC}°C/${foreCastDay.day.maxtempC}°C',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Center(
              child: Text(
                getWeather(context),
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: 'avg_temp'.tr()),
                    TextSpan(text: '${foreCastDay.day.avgtempC}°C'),
                  ],
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: 'min_temp'.tr()),
                    TextSpan(text: '${foreCastDay.day.mintempC}°C'),
                  ],
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: 'max_temp'.tr()),
                    TextSpan(text: '${foreCastDay.day.maxtempC}°C'),
                  ],
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: 'max_wind'.tr()),
                    TextSpan(text: '${foreCastDay.day.maxwindKph}°C'),
                  ],
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getWeather(BuildContext context) {
    var current = context.locale.languageCode;
    var lang = langIsoValues.map[current];
    if(lang == null){
      return weatherCondition.day;
    }
    return weatherCondition.languages
        .where((element) => element.langIso! == lang)
        .first.dayText;
  }
}

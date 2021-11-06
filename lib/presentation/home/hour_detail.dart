import 'package:flutter/material.dart';
import 'package:weather_app/domain/model/forecast_day.dart';
import 'package:weather_app/domain/model/hour.dart';
import 'package:weather_app/domain/model/weather_condition.dart';
import 'package:easy_localization/easy_localization.dart';

class HourDetail extends StatelessWidget {
  final Hour hour;
  final WeatherCondition weatherCondition;
  const HourDetail({
    Key? key,
    required this.weatherCondition,
    required this.hour,
  }) : super(key: key);

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
                hour.time,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Center(
              child: Image.asset(
                hour.isDay == 0 ? 'assets/weather/64x64/night/${weatherCondition.icon}.png': 'assets/weather/64x64/day/${weatherCondition.icon}.png',
                height: 150,
                width: 150,
                alignment: Alignment.center,
                fit: BoxFit.contain,
              ),
            ),
            Center(
              child: Text(
                '${hour.tempC}°C',
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
                    TextSpan(text: 'feels_like'.tr()),
                    TextSpan(text: '${hour.feelslikeC}°C'),
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
                    TextSpan(text: 'heat_index'.tr()),
                    TextSpan(text: '${hour.heatindexC}°C'),
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
                    TextSpan(text: 'windchill_temp'.tr()),
                    TextSpan(text: '${hour.windchillC}°C'),
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
                    const TextSpan(text: 'Maximum Wind speed: '),
                    TextSpan(text: '${hour.windKph} kph'),
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
    context.setLocale(const Locale('en', 'US'));
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

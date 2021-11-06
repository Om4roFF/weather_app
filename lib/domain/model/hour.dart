
import 'package:weather_app/domain/model/condition.dart';

class Hour {
  Hour({
    required this.time,
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
    required this.condition,
  });

  final String time;
  final double tempC;
  final double tempF;
  final int isDay;
  final double windMph;
  final double windKph;
  final int humidity;
  final int cloud;
  final double feelslikeC;
  final double windchillC;
  final double heatindexC;
  final double heatindexF;
  final double dewpointC;
  final int willItRain;
  final int willItSnow;
  final Condition condition;

  factory Hour.fromJson(Map<String, dynamic> json) => Hour(
    time: json["time"],
    tempC: json["temp_c"],
    tempF: json["temp_f"].toDouble(),
    isDay: json["is_day"],
    windMph: json["wind_mph"].toDouble(),
    windKph: json["wind_kph"].toDouble(),
    humidity: json["humidity"],
    cloud: json["cloud"],
    feelslikeC: json["feelslike_c"].toDouble(),
    windchillC: json["windchill_c"].toDouble(),
    heatindexC: json["heatindex_c"],
    heatindexF: json["heatindex_f"].toDouble(),
    dewpointC: json["dewpoint_c"].toDouble(),
    willItRain: json["will_it_rain"],
    willItSnow: json["will_it_snow"],
    condition: Condition.fromJson(json["condition"]),
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "temp_c": tempC,
    "temp_f": tempF,
    "is_day": isDay,
    "wind_mph": windMph,
    "wind_kph": windKph,
    "humidity": humidity,
    "cloud": cloud,
    "feelslike_c": feelslikeC,
    "windchill_c": windchillC,
    "heatindex_c": heatindexC,
    "heatindex_f": heatindexF,
    "dewpoint_c": dewpointC,
    "will_it_rain": willItRain,
    "will_it_snow": willItSnow,
  };
}

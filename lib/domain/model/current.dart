
class Current {
  Current({
    required this.lastUpdated,
    required this.tempC,
    required this.isDay,
    required this.windKph,
    required this.windDegree,
    required this.cloud,
    required this.feelslikeC,
  });

  final String lastUpdated;
  final double tempC;
  final int isDay;
  final double windKph;
  final int windDegree;
  final int cloud;
  final double feelslikeC;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
    lastUpdated: json["last_updated"],
    tempC: json["temp_c"],
    isDay: json["is_day"],
    windKph: json["wind_kph"].toDouble(),
    windDegree: json["wind_degree"],
    cloud: json["cloud"],
    feelslikeC: json["feelslike_c"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "last_updated": lastUpdated,
    "temp_c": tempC,
    "is_day": isDay,
    "wind_kph": windKph,
    "wind_degree": windDegree,
    "cloud": cloud,
    "feelslike_c": feelslikeC,
  };
}


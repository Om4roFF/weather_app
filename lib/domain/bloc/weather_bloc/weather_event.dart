abstract class WeatherEvent {}


class WeatherDaysEvent extends WeatherEvent{}

class WeatherFetchEvent extends WeatherEvent{
  final int days = 3;
  WeatherFetchEvent({days});
}

class WeatherInitCityEvent extends WeatherEvent{}

class WeatherHoursEvent extends WeatherEvent{}
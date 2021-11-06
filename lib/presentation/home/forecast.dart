import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/domain/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_app/domain/bloc/weather_bloc/weather_state.dart';
import 'package:weather_app/domain/model/hour.dart';
import 'package:easy_localization/easy_localization.dart';
import 'day_forecast.dart';
import 'hour_forecast.dart';

class ForeCast extends StatelessWidget {
  const ForeCast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state.weatherFetchType == WeatherFetchType.none) {
          return const SizedBox();
        } else if (state.weatherFetchType == WeatherFetchType.loading) {
          return const SizedBox(
            width: double.infinity,
            height: 500,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state.weatherFetchType == WeatherFetchType.error) {
          return SizedBox(
            child: Center(
              child: const Text('error').tr(),
            ),
          );
        } else {
          if (state.weatherType == WeatherType.day) {
            return Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return DayForeCast(
                    foreCastDay: state.weather!.forecast.forecastday[index],
                    weatherConditions: state.weatherCondition!,
                  );
                },
                itemCount: state.weather!.forecast.forecastday.length,
              ),
            );
          } else if (state.weatherType == WeatherType.hour) {
            final List<Hour> hours =
                state.weather!.forecast.forecastday.first.hour;
            return Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return HourForeCast(
                    hour: hours[index],
                    weatherConditions: state.weatherCondition!,
                  );
                },
                itemCount: hours.length,
              ),
            );
          } else {
            return const SizedBox();
          }
        }
      },
    );
  }
}

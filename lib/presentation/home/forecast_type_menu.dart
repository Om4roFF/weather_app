

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/domain/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_app/domain/bloc/weather_bloc/weather_event.dart';
import 'package:easy_localization/easy_localization.dart';

class ForeCastTypeMenu extends StatefulWidget {
  const ForeCastTypeMenu({Key? key}) : super(key: key);

  @override
  State<ForeCastTypeMenu> createState() => _ForeCastTypeMenuState();
}

class _ForeCastTypeMenuState extends State<ForeCastTypeMenu> {

  int current = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DropdownButton(
        items: [
          DropdownMenuItem<int>(
            child: const Text('days').tr(),
            value: 1,
          ),
          DropdownMenuItem<int>(
            child: const Text('hours').tr(),
            value: 2,
          ),
        ],
        value: current,
        isExpanded: true,
        onChanged: (int? value) {
          setState(() {
            current = value!;
          });
          if (value == 1) {
            context.read<WeatherBloc>().add(WeatherDaysEvent());
          } else {
            context.read<WeatherBloc>().add(WeatherHoursEvent());
          }
        },
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/database/application_config.dart';
import 'package:weather_app/domain/bloc/weather_bloc/weather_bloc.dart';
import 'package:weather_app/domain/bloc/weather_bloc/weather_event.dart';
import 'package:weather_app/domain/bloc/weather_bloc/weather_state.dart';
import 'package:weather_app/internal/dependencies/repository_module.dart';
import 'package:weather_app/presentation/authentication/sign_in_page.dart';
import 'forecast.dart';
import 'forecast_type_menu.dart';
import 'geo_location.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => WeatherBloc(
          WeatherState(
            weatherFetchType: WeatherFetchType.none,
          ),
        )..add(WeatherFetchEvent()),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SafeArea(
                child: Padding(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(ApplicationConfig.isSigned!, style: Theme.of(context).textTheme.headline6,),
                      IconButton(onPressed: () async {
                        ApplicationConfig.setSign(null);
                        await RepositoryModule.internalRepository().signOutGoogle();
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignInPage()));
                      }, icon: const Icon(Icons.logout, color: Colors.blue,),)
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                ),
              ),
              const GeoLocation(),
              const ForeCastTypeMenu(),
              const ForeCast(),
            ],
          ),
        ),
      ),
    );
  }
}

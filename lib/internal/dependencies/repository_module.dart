
import 'package:weather_app/data/repository/internal_data_repository.dart';
import 'package:weather_app/data/repository/weather_data_repository.dart';
import 'package:weather_app/domain/repository/internal_repository.dart';
import 'package:weather_app/domain/repository/weather_repository.dart';

import 'api_module.dart';

mixin RepositoryModule{

  static WeatherDataRepository? _weatherDataRepository;
  static InternalDataRepository? _internalDataRepository;

  static WeatherRepository weatherRepository(){
    _weatherDataRepository ??= WeatherDataRepository(ApiModule.apiUtil());
    return _weatherDataRepository!;
  }

  static InternalRepository internalRepository(){
    _internalDataRepository ??= InternalDataRepository(ApiModule.apiUtil());
    return _internalDataRepository!;
  }
}
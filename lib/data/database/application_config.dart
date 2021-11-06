

import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/data/database/condition_dao.dart';
import 'package:weather_app/data/database/day_dao.dart';
import 'package:weather_app/data/database/forecast_day_dao.dart';
import 'package:weather_app/data/database/hour_dao.dart';
import 'package:weather_app/data/database/weather_dao.dart';

mixin ApplicationConfig{

  static late Box _box;
  static const String _isSigned = 'isSigned';
  static const String _language = 'language';
  static const String _city = 'city';
  static const String _key = 'key';
  static const String _keyValue = '834a0c1a00d0463084b83909210511';

  static Future<void> initHiveBox() async {
    await Hive.initFlutter();
    _box = await Hive.openBox(HiveBoxName.config);
    _setKey();
    Hive.registerAdapter(WeatherDaoAdapter());
    Hive.registerAdapter(ConditionDaoAdapter());
    Hive.registerAdapter(DayDaoAdapter());
    Hive.registerAdapter(ForecastDayDaoAdapter());
    Hive.registerAdapter(HourDaoAdapter());
  }
  
  static setSign(String? email){
    if(email == null){
      _box.delete(_isSigned);
    }else{
      _box.put(_isSigned, email);
    }

  }

  static setLang(String lang){
    _box.put(_language, lang);
  }

  static setCity(String city){
    _box.put(_city, city);
  }

  static _setKey(){
    _box.put(_key, _keyValue);
  }
  
  static String? get isSigned => _box.get(_isSigned);
  static String get getLanguage => _box.get(_language, defaultValue: 'ru_RU');
  static String get getCity => _box.get(_city, defaultValue: 'Kiev');
  static String get getKey => _box.get(_key);
}


mixin HiveBoxName {
  static const String config = 'config_box';
  static const String cache = 'cache_box';
}

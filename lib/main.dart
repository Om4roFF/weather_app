import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/data/database/application_config.dart';
import 'package:weather_app/internal/dependencies/repository_module.dart';
import 'package:weather_app/presentation/authentication/sign_in_page.dart';
import 'package:weather_app/presentation/home/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() async {
  await Future.delayed(const Duration(milliseconds: 2000));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await ApplicationConfig.initHiveBox();
  await EasyLocalization.ensureInitialized();
  // await RepositoryModule.internalRepository().initMessaging();
  FirebaseMessaging.onBackgroundMessage(_messageHandler);

  runApp(EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ru', 'RU')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: const MyApp()));
}

Future<void> _messageHandler(RemoteMessage message) async {
  final FlutterLocalNotificationsPlugin _fltNotification =
      FlutterLocalNotificationsPlugin();
  var androidInit =
      const AndroidInitializationSettings('@mipmap/ic_launcher'); //for logo
  var iosInit = const IOSInitializationSettings();
  var initSetting = InitializationSettings(android: androidInit, iOS: iosInit);
  var _androidDetails = const AndroidNotificationDetails('1', 'Weather App',
      channelDescription: 'Weather app');
  var _iosDetails = const IOSNotificationDetails();
  var _generalNotificationDetails =
      NotificationDetails(android: _androidDetails, iOS: _iosDetails);
  _fltNotification.initialize(initSetting);
  _fltNotification.show(message.hashCode, message.notification!.title,
      message.notification!.body, _generalNotificationDetails);
  print('background message ${message.notification!.body}');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.setLocale(Locale(
        context.deviceLocale.languageCode, context.deviceLocale.countryCode));
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: ApplicationConfig.isSigned == null
          ? const SignInPage()
          : const HomePage(),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:location/location.dart' as geo;

class InternalService {

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FlutterLocalNotificationsPlugin _fltNotification = FlutterLocalNotificationsPlugin();
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static const _androidDetails = AndroidNotificationDetails('1', 'Weather App', channelDescription: 'Weather app');
  static const _iosDetails = IOSNotificationDetails();
  static const _generalNotificationDetails = NotificationDetails(android: _androidDetails, iOS: _iosDetails);
  
  
  Future<String> getCurrentAddress() async {
    final geo.Location location = geo.Location();
    try {
      var hasPermission = await location.hasPermission();
      if (hasPermission != geo.PermissionStatus.granted ||
          hasPermission != geo.PermissionStatus.grantedLimited) {
        await location.requestPermission();
      }
      var myLocation = await location.getLocation();
      var addresses = await placemarkFromCoordinates(
          myLocation.latitude!, myLocation.longitude!,
          localeIdentifier: 'en_US');
      return addresses.first.locality!;
    } catch (_) {
      return 'Kiev';
    }
  }

  Future<String> googleSignInWithFirebase() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
      await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);
      await _auth.signInWithCredential(credential);
      return googleSignInAccount.email;
    } catch (e) {
      return '';
    }
  }

  Future<void> signOutGoogle()async{
    _googleSignIn.signOut();
    _auth.signOut();
  }




  Future<void> initMessaging() async {
    var s = await _messaging.getToken();
    print(s);
    var androidInit =
    const AndroidInitializationSettings('@mipmap/ic_launcher'); //for logo
    var iosInit = const IOSInitializationSettings();
    var initSetting = InitializationSettings(android: androidInit, iOS: iosInit);
    _fltNotification.initialize(initSetting);
 
    await _messaging.setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );


  }

  
}


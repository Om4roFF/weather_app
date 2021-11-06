
import 'package:weather_app/data/api/api_util.dart';
import 'package:weather_app/domain/repository/internal_repository.dart';

class InternalDataRepository extends InternalRepository{

  final ApiUtil _apiUtil;

  InternalDataRepository(this._apiUtil);

  @override
  Future<String> getCurrentAddress() {
    return _apiUtil.getCurrentAddress();
  }

  @override
  Future<String> signInWithGoogleFirebase() {
    return _apiUtil.googleSignInWithFirebase();
  }

  @override
  Future<void> signOutGoogle() {
    return _apiUtil.signOutGoogle();
  }

  @override
  Future<void> initMessaging() {
    return _apiUtil.initMessaging();
  }

}

abstract class InternalRepository{

  Future<String> getCurrentAddress();
  Future<String> signInWithGoogleFirebase();
  Future<void> signOutGoogle();
  Future<void> initMessaging();

}
import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/data/database/application_config.dart';
import 'package:weather_app/internal/dependencies/repository_module.dart';
import 'package:weather_app/presentation/home/home_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png', width: 300, height: 300,),
                GoogleAuthButton(onPressed: ()=> _login(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  
  void _login(BuildContext context) async {
    final email = await RepositoryModule.internalRepository().signInWithGoogleFirebase();
    if(email.isNotEmpty){
     ApplicationConfig.setSign(email);
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }
  
  
}

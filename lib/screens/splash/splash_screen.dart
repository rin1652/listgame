import 'package:flutter/material.dart';
import 'package:gamelist/screens/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constans/font.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigatetoLogin();
  }

  _navigatetoLogin() async {
    var sharedPreferences = await SharedPreferences.getInstance();

    userNameController.text = sharedPreferences.getString('username') ?? '';
    passwordController.text = sharedPreferences.getString('password') ?? '';

    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: backgroundImage, fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body:
            Center(child: Image(image: AssetImage('assets/images/splash.png'))),
      ),
    );
    ;
  }
}

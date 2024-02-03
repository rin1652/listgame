import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamelist/screens/games/tictacgame/tictacgamehome.dart';
import 'package:gamelist/screens/login/login.dart';
import 'package:gamelist/screens/home/home.dart';
import 'package:gamelist/screens/splash/splash_screen.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: true,
      home: const SplashScreen(),
    );
  }
}

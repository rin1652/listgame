import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamelist/screens/games/tictacgame/tictacgamehome.dart';
import 'package:gamelist/screens/login/login.dart';
import 'package:gamelist/screens/home/home.dart';
import 'package:gamelist/screens/splash/splash_screen.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  //splash screen
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //     // statusBarColor: Colors.transparent,
  //     // statusBarIconBrightness: Brightness.dark,
  //     ));

  // await initialization(null);

  runApp(const ProviderScope(
    child: MaterialApp(
      debugShowCheckedModeBanner: true,
      home: SplashScreen(),
    ),
  ));
}

// Future initialization(BuildContext? context) async {
//   await Future.delayed(Duration(seconds: 3));
// }

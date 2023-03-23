import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamelist/screens/games/tictacgame/tictacgamehome.dart';
import 'package:gamelist/screens/login/login.dart';
import 'package:gamelist/screens/home/home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // statusBarColor: Colors.transparent,
      // statusBarIconBrightness: Brightness.dark,
      ));
  runApp(MaterialApp(
    // debugShowCheckedModeBanner: false,
    home: tictacgamehomepage(),
  ));
}

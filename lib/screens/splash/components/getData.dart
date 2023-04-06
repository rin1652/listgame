import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constans/font.dart';
import '../../games/tictacgame/tictacgamehome.dart';
import '../../login/login.dart';

void GetData(ref) {
  ref.read(accountProviders.notifier).getAccount();
  ref.read(scoreProviders.notifier).getScore();
}

class AccountProvider extends StateNotifier<String> {
  AccountProvider() : super('');

  Future<void> getAccount() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    userNameController.text = sharedPreferences.getString('username') ?? '';
    passwordController.text = sharedPreferences.getString('password') ?? '';
  }

  Future<void> postAccount() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('username', userNameController.text);
    sharedPreferences.setString('password', passwordController.text);
  }
}

class ScoreProvider extends StateNotifier<int> {
  ScoreProvider() : super(0);

  Future<void> getScore() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    scoreP1 = sharedPreferences.getInt('scorep1') ?? 0;
    scoreP1 = sharedPreferences.getInt('scorep2') ?? 0;
  }

  Future<void> postScore() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt('scorep1', scoreP1);
    sharedPreferences.setInt('scorep2', scoreP1);
  }
}

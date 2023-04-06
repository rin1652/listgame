import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamelist/screens/login/login.dart';
import 'package:gamelist/screens/splash/components/getData.dart';
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
    super.initState();
    _navigatetoLogin();
  }

  _navigatetoLogin() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return const Screen();
  }
}

class Screen extends ConsumerWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final acCount = ref.watch(accountProviders);

    GetData(ref);
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: backgroundImage, fit: BoxFit.cover)),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body:
            Center(child: Image(image: AssetImage('assets/images/splash.png'))),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gamelist/constans/font.dart';
import 'package:gamelist/screens/home/components/appbar.dart';
import 'package:gamelist/screens/home/components/newest_game.dart';

import '../score/scorescreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePaState();
}

// screen status
// ignore: prefer_typing_uninitialized_variables
var _tcontrol;

class _HomePaState extends State<HomePage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _tcontrol = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Container(
        decoration: BoxDecoration(
            // image: DecorationImage(image: backgroundImage, fit: BoxFit.cover)
            color: TOPPICSTATUS == DARKTHEME ? Colors.black : Colors.white),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: buildAppBar(),
            body: const MainView(),
            bottomNavigationBar: const BotTabBar()),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Search(),
          SizedBox(
            height: 20,
          ),
          Seeall(),
        ],
      ),
    );
  }
}

class Seeall extends StatelessWidget {
  const Seeall({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[700],
          // color: Color(0xFFF6F8FF),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Column(
        children: [
          const SizedBox(
            height: 0,
            width: 1000,
          ),
          const BuildTitle('List game'),
          NewestGame(),
        ],
      ),
    );
  }
}

// sao không dùng chung các hàm được mặc dù đã import thư viện? có lẽ vì khác folder mẹ
class BuildTitle extends StatelessWidget {
  final String text;
  const BuildTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      width: double.maxFinite,
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            height: 1.8),
      ),
    );
  }
}

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Stack(children: [
          TextField(
            cursorColor: BEECOLOR,
            decoration: InputDecoration(
                fillColor: const Color(0xFFF6F8FF),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 0,
                ),
                prefixIcon: const Icon(
                  Icons.search_outlined,
                  color: BEECOLOR,
                  size: 30,
                ),
                hintText: 'Search game',
                hintStyle: const TextStyle(
                  color: Color(0xFFB0B0B0),
                  fontSize: 14,
                )),
          ),
          Positioned(
            bottom: 6,
            right: 12,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: BEECOLOR,
              ),
              child: const Icon(
                Icons.mic_outlined,
                color: Colors.white,
                size: 25,
              ),
            ),
          )
        ]));
  }
}

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: _tcontrol,
      children: const [
        HomeView(),
        Center(
          child: Text(
            'Welcome settings',
            style: TextStyle(color: Colors.white),
          ),
        ),
        Center(
          child: ScorePage(),
        ),
      ],
    );
  }
}

class BotTabBar extends StatefulWidget {
  const BotTabBar({super.key});

  @override
  State<BotTabBar> createState() => _BotTabBarState();
}

class _BotTabBarState extends State<BotTabBar>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: _tcontrol.index == 0 ? Colors.grey[700] : Colors.black,
      child: Material(
        elevation: 30.0,
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        color:
            TOPPICSTATUS == DARKTHEME ? const Color(0xFF252836) : Colors.white,
        child: TabBar(
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(width: 2.0, color: BEECOLOR),
              insets: EdgeInsets.symmetric(horizontal: 16.0),
            ),
            controller: _tcontrol,
            tabs: [
              Tab(
                  icon: Icon(TOPPICSTATUS == DARKTHEME
                      ? const IconData(0xf48e, fontFamily: 'MaterialIcons')
                      : const IconData(0xf0280, fontFamily: 'MaterialIcons'))),
              Tab(
                  icon: Icon(TOPPICSTATUS == DARKTHEME
                      ? const IconData(0xf363, fontFamily: 'MaterialIcons')
                      : const IconData(0xec76, fontFamily: 'MaterialIcons'))),
              Tab(
                  icon: Icon(TOPPICSTATUS == DARKTHEME
                      ? const IconData(0xf33e, fontFamily: 'MaterialIcons')
                      : const IconData(0xf0130, fontFamily: 'MaterialIcons'))),
            ]),
      ),
    );
  }
}

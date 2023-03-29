import 'package:flutter/material.dart';
import 'package:gamelist/constans/font.dart';
import 'package:gamelist/screens/home/components/appbar.dart';
import 'package:gamelist/screens/home/components/newest_game.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

var _tcontrol;

class _homepageState extends State<homepage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
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
            body: MainView(),
            bottomNavigationBar: BotTabBar()),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class homeview extends StatelessWidget {
  const homeview({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          search(),
          SizedBox(
            height: 20,
          ),
          seeall(),
        ],
      ),
    );
  }
}

class seeall extends StatelessWidget {
  const seeall({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[700],
          // color: Color(0xFFF6F8FF),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Column(
        children: [
          SizedBox(
            height: 0,
            width: 1000,
          ),
          _buildTitle('List game'),
          NewestGame(),
        ],
      ),
    );
  }
}

Widget _buildTitle(String text) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 25),
    width: double.maxFinite,
    child: Text(
      text,
      style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
          height: 1.8),
    ),
  );
}

class search extends StatelessWidget {
  const search({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Stack(children: [
          TextField(
            cursorColor: BEECOLOR,
            decoration: InputDecoration(
                fillColor: Color(0xFFF6F8FF),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 0,
                ),
                prefixIcon: Icon(
                  Icons.search_outlined,
                  color: BEECOLOR,
                  size: 30,
                ),
                hintText: 'Search game',
                hintStyle: TextStyle(
                  color: Color(0xFFB0B0B0),
                  fontSize: 14,
                )),
          ),
          Positioned(
              bottom: 6,
              right: 12,
              child: Container(
                padding: EdgeInsets.all(5),
                child: Icon(
                  Icons.mic_outlined,
                  color: Colors.white,
                  size: 25,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: BEECOLOR,
                ),
              ))
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
      children: [
        homeview(),
        Center(
          child: Text(
            'Welcome settings',
            style: TextStyle(color: Colors.white),
          ),
        ),
        Center(
          child: Text(
            'Welcome to score',
            style: TextStyle(color: Colors.white),
          ),
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
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        color: TOPPICSTATUS == DARKTHEME ? Color(0xFF252836) : Colors.white,
        child: TabBar(
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 2.0, color: BEECOLOR),
              insets: EdgeInsets.symmetric(horizontal: 16.0),
            ),
            controller: _tcontrol,
            tabs: [
              Tab(
                  icon: Icon(TOPPICSTATUS == DARKTHEME
                      ? IconData(0xf48e, fontFamily: 'MaterialIcons')
                      : IconData(0xf0280, fontFamily: 'MaterialIcons'))),
              Tab(
                  icon: Icon(TOPPICSTATUS == DARKTHEME
                      ? IconData(0xf363, fontFamily: 'MaterialIcons')
                      : IconData(0xec76, fontFamily: 'MaterialIcons'))),
              Tab(
                  icon: Icon(TOPPICSTATUS == DARKTHEME
                      ? IconData(0xf33e, fontFamily: 'MaterialIcons')
                      : IconData(0xf0130, fontFamily: 'MaterialIcons'))),
            ]),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gamelist/screens/games/tictacgame/elements/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constans/font.dart';

class tictacgamehomepage extends StatefulWidget {
  const tictacgamehomepage({super.key});

  @override
  State<tictacgamehomepage> createState() => _tictacgamehomepageState();
}

class _tictacgamehomepageState extends State<tictacgamehomepage> {
  String result = '';
  bool isPlayerOne = true;
  List<String> displayExOh = ['', '', '', '', '', '', '', '', ''];

  bool winer = false;
  static const maxSeconds = 30;
  Timer? timer;

  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;

  static var customFontWhite = GoogleFonts.coiny(
      textStyle: TextStyle(
    color: Colors.white,
    letterSpacing: 3,
    fontSize: 28,
  ));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: backgroundImage, fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Player X',
                              style: customFontWhite,
                            ),
                            Text(
                              xScore.toString(),
                              style: customFontWhite,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Player O',
                              style: customFontWhite,
                            ),
                            Text(
                              oScore.toString(),
                              style: customFontWhite,
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
              Expanded(
                flex: 5,
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _tapped(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                              width: 5, color: MainColor.primaryColor),
                          color: BEECOLOR,
                        ),
                        child: Center(
                          child: Text(
                            displayExOh[index],
                            style: GoogleFonts.coiny(
                              textStyle: TextStyle(
                                color: MainColor.primaryColor,
                                letterSpacing: 3,
                                fontSize: 64,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Text(
                    result,
                    style: customFontWhite,
                  )),
            ]),
          ),
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (isPlayerOne && displayExOh[index] == '') {
        displayExOh[index] = 'X';
        isPlayerOne = !isPlayerOne;
      } else if (!isPlayerOne && displayExOh[index] == '') {
        displayExOh[index] = 'O';
        isPlayerOne = !isPlayerOne;
      }

      _checkWin();
    });
  }

  void _checkWin() {
    if (displayExOh[0] == displayExOh[1] &&
        displayExOh[0] == displayExOh[2] &&
        displayExOh[0] != '') {
      setState(() {
        result = 'Player ${displayExOh[0]} Win';
        _updateScore(displayExOh[0]);
      });
    }
    if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != '') {
      setState(() {
        result = 'Player ${displayExOh[3]} Win';
        _updateScore(displayExOh[3]);
      });
    }
    if (displayExOh[6] == displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != '') {
      setState(() {
        result = 'Player ${displayExOh[6]} Win';
        _updateScore(displayExOh[6]);
      });
    }
    if (displayExOh[0] == displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != '') {
      setState(() {
        result = 'Player ${displayExOh[0]} Win';
        _updateScore(displayExOh[0]);
      });
    }
    if (displayExOh[1] == displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != '') {
      setState(() {
        result = 'Player ${displayExOh[1]} Win';
        _updateScore(displayExOh[1]);
      });
    }
    if (displayExOh[2] == displayExOh[5] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != '') {
      setState(() {
        result = 'Player ${displayExOh[2]} Win';
        _updateScore(displayExOh[2]);
      });
    }
    if (displayExOh[0] == displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != '') {
      setState(() {
        result = 'Player ${displayExOh[0]} Win';
        _updateScore(displayExOh[0]);
      });
    }
    if (displayExOh[2] == displayExOh[4] &&
        displayExOh[2] == displayExOh[6] &&
        displayExOh[2] != '') {
      setState(() {
        result = 'Player ${displayExOh[2]} Win';
        _updateScore(displayExOh[2]);
      });
    }
  }

  void _updateScore(String result) {
    if (result == 'X') {
      xScore++;
    } else if (result == 'O') {
      oScore++;
    }
  }
}

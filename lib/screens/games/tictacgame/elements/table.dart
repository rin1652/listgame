import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constans/font.dart';
import 'colors.dart';

class TableXO extends StatefulWidget {
  List<String> displayExOh;
  String result;
  bool isPlayerOne;
  bool winer;
  bool finaler;
  int filledBoxes;
  int tap;

  TableXO({
    required this.displayExOh,
    required this.result,
    required this.isPlayerOne,
    required this.winer,
    required this.finaler,
    required this.filledBoxes,
    required this.tap,
  });

  @override
  State<TableXO> createState() => _TableState();
}

class _TableState extends State<TableXO> {
  late List<String> displayExOh;
  late String result;
  late bool isPlayerOne;
  late bool winer;
  late bool finaler;
  late int filledBoxes;
  late int tap;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    displayExOh = widget.displayExOh;
    result = widget.result;
    isPlayerOne = widget.isPlayerOne;
    winer = widget.winer;
    finaler = widget.finaler;
    filledBoxes = widget.filledBoxes;
    tap = widget.tap;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 9,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            _tapped(index);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(width: 5, color: MainColor.primaryColor),
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
    );
  }

  void _tapped(int index) {
    setState(() {
      if (winer == false) {
        if (isPlayerOne && displayExOh[index] == '') {
          displayExOh[index] = 'X';
          isPlayerOne = !isPlayerOne;
          tap++;
        } else if (!isPlayerOne && displayExOh[index] == '') {
          displayExOh[index] = 'O';
          isPlayerOne = !isPlayerOne;
          tap++;
        }
        if (tap == 9) {
          finaler = true;
          if (result == '') {
            result = 'Draw';
          }
        }
      }

      _checkWin();
    });
  }

  void _checkWin() {
    if (winer == false) {
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
  }

  void _updateScore(String result) {
    finaler = true;
    winer = true;
    if (result == 'X') {
      //   xScore++;
      // } else if (result == 'O') {
      //   oScore++;
      // }
      // scoreP2 = oScore;
      // scoreP1 = xScore;
      // ref.read(scoreProviders.notifier).postScore();
    }
  }
}

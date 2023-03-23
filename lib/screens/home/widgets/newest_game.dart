import 'package:flutter/material.dart';
import 'package:gamelist/constans/font.dart';
import 'package:gamelist/models/game.dart';

import '../../games/tictacgame/tictacgamehome.dart';

class NewestGame extends StatelessWidget {
  final List<Game> listGames = Game.generateGames();
  NewestGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        children: listGames
            .map((e) => Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          e.icon,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e.name,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e.type,
                                    style: TextStyle(
                                        // màu xám mờ 0.8
                                        color: Color.fromARGB(255, 76, 76, 76)
                                            .withOpacity(0.8),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  _buildStar(),
                                ],
                              ),
                              SizedBox(
                                width: 56,
                              ),
                              btnPlay(gameClick: e),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget _buildStar() {
    final List<Color> color = [
      Colors.amber,
      Colors.amber,
      Colors.amber,
      Colors.amber,
      Color.fromARGB(255, 76, 76, 76).withOpacity(0.3)
    ];
    return Row(
      children: color
          .map((e) => Icon(
                Icons.star,
                color: e,
                size: 16,
              ))
          .toList(),
    );
  }
}

class btnPlay extends StatelessWidget {
  final Game gameClick;

  btnPlay({Key? key, required this.gameClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      padding: const EdgeInsets.only(right: 10.0),
      child: ElevatedButton(
        onPressed: () {
          if (gameClick.gameNumber == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => tictacgamehomepage()),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: BEECOLOR,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          'Play',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

import 'dart:ffi';

class Game {
  String bgImg;
  String icon;
  String name;
  String type;
  num score;
  num play;
  num review;
  String desc;
  List<String> ims;
  num gameNumber;
  Game(
    this.bgImg,
    this.icon,
    this.name,
    this.type,
    this.score,
    this.play,
    this.review,
    this.desc,
    this.ims,
    this.gameNumber,
  );
  static List<Game> generateGames() {
    return [
      Game(
        'assets/images/game1.png',
        'assets/images/game1.png',
        'Zic tac toe',
        'puzzle',
        4.5,
        1000,
        1000,
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam luctus, nunc nisl aliquam',
        [
          'assets/images/game1.png',
          'assets/images/game1.png',
          'assets/images/game1.png',
          'assets/images/game1.png',
          'assets/images/game1.png',
        ],
        1,
      ),
      Game(
        'assets/images/game2.png',
        'assets/images/game2.png',
        'Snake',
        'puzzle',
        4.5,
        1000,
        1000,
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam luctus, nunc nisl aliquam',
        [
          'assets/images/game2.png',
          'assets/images/game2.png',
          'assets/images/game2.png',
          'assets/images/game2.png',
          'assets/images/game2.png',
        ],
        2,
      ),
      Game(
        'assets/images/game5.png',
        'assets/images/game5.png',
        'NaruTOOO Game',
        'puzzle',
        4.5,
        1000,
        1000,
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam luctus, nunc nisl aliquam',
        [
          'assets/images/game5.png',
          'assets/images/game5.png',
          'assets/images/game5.png',
          'assets/images/game5.png',
          'assets/images/game5.png',
        ],
        3,
      ),
      Game(
        'assets/images/game3.png',
        'assets/images/game3.png',
        'Ball game',
        'puzzle',
        4.5,
        1000,
        1000,
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam luctus, nunc nisl aliquam',
        [
          'assets/images/game3.png',
          'assets/images/game3.png',
          'assets/images/game3.png',
          'assets/images/game3.png',
          'assets/images/game3.png',
        ],
        4,
      ),
      Game(
        'assets/images/game4.png',
        'assets/images/game4.png',
        'Run game',
        'puzzle',
        4.5,
        1000,
        1000,
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod, nunc sit amet aliquam luctus, nunc nisl aliquam',
        [
          'assets/images/game4.png',
          'assets/images/game4.png',
          'assets/images/game4.png',
          'assets/images/game4.png',
          'assets/images/game4.png',
        ],
        5,
      ),
    ];
  }
}

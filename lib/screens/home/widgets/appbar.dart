import 'package:flutter/material.dart';
import 'package:gamelist/constans/font.dart';

AppBar buildAppBar() {
  return AppBar(
    shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(50),
      bottomRight: Radius.circular(50),
    )),
    backgroundColor: BEECOLOR,
    leading: const IconButton(
      onPressed: null,
      icon: Icon(
        IconData(0xe3dc, fontFamily: 'MaterialIcons'),
        color: Colors.black,
      ),
      tooltip: 'Navigation Menu',
    ),
    title: const Text(
      'Bee Bug Arts',
      style: lblTextAppbar,
    ),
    actions: const [
      IconButton(
        onPressed: null,
        icon: Icon(
          IconData(0xee35, fontFamily: 'MaterialIcons'),
          color: Colors.black,
        ),
        tooltip: 'Search',
      ),
    ],
  );
}

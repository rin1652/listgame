import 'package:flutter/material.dart';

import 'components/buildListScore.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
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
          const BuildTitle('List score'),
          Scorelist(),
        ],
      ),
    );
  }
}

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

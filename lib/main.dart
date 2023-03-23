import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
        title: 'App đầu tiên của PHÚC',
        home: SafeArea(
          child: MyScaffold(),
        )),
  );
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({required this.title, super.key});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Row(
        children: [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.menu),
            tooltip: 'Đây là menu',
          ),
          // lấp đầy khoảng trắng ở giữa
          Expanded(child: title),
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.search),
            tooltip: 'Search',
          )
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          MyAppBar(
            title: Text(
              'Thanh bar nè',
              style: Theme.of(context) //
                  .primaryTextTheme
                  .titleLarge,
            ),
          ),
          const Expanded(
            child: Center(
              child: Text('Hello, my name world!'),
            ),
          ),
        ],
      ),
    );
  }
}

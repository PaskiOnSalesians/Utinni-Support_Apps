// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'game.dart';

void main() => runApp(const SnakeGame());

class SnakeGame extends StatelessWidget {
  const SnakeGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nagini Game',
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nagini game"),
        centerTitle: true,
      ),
      backgroundColor: Colors.brown[500],
      body: Game(),
    );
  }
}

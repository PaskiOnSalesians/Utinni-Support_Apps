import 'dart:async';

import 'barriers.dart';
import 'harry.dart';
import 'package:flutter/material.dart';

class BroomGame extends StatefulWidget {
  const BroomGame({Key? key}) : super(key: key);

  @override
  State<BroomGame> createState() => _BroomGameState();
}

class _BroomGameState extends State<BroomGame> {
  static double harryYaxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = harryYaxis;
  bool gameHasStarted = false;

  double gravity = -4.9;
  double velocity = 3.5;

  static double barrierXone = 1;
  double barrierXtwo = barrierXone + 1.5;

  void jump() {
    setState(() {
      time = 0;
      initialHeight = harryYaxis;
    });
  }

  bool harryIsDead() {
    if (harryYaxis > 1 || harryYaxis < -1) {
      return true;
    }
    return false;
  }

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(const Duration(milliseconds: 60), (timer) {
      //height = gravity * time * time + velocity * time;
      time += 0.05;
      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        harryYaxis = initialHeight - height;
      });

      setState(() {
        if (barrierXone < -2) {
          barrierXone += 3.5;
        } else {
          barrierXone -= 0.05;
        }
      });
      setState(() {
        if (barrierXtwo < -2) {
          barrierXtwo += 3.5;
        } else {
          barrierXtwo -= 0.05;
        }
      });
      // if (harryYaxis > 1) {
      //   timer.cancel();
      //   gameHasStarted = false;
      // }
      if (harryIsDead()) {
        timer.cancel();
        gameHasStarted = false;
        _showDialog();
      }
    });
  }

  void resetGame() {
    Navigator.pop(context);
    setState(() {
      harryYaxis = 0;
      gameHasStarted = false;
      time = 0;
      initialHeight = harryYaxis;
    });
  }

  void _showDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.brown,
            title: const Center(
              child: Text(
                "G A M E   O V E R",
                style: TextStyle(color: Colors.white),
              ),
            ),
            actions: [
              GestureDetector(
                onTap: resetGame,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    color: Colors.white,
                    child: const Text(
                      'PLAY AGAIN',
                      style: TextStyle(color: Colors.brown),
                    ),
                  ),
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (gameHasStarted) {
          jump();
        } else {
          startGame();
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    AnimatedContainer(
                      alignment: Alignment(0, harryYaxis),
                      duration: const Duration(milliseconds: 0),
                      // decoration: const BoxDecoration(
                      //     image: DecorationImage(
                      //         image:
                      //             AssetImage(('assets/images/estadio.jpg')))),
                      color: Colors
                          .blue, //Afegir camp de quicik com a fons de pantalla
                      child: const MyHarry(),
                    ),
                    Container(
                      alignment: const Alignment(0, -0.3),
                      child: gameHasStarted
                          ? const Text(" ")
                          : const Text("PULSA PARA JUGAR",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(barrierXone, 1.1),
                      duration: const Duration(milliseconds: 0),
                      child: const MyBarrier(size: 200),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(barrierXone, -1.1),
                      duration: const Duration(milliseconds: 0),
                      child: const MyBarrier(size: 200),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(barrierXtwo, 1.1),
                      duration: const Duration(milliseconds: 0),
                      child: const MyBarrier(size: 200),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(barrierXtwo, -1.1),
                      duration: const Duration(milliseconds: 0),
                      child: const MyBarrier(size: 200),
                    ),
                  ],
                )),
            Container(
              height: 15,
              color: Colors.green,
            ),
            Expanded(
              child: Container(
                color: Colors.brown,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("SCORE",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          SizedBox(height: 20),
                          Text("0",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 35))
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("BEST",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          SizedBox(
                            height: 20,
                          ),
                          Text("0",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 35)),
                        ],
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

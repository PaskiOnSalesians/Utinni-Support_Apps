import 'package:flutter/material.dart';

class BottonShowTrain extends StatelessWidget {
  const BottonShowTrain({
    Key? key,
    required this.pinPillPosition2,
  }) : super(key: key);

  final double pinPillPosition2;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut,
    left: 0,
    right: 0,
    top: pinPillPosition2,
    // bottom: 20,
    child: InkWell(
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            ),
        child: Column(children: [
          Container(
            color: Colors.white,
            child: Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/img/HogwartsExpress.png',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Column(
                  children: const [
                    Text(
                      'Estación Kings Cross',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
      onTap: () {
        
      },
    ));
  }
}
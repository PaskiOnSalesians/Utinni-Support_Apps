import 'package:flutter/material.dart';

class BottonShowJardi extends StatelessWidget {
  const BottonShowJardi({
    Key? key,
    required this.pinPillPosition6,
  }) : super(key: key);

  final double pinPillPosition6;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        left: 0,
        right: 0,
        top: pinPillPosition6,
        // bottom: 20,
        child: InkWell(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                // boxShadow: [
                //   BoxShadow(
                //       color: Colors.black.withOpacity(0.2),
                //       blurRadius: 10,
                //       offset: Offset.zero)
                // ]
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
                            'assets/img/JardinBotanico.jpg',
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
                          'Jardi botanic',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text('Joc'),
                        Text('Mic mic'),
                      ],
                    )
                  ],
                ),
              )
            ]),
          ),
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => Splash()),
            // );
          },
        ));
  }
}
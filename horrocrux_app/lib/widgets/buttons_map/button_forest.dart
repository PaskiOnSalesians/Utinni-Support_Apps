import 'package:flutter/material.dart';
import 'package:horrocrux_app/screens/login-register/login_screen.dart';
import 'package:horrocrux_app/screens/snake-game/main.dart';

class BottonShowBosque extends StatelessWidget {
  const BottonShowBosque({
    Key? key,
    required this.pinPillPosition4,
  }) : super(key: key);

  final double pinPillPosition4;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      left: 0,
      right: 0,
      top: pinPillPosition4,
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
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipOval(
                          child: Image.asset(
                            'assets/img/Bosque.jpg',
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 30),
                    Column(
                      children: const [
                        Text(
                          'El Bosque Prohibido',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text('Joc'),
                        Text('Petita descripcio'),
                      ],
                    ),
                    const SizedBox(width: 30),
                    Column(
                      children: [
                        IconButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const SnakeGame()));
                          },
                          icon: const Icon(Icons.home, color: Colors.green, size: 32,)
                        )
                      ],
                    )
                  ],
                ),
              )
            ]
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        },
      ));
  }
}
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:horrocrux_app/screens/screens-main/info_page.dart';

class BottonShowCasas extends StatelessWidget {
  const BottonShowCasas({
    Key? key,
    required this.pinPillPosition5,
  }) : super(key: key);

  final double pinPillPosition5;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        left: 0,
        right: 0,
        top: pinPillPosition5,
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
                            'assets/img/CasaHarry.jpg',
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
                          'Casa muggle de Harry',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        Text('Punt d informació'),
                        Text('Mic mic'),
                      ],
                    ),
                    const SizedBox(width: 30),
                    Column(
                      children: [
                        IconButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const InfoPage()));
                          },
                          icon: Icon(Icons.home, color: Colors.purple, size: 32,)
                        )
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
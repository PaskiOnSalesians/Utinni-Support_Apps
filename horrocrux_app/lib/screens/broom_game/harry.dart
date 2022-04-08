import 'package:flutter/material.dart';

class MyHarry extends StatelessWidget {
  const MyHarry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        height: 60,
        width: 60,
        child: Image(
            image: AssetImage('assets/images/harryesco.png'), width: 200));
  }
}

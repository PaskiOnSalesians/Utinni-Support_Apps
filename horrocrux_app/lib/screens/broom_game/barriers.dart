import 'package:flutter/material.dart';

class MyBarrier extends StatelessWidget {
  // const MyBarrier({Key? key}) : super(key: key);

  final double? size;

   const  MyBarrier({this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: size,
      decoration: BoxDecoration(
          color: Colors.green,
          border: Border.all(width: 10, color: Colors.green),
          borderRadius: BorderRadius.circular(15)),
    );
  }
}

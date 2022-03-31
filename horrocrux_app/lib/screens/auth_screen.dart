import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({ Key? key }) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/horrocrux_bg.gif', width: 32, height: 32,),   
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            height: 50,
            child: TextButton(
              onPressed: (){
                
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple),
              ),
              child: const Text(
                'Sign In',
                style: TextStyle(
                  color: Colors.white
                ),
              )
            ),
          )
        ],
      )
    );
  }
}
import 'dart:ui';

import 'package:http/http.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          Email_Login()
          ,
        ],
      )
    );
  }
}

class AppBarSeparator extends StatelessWidget {
  const AppBarSeparator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3.5,
    );
  }
}

class Separator extends StatelessWidget {
  const Separator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
    );
  }
}

class Email_Register extends StatelessWidget {
  const Email_Register({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      width: MediaQuery.of(context).size.width / 1.2,
      height: MediaQuery.of(context).size.height / 14,
      decoration: BoxDecoration(
        color: Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(30)
      ),
    );
  }
}

class Email_Login extends StatelessWidget {
  const Email_Login({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: CupertinoTextField(
            placeholder: "Email",
            clearButtonMode: OverlayVisibilityMode.editing,
            obscureText: true,
            autocorrect: false,
          )
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
          child: CupertinoTextField(
            placeholder: "Password",
            clearButtonMode: OverlayVisibilityMode.editing,
            obscureText: true,
            autocorrect: false,
          ),
        ),
        TextButton.icon(
          onPressed: (){},
          icon: Icon(Icons.send_rounded),
          label: Text("Sign In")
        ),
      ],
    );
    
    // signin(email, password) async {
    //   final http.Response response = await http.post('http://51.83.97.10:3000/api/auth/signin',
    //   headers: <String, String)>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    // }

  // Container(
  //     alignment: Alignment.topCenter,
  //     width: MediaQuery.of(context).size.width / 1.2,
  //     height: MediaQuery.of(context).size.height / 14,
  //     decoration: BoxDecoration(
  //       color: Color(0xFFF3F3F3),
  //       borderRadius: BorderRadius.circular(30)
  //     ),

  //     child: ClipRRect(
  //       borderRadius: BorderRadius.circular(25),
  //       child: TextButton.icon(
  //         icon: const Icon(Icons.mail_outline_rounded),
  //         label: Text('Accedir amb correu'),
  //         style: ButtonStyle(
  //           fixedSize: Size.from
  //         ),
  //         onPressed: () {  }
  //       ),
  //     ),
  //   );
  }
}
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'register_screen.dart';

import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var email, password, token;

  void _navigateNextScreen(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            autocorrect: false,
            decoration: InputDecoration(
              hintText: 'Email',
              border: OutlineInputBorder()
            ),
            onChanged: (val){
              email = val;
            }
          ),
          SizedBox(height: 20),
          TextField(
            autocorrect: false,
            textInputAction: TextInputAction.send,
            decoration: InputDecoration(
              hintText: 'Password',
              border: OutlineInputBorder()
            ),
            obscureText: true,
            onChanged: (val){
              password = val;
            }
          ),
          SizedBox(height: 40),
          TextButton(
            onPressed: (){
              AuthService().login(email, password).then((val){
                if(val.data['success']){
                  token = val.data['token'];
                  Fluttertoast.showToast(
                    msg: 'Authenticated',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                  );
                }
              });
            },
            child: Text(
              'Authenticate',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.purple)
            )
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: (){
                _navigateNextScreen(context);
              },
            child: Text(
              'Go to Register',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.purple)
            )
          ),
        ],
      )
    );
  }
}
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../services/auth_service.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({ Key? key }) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
var token, password, username, email;

  void _navigateNextScreen(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
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
              hintText: 'Username',
              border: OutlineInputBorder()
            ),
            onChanged: (val){
              username = val;
            }
          ),
          SizedBox(height: 20),
          TextField(
            autocorrect: false,
            textInputAction: TextInputAction.send,
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
              AuthService().register(username, email, password).then((val){
                if(val.data['success']){
                  token = val.data['token'];
                  Fluttertoast.showToast(
                    msg: 'Registered',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0
                  );
                }
              });
            },
            child: Text(
              'Register',
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
              'Go to Login',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.purple)
            )
          ),
        ]
      )
    );
  }
}
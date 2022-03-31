import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'register_screen.dart';

import '../../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var email, password, token;

  void _navigateNextScreen(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegisterScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/logo/horrocrux_logo.png', width: 150, height: 150),
          const SizedBox(height: 40),
          Container(
            alignment: Alignment.center,
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.2 ,
              
              child: Column(
                children: [
                  TextField(
                    autocorrect: false,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder()
                    ),
                    onChanged: (val){
                      email = val;
                    }
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    autocorrect: false,
                    textInputAction: TextInputAction.send,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder()
                    ),
                    obscureText: true,
                    onChanged: (val){
                      password = val;
                    }
                  ),
                  const SizedBox(height: 40),
                  TextButton(
                    onPressed: (){
                      AuthService().login(email, password).then((val){
                        if(val.data['success']){
                          token = val.data['token'];
                          Fluttertoast.showToast(
                            msg: 'Authenticated',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0
                          );
                        }
                      });
                    },
                    child: const Text(
                      'Authenticate',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.purple)
                    )
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: (){
                        _navigateNextScreen(context);
                      },
                    child: const Text(
                      'Go to Register',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.purple)
                    )
                  ),
                ]
              ),
            ),
          )
        ],
      )
    );
  }
}
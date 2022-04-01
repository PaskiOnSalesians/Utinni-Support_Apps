import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:horrocrux_app/screens/auth_screen.dart';

import '../../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var email, password, token;

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
              width: MediaQuery.of(context).size.width / 1.2,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 100,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        width: 10, 
                        color: const Color(0xFFF0F0F0),
                        style: BorderStyle.solid
                      )
                    ),
                    child: SizedBox(
                      child: TextField(
                        autocorrect: false,
                        textInputAction: TextInputAction.send,
                        decoration: const InputDecoration(
                          filled: true,
                          hintText: "Email",
                          fillColor: Color(0xFFF0F0F0),
                          contentPadding: EdgeInsets.fromLTRB(25,9,0,9),
                          border: InputBorder.none
                        ),
                        onChanged: (val){
                          email = val;
                        }
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width - 100,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        width: 10, 
                        color: const Color(0xFFF0F0F0),
                        style: BorderStyle.solid
                      )
                    ),
                    child: SizedBox(
                      child: TextField(
                        autocorrect: false,
                        textInputAction: TextInputAction.send,
                        decoration: const InputDecoration(
                          filled: true,
                          hintText: "Contraseña",
                          fillColor: Color(0xFFF0F0F0),
                          contentPadding: EdgeInsets.fromLTRB(25,9,0,9),
                          border: InputBorder.none
                        ),
                        obscureText: true,
                        onChanged: (val){
                          password = val;
                        }
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: 50,
                    child: TextButton(
                      onPressed: (){
                        AuthService().login(email, password).then((val){
                          if(val.data['success']){
                            token = val.data['token'];
                            Fluttertoast.showToast(
                              msg: 'Acceso correcto',
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
                        'Acceder',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.purple),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            side: const BorderSide(
                              color: Colors.white,
                              //width: 4,
                            ),
                            borderRadius: BorderRadius.circular(30.0),
                          )
                        ),
                      )
                    ),
                  ),
                  const SizedBox(height: 50),
                  IconButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AuthScreen()));
                    },
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.purple,
                      size: 32,
                    )
                  )
                ]
              ),
            ),
          )
        ],
      )
    );
  }
}
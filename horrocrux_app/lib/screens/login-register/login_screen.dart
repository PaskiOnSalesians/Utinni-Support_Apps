// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:horrocrux_app/components/variables.dart';
import 'package:horrocrux_app/screens/screens-main/auth_screen.dart';
import 'package:horrocrux_app/screens/screens-main/mapgo.dart';

import '../../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var username, password, token;
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/back/fondo_auth.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.purple.withOpacity(1.0),
              BlendMode.softLight
            )
          )
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/logo/horrocrux_logo_white.png', width: 300),
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
                            width: 2, 
                            color: const Color(0xFFF0F0F0),
                            style: BorderStyle.solid
                          )
                        ),
                        child: SizedBox(
                          child: TextField(
                            autocorrect: false,
                            textInputAction: TextInputAction.send,
                            style: const TextStyle(
                              color: Colors.white
                            ),
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              filled: true,
                              hintText: "Nombre de usuario",
                              //fillColor: Color(0xFFF0F0F0),
                              contentPadding: EdgeInsets.fromLTRB(25,9,0,11),
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.white
                              )
                            ),
                            onChanged: (val){
                              username = val;
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
                            width: 2, 
                            color: const Color(0xFFF0F0F0),
                            style: BorderStyle.solid
                          )
                        ),
                        child: SizedBox(
                          child: TextField(
                            autocorrect: false,
                            textInputAction: TextInputAction.send,
                            style: const TextStyle(
                              color: Colors.white
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              hintText: "Contraseña",
                              suffixIcon: IconButton(
                                onPressed: (){
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                                icon: Icon(
                                  _isObscure ? Icons.visibility : Icons.visibility_off,
                                  color: Colors.white,
                                )),
                              contentPadding: const EdgeInsets.fromLTRB(25,9,0,11),
                              border: InputBorder.none,
                              hintStyle: const TextStyle(
                                color: Colors.white
                              )
                            ),
                            obscureText: _isObscure,
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
                            AuthService().login(username, password).then((val){
                              if(val.data['success']){
                                token = val.data['token'];
                                currentToken = token;
                                currentUsername = username;
                                currentUserId = val.data["id"];
                                Fluttertoast.showToast(
                                  msg: 'Acceso correcto',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                                );
                                
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Mapgo()));
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
                          color: Colors.white,
                          size: 32,
                        )
                      )
                    ]
                  ),
                ),
              )
            ],
          ),
        )
      )
    );
  }
}
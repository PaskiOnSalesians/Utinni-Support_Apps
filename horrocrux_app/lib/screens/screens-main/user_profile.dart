// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:horrocrux_app/components/variables.dart';
import 'package:horrocrux_app/screens/qr/qr_things.dart';
import 'package:horrocrux_app/screens/screens-main/mapgo.dart';

class UserProfile extends StatefulWidget {
  
  const UserProfile({ Key? key }) : super(key: key);

  @override
  
  State<UserProfile> createState() => _UserProfileState();
}


class _UserProfileState extends State<UserProfile> {
  var username, token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          children: [
            // ----------------------------- Turn back button
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 10,
              child: Row(
                children: [
                  TextButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Mapgo()));
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.black,
                        ),
                        SizedBox(width: 20),
                        Padding(
                          padding: EdgeInsets.only(top: 2),
                          child: Text(
                            'VOLVER',
                            style: TextStyle(
                              color: Colors.black
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ),
            // ----------------------------- User photo & profile info
            SizedBox(
              child: Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width / 12),
                  Row(
                    children: [
                      Text(
                        '@' + currentUsername,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        )
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width / 5),
                      TextButton(
                        onPressed: (){},
                        child: const Text('Editar perfil', style: TextStyle(color: Colors.purple),),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              side: const BorderSide(
                                color: Colors.purple
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        )
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                             Navigator.of(context).push(MaterialPageRoute(builder: (context) => const QrUser()));
                            },
                            icon: const Icon(Icons.qr_code_rounded, size: 32)
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // ----------------------------- Buttons
            SizedBox(
              child: Column(
                children: [
                  const SizedBox(height: 20.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: MediaQuery.of(context).size.height / 3,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Scores',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold
                              )
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width / 1.25,
                                    height: 2,
                                    color: Colors.black,
                                  ),
                                ],
                              )
                          ],
                        )
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: MediaQuery.of(context).size.height / 3,
                        color: Colors.white,
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.1,
                          height: MediaQuery.of(context).size.height / 3,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:  [
                              const Text(
                                'Friends',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold
                                )
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width / 1.25,
                                    height: 2,
                                    color: Colors.black,
                                  ),
                                ],
                              )
                              
                            ],
                          ),
                        )
                      ),
                    ],
                  )
                ],
              )
            ),
          ]
        ),
      )
    );
  }
}
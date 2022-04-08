// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:horrocrux_app/components/menu/main_menu.dart';
import 'package:horrocrux_app/components/variables.dart';
import 'package:horrocrux_app/screens/qr/qr_things.dart';
import 'package:horrocrux_app/services/auth_service.dart';

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
      appBar: AppBar(
          title: const Text('Perfil de usuario'),
          backgroundColor: Colors.purple,
        ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Stack(
          children: [
              Column(
                children: [
                  
                  const SizedBox(height: 100,),
                  // ----------------------------- User photo & profile info
                  SizedBox(
                    child: Row(
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width / 12),
                        Row(
                          children: [
                            Text(
                              currentUsername,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              )
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width / 2.1),
                            // TextButton(
                            //   onPressed: (){},
                            //   child: const Text('Editar perfil', style: TextStyle(color: Colors.purple),),
                            //   style: ButtonStyle(
                            //     backgroundColor: MaterialStateProperty.all(Colors.white),
                            //     shape: MaterialStateProperty.all(
                            //       RoundedRectangleBorder(
                            //         side: const BorderSide(
                            //           color: Colors.purple
                            //         ),
                            //         borderRadius: BorderRadius.circular(5.0),
                            //       ),
                            //     ),
                            //   )
                            // ),
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
                        const SizedBox(height: 10.0),
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
                                        Column(children: [
                                            Text(getFriends(), style: const TextStyle(fontSize: 13, color: Colors.black),)
                                            // ListView.builder(
                                            //   padding: const EdgeInsets.all(8),
                                            //   itemCount: friendsList.length,
                                            //   itemBuilder: (BuildContext context, int index) {
                                            //     return Text( friendsList[index]);
                                            //   }
                                            // )
                                          ],
                                        )
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
              const MainMenu()
          ],
        ),
      )
    );
  }

 String getFriends() {
    AuthService().getUserData(currentUserId).then((val){
      if(val.data['friends_id'] != null){
        friendsList = val.data['friends_id'];
        
        Fluttertoast.showToast(
          msg: 'Lista de amigos cargada',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
        );
      }
    });
    return friendsList.join(' ');
  }
}
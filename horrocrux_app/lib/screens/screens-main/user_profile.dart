import 'package:flutter/material.dart';
import 'package:horrocrux_app/screens/screens-main/mapgo.dart';

class UserProfile extends StatefulWidget {
  
  const UserProfile({ Key? key }) : super(key: key);

  @override
  
  State<UserProfile> createState() => _UserProfileState();
}


class _UserProfileState extends State<UserProfile> {
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
                  const SizedBox(width: 40),
                  const CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.black,
                  ),
                  const SizedBox(width: 60),
                  Column(
                    children: [
                      const Text('UserName'),
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
                            onPressed: () {},
                            icon: const Icon(Icons.qr_code_rounded, size: 32)
                          ),
                          IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.emoji_events_rounded, size: 32)
                          )
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
                        decoration: BoxDecoration(
                          color: const Color(0x99EFEEEE),
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text('Scores', style: TextStyle(fontSize: 20.0)),
                            
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
                        decoration: BoxDecoration(
                          color: const Color(0x99EFEEEE),
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text('Friends', style: TextStyle(fontSize: 20.0),),
                            
                          ],
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
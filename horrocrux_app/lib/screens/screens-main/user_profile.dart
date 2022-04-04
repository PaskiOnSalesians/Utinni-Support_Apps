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
                        child: const Text('Editar perfil'),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          )
                      )
                    ],
                  ),
                  
                ],
              ),
            )
          ]
        ),
      )
    );
  }
}
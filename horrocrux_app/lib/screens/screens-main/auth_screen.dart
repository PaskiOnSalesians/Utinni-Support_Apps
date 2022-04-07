
import 'package:flutter/material.dart';
import 'package:horrocrux_app/widgets/buttons_main_screen/button_acceder.dart';
import 'package:horrocrux_app/widgets/buttons_main_screen/button_registro.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({ Key? key }) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage("assets/back/fondo_main.jpg"),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage('assets/logo/horrocrux_logo_white.png'),
              width: 400,
            ),
            SizedBox(height: 40,),
            ButtonAccess(),
            SizedBox(height: 40,),
            ButtonRegister()
          ],
        ),
      )
    );
  }
}
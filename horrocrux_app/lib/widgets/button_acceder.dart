import 'package:flutter/material.dart';
import 'package:horrocrux_app/screens/login-register/login_screen.dart';

class ButtonAccess extends StatelessWidget {
  const ButtonAccess({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      height: 50,
      child: TextButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen()));
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.purple),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            )
          ),
        ),
        child: const Text(
          'Acceder',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white
          ),
        )
      ),
    );
  }
}
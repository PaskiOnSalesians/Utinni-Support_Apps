import 'package:flutter/material.dart';
import 'package:horrocrux_app/screens/login-register/register_screen.dart';

class ButtonRegister extends StatelessWidget {
  const ButtonRegister({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      height: 50,
      child: TextButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegisterScreen()));
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              side: const BorderSide(
                color: Colors.white,
                width: 4,

              ),
              borderRadius: BorderRadius.circular(30.0),
            )
          ),
        ),
        child: const Text(
          'Registrarse',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white
          ),
        )
      ),
    );
  }
}
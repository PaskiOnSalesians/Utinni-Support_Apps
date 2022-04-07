import 'package:flutter/material.dart';
import 'package:horrocrux_app/screens/qr/qr_code.dart';
import 'package:horrocrux_app/screens/qr/qr_scanner.dart';
import 'package:horrocrux_app/screens/screens-main/user_profile.dart';

class QrUser extends StatefulWidget {
  
  const QrUser({ Key? key }) : super(key: key);

  @override
  
  State<QrUser> createState() => _QrUserState();
}


class _QrUserState extends State<QrUser> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Row(
          children: [
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 10,
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UserProfile()));
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
              ],
            )
          ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 150,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 6,
                    child: TextButton.icon(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  ScanScreen()));
                      }, label: const Text('Escanear código QR', style: TextStyle(color: Colors.white),),
                      icon: const Icon(Icons.scanner_rounded, color: Colors.white,),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.green),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 6,
                    child: TextButton.icon(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const QrCode()));
                      }, label: const Text('Generar código QR', style: TextStyle(color: Colors.white),),
                      icon: const Icon(Icons.qr_code_2_rounded, color: Colors.white,),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                    ),
                  )
                ]
              ),
            ],
          ),
        ],
      )
    );
  }
}
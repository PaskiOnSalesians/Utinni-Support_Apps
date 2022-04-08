import 'package:flutter/material.dart';
import 'package:horrocrux_app/screens/qr/qr_code.dart';
import 'package:horrocrux_app/screens/qr/qr_scanner.dart';

class QrUser extends StatefulWidget {
  
  const QrUser({ Key? key }) : super(key: key);

  @override
  
  State<QrUser> createState() => _QrUserState();
}


class _QrUserState extends State<QrUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Código QR'),
          backgroundColor: Colors.purple,
        ),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
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
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const ScanScreen()));
                        }, label: const Text('Escanear código QR', style: TextStyle(color: Colors.white),),
                        icon: const Icon(Icons.scanner_rounded, color: Colors.white,),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.green),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            )
                          ),
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
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            )
                          ),
                        ),
                      ),
                    )
                  ]
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:horrocrux_app/components/variables.dart';
import 'package:horrocrux_app/screens/qr/qr_things.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCode extends StatefulWidget {
  const QrCode({ Key? key }) : super(key: key);

  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
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
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const QrUser()));
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
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 2,
                child: Column(
                  children: [
                    QrImage(data: currentUserId.toString(),),
                  ],
                ),
              ),
            ],
          )
        ]
      ),      
    );
  }
}
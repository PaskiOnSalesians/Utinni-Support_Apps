// ignore_for_file: constant_identifier_names, avoid_print, must_call_super, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:horrocrux_app/components/menu/main_menu.dart';
import 'package:horrocrux_app/screens/screens-main/auth_screen.dart';
import 'package:horrocrux_app/widgets/buttons_map/button_forest.dart';
import 'package:horrocrux_app/widgets/buttons_map/button_garden.dart';
import 'package:horrocrux_app/widgets/buttons_map/button_house.dart';
import 'package:horrocrux_app/widgets/buttons_map/button_houses.dart';
import 'package:horrocrux_app/widgets/buttons_map/button_market.dart';
import 'package:horrocrux_app/widgets/buttons_map/button_park.dart';
import 'package:horrocrux_app/widgets/buttons_map/button_train.dart';
import 'package:permission_handler/permission_handler.dart';

const double PIN_VISIBLE_POSITION = 40;
const double PIN_INVISIBLE_POSITION = -220;

class Mapgo extends StatefulWidget {
  final LatLng Casa = const LatLng(41.39473136159721, 2.1276748636311775);
  final LatLng Estacio = const LatLng(41.39836145166467, 2.1258408980216323);
  final LatLng ParqueCole = const LatLng(41.39349178411225, 2.1283920868367106);
  final LatLng BosqueSarria = const LatLng(41.410614882087664, 2.1099410210945333);
  final LatLng CasasSarria =
      const LatLng(41.39218700718102, 2.1273440510129933); //PicketPosttClose
  final LatLng JardinesSarria =
      const LatLng(41.392445607953455, 2.122804447581041); //botanico
  final LatLng MercatSarria =
      const LatLng(41.39394163426724, 2.1235249438108275);

  const Mapgo({Key? key}) : super(key: key); //mercado

  @override
  _MapgoState createState() => _MapgoState();
}

class _MapgoState extends State<Mapgo> {
  Future<void> _checkPermission() async {
    final serviceStatus = await Permission.locationWhenInUse.serviceStatus;
    final isGpsOn = serviceStatus == ServiceStatus.enabled;

    if(!isGpsOn){
      print('Turn on location services before requesting permission');
      return;
    }

    final status = await Permission.locationWhenInUse.request();

    if(status == PermissionStatus.granted){
      print('Permission granted');
    } else if(status == PermissionStatus.denied){
      print('Permission denied. Show a dialog and ask for the permission again.');
    } else if(status == PermissionStatus.permanentlyDenied){
      print('To the user settings page');
      await openAppSettings();
    }
  }

  @override
  void initState(){
    _checkPermission();
  }

  double pinPillPosition = PIN_VISIBLE_POSITION;
  double pinPillPosition2 = PIN_VISIBLE_POSITION;
  double pinPillPosition3 = PIN_VISIBLE_POSITION;
  double pinPillPosition4 = PIN_VISIBLE_POSITION;
  double pinPillPosition5 = PIN_VISIBLE_POSITION;
  double pinPillPosition6 = PIN_VISIBLE_POSITION;
  double pinPillPosition7 = PIN_VISIBLE_POSITION;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mapa districte Sarria'),
          backgroundColor: Colors.purple,
          leading: IconButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AuthScreen()));
          }, icon: const Icon(Icons.arrow_back),),
        ),
        body: Stack(
          children: [
            GoogleMap(
              mapType: MapType.terrain,
              //onMapCreated: onMapCreated,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              zoomControlsEnabled: false,
              mapToolbarEnabled:
                  false, //Treu l'opcio de que si selecionem una marked ens dongui rutas
              initialCameraPosition: const CameraPosition(
                target: LatLng(41.39819948382333, 2.1218810377737123),
                zoom: 14,
              ),
              onTap: (LatLng loc) {
                setState(() {
                  pinPillPosition = PIN_INVISIBLE_POSITION;
                  pinPillPosition2 = PIN_INVISIBLE_POSITION;
                  pinPillPosition3 = PIN_INVISIBLE_POSITION;
                  pinPillPosition4 = PIN_INVISIBLE_POSITION;
                  pinPillPosition5 = PIN_INVISIBLE_POSITION;
                  pinPillPosition6 = PIN_INVISIBLE_POSITION;
                  pinPillPosition7 = PIN_INVISIBLE_POSITION;
                });
              },
              markers: _createMarkers(),
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            ),
            //Afegir lo de les markers?
            //BotoPosicioCasa(),
            BottonShowHouse(pinPillPosition: pinPillPosition),
            BottonShowTrain(pinPillPosition2: pinPillPosition2),
            BottonShowParque(pinPillPosition3: pinPillPosition3),
            BottonShowBosque(pinPillPosition4: pinPillPosition4),
            BottonShowCasas(pinPillPosition5: pinPillPosition5),
            BottonShowJardi(pinPillPosition6: pinPillPosition6),
            BottonShowMercat(pinPillPosition7: pinPillPosition7),
            const MainMenu()
          ],
        ));
  }

  Set<Marker> _createMarkers() {
    var tmp = <Marker>{};

    tmp.add(Marker(
        markerId: const MarkerId("Casa"),
        position: widget.Casa,
        onTap: () {
          setState(() {
            pinPillPosition = PIN_VISIBLE_POSITION;
          });
        },
        // icon: ,
        //infoWindow: const InfoWindow(title: "Colegio Hogwarts de Magia y Hechicería", snippet: ""),
        ));
    tmp.add(Marker(
        markerId: const MarkerId("estacio"),
        position: widget.Estacio,
        onTap: () {
          setState(() {
            pinPillPosition2 = PIN_VISIBLE_POSITION;
          });
        },
        //infoWindow: const InfoWindow(title: "Estació how")
        ));

    tmp.add(Marker(
        markerId: const MarkerId("Parque Quidditch"),
        position: widget.ParqueCole,
        onTap: () {
          setState(() {
            pinPillPosition3 = PIN_VISIBLE_POSITION;
          });
        },
        //infoWindow: const InfoWindow(title: "Campo Quidditch")
        ));
    tmp.add(Marker(
        markerId: const MarkerId("Bosque"),
        position: widget.BosqueSarria,
        onTap: () {
          setState(() {
            pinPillPosition4 = PIN_VISIBLE_POSITION;
          });
        },
        //infoWindow: const InfoWindow(title: "BosqueSarria")
        ));
    tmp.add(Marker(
        markerId: const MarkerId("CasesHarry"),
        position: widget.CasasSarria,
        onTap: () {
          setState(() {
            pinPillPosition5 = PIN_VISIBLE_POSITION;
          });
        },
        //infoWindow: const InfoWindow(title: "vive aqui")
        ));
    tmp.add(Marker(
        markerId: const MarkerId("jardins"),
        position: widget.JardinesSarria,
        onTap: () {
          setState(() {
            pinPillPosition6 = PIN_VISIBLE_POSITION;
          });
        },
        //infoWindow: const InfoWindow(title: "jardins de botanoca")
        ));
    tmp.add(Marker(
        markerId: const MarkerId("mercado"),
        position: widget.MercatSarria,
        onTap: () {
          setState(() {
            pinPillPosition7 = PIN_VISIBLE_POSITION;
          });
        },
        //infoWindow: const InfoWindow(title: "mercat on comprar coses")
        ));

    return tmp;
  }
}
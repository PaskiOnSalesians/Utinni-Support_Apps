// ignore_for_file: avoid_print, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:horrocrux_app/components/menu/circular_button.dart';
import 'package:horrocrux_app/screens/screens-main/mapgo.dart';
import 'package:horrocrux_app/screens/screens-main/settings.dart';
import 'package:horrocrux_app/screens/screens-main/user_profile.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MyMainMenuState();
}

class _MyMainMenuState extends State<MainMenu>
    with SingleTickerProviderStateMixin {
  // Variables of main menu
  late AnimationController animationController;
  late Animation degOneTranslationAnimation;

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250));
    degOneTranslationAnimation =
        Tween(begin: 0.0, end: 1.0).animate(animationController);
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget> [
        Positioned(
          right: 40,
          bottom: 80,
          child: Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
            IgnorePointer(
              child: Container(
                color: Colors.transparent,
                height: 150.0,
                width: 150.0,
              ),
            ),
              Transform.translate(
                offset: Offset.fromDirection(getRadiansFromDegree(270),
                    degOneTranslationAnimation.value * 125),
                child: CircularButton(
                  color: Colors.purple,
                  width: 75,
                  height: 75,
                  icon: const Icon(
                    Icons.home,
                    size: 35,
                    color: Colors.white,
                  ),
                  onClick: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Mapgo()));
                  },
                ),
              ),
              // Transform.translate(
              //   offset: Offset.fromDirection(getRadiansFromDegree(250),
              //       degOneTranslationAnimation.value * 125),
              //   child: CircularButton(
              //     color: Colors.purple,
              //     width: 75,
              //     height: 75,
              //     icon: const Icon(
              //       Icons.star,
              //       size: 35,
              //       color: Colors.white,
              //     ),
              //     onClick: () {},
              //   ),
              // ),
              Transform.translate(
                offset: Offset.fromDirection(getRadiansFromDegree(225),
                    degOneTranslationAnimation.value * 125),
                child: CircularButton(
                  color: Colors.purple,
                  width: 75,
                  height: 75,
                  icon: const Icon(
                    Icons.person,
                    size: 35,
                    color: Colors.white,
                  ),
                  onClick: () {
                     Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UserProfile()));
                  },
                ),
              ),
              Transform.translate(
                offset: Offset.fromDirection(getRadiansFromDegree(180),
                    degOneTranslationAnimation.value * 125),
                child: CircularButton(
                  color: Colors.purple,
                  width: 75,
                  height: 75,
                  icon:  const Icon(
                    Icons.settings,
                    size: 35,
                    color: Colors.white,
                  ),
                  onClick: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SettingsPage()));
                  },
                ),
              ),
              CircularButton(
                color: Colors.purple,
                width: 75,
                height: 75,
                icon: const Icon(
                  Icons.menu,
                  size: 35,
                  color: Colors.white,
                ),
                onClick: () {
                  if (animationController.isCompleted) {
                    animationController.reverse();
                  } else {
                    animationController.forward();
                  }
                },
              ),
            ]
          )
        )
      ],
    );
  }
}

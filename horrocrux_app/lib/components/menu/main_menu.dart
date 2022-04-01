import 'package:flutter/material.dart';
import 'package:horrocrux_app/components/menu/circular_button.dart';

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
    return Positioned(
        right: 50,
        bottom: 80,
        child: Stack(children: <Widget>[
          Transform.translate(
            offset: Offset.fromDirection(getRadiansFromDegree(290),
                degOneTranslationAnimation.value * 90),
            child: CircularButton(
              color: Colors.redAccent,
              width: 50,
              height: 50,
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              onClick: () {},
            ),
          ),
          Transform.translate(
            offset: Offset.fromDirection(getRadiansFromDegree(250),
                degOneTranslationAnimation.value * 90),
            child: CircularButton(
              color: Colors.redAccent,
              width: 50,
              height: 50,
              icon: const Icon(
                Icons.star,
                color: Colors.white,
              ),
              onClick: () {},
            ),
          ),
          Transform.translate(
            offset: Offset.fromDirection(getRadiansFromDegree(210),
                degOneTranslationAnimation.value * 90),
            child: CircularButton(
              color: Colors.redAccent,
              width: 50,
              height: 50,
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              onClick: () {},
            ),
          ),
          Transform.translate(
            offset: Offset.fromDirection(getRadiansFromDegree(170),
                degOneTranslationAnimation.value * 90),
            child: CircularButton(
              color: Colors.redAccent,
              width: 50,
              height: 50,
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onClick: () {},
            ),
          ),
          CircularButton(
            color: Colors.red,
            width: 50,
            height: 50,
            icon: const Icon(
              Icons.menu,
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
        ]));
  }
}

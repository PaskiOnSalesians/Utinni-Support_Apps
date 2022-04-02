import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horrocrux_app/screens/mapgo.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool valSounds = true;
  bool valVibrate = false;
  bool valNotifications = true;

  onChangeSound(bool newSound) {
    setState(() {
      valSounds = newSound;
    });
  }

  onChangeVibrate(bool newVibrate) {
    setState(() {
      valVibrate = newVibrate;
    });
  }

  onChangeNotifications(bool newNotifications) {
    setState(() {
      valNotifications = newNotifications;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Mapgo()));
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: ListView(
          children: [
            const SizedBox(height: 10.0),
            Row(
              children: const [
                Text(
                  'GENERAL',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(
              height: 2,
              thickness: 2,
              color: Colors.black,
            ),
            const SizedBox(height: 10),
            buildAccountOption(context, "Languages"),
            buildAccountOption(context, "Themes"),
            buildOnOffOption("Sounds in app", valSounds, onChangeSound),
            const SizedBox(height: 30.0),
            Row(
              children: const [
                Text(
                  'NOTIFICATIONS',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(
              height: 2,
              thickness: 2,
              color: Colors.black,
            ),
            const SizedBox(height: 10),
            buildOnOffOption(
                "Notifications", valNotifications, onChangeNotifications),
            const SizedBox(height: 30.0),
            Row(
              children: const [
                Text(
                  'HELP & SUPPORT',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(
              height: 2,
              thickness: 2,
              color: Colors.black,
            ),
            const SizedBox(height: 10),
            buildAccountOption(context, "Help"),
            buildAccountOption(context, "FAQ"),
            const SizedBox(height: 30),
            const ButtonBar()
          ],
        ),
      ),
    );
  }

  Padding buildOnOffOption(String title, bool value, Function onChangeMode) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          Transform.scale(
            scale: 0.8,
            child: CupertinoSwitch(
              activeColor: Colors.red[400],
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool newValue) {
                onChangeMode(newValue);
              },
            ),
          )
        ],
      ),
    );
  }

  GestureDetector buildAccountOption(BuildContext context, String title) {
    String line1 = "";
    String line2 = "";
    String line3 = "";
    String line4 = "";

    if (title == "Help") {
      line1 = "If you need help, contact horrocrux@gmail.com.";
      line2 = "";
      line3 = "";
      line4 = "";
    } else if (title == "FAQ") {
      line1 = "What is Horrocrux ?";
      line2 = "";
      line3 = "How to play the games ?";
      line4 = "";
    } else if (title == "Themes") {
      line1 = "Blue";
      line2 = "Dark";
      line3 = "Light";
      line4 = "Red";
    } else if (title == "Languages") {
      line1 = "English";
      line2 = "Spanish";
      line3 = "Catalan";
      line4 = "";
    }

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(line1),
                  const SizedBox(height: 8),
                  Text(line2),
                  const SizedBox(height: 8),
                  Text(line3),
                  const SizedBox(height: 8),
                  Text(line4),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Close"),
                ),
              ],
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[400],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  
  const UserProfile({ Key? key }) : super(key: key);

  @override
  
  State<UserProfile> createState() => _UserProfileState();
}


class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget> [
          const SizedBox(height: 30),
          Container(
            height: MediaQuery.of(context).size.height / 10,
            color: Colors.green,
            child: Row(
              children: const [],
            ),
          )
        ]
      ),
    );
  }
}
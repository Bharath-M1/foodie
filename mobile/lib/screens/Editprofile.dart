import 'package:flutter/material.dart';
import 'package:foodie/utils/const.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({ Key? key }) : super(key: key);

  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        toolbarHeight: 75,
        elevation: 0,
        title: Text(
          "Profile",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 30,
            color: solidWhite,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            color: backgroundColor,
          ),
        ),
    );
  }
}
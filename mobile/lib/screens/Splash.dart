import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodie/screens/BottomNavBar.dart';
import 'package:foodie/utils/const.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 1), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (builder) => BottomNavBar()),
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "Food!e",
        style: TextStyle(
            color: primaryColor, fontSize: 35, fontWeight: FontWeight.w700),
      )),
    );
  }
}

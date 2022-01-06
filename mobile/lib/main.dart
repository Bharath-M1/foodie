import 'package:flutter/material.dart';
import 'package:foodie/screens/Splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Foodie',
        theme: ThemeData(
          primarySwatch: Colors.brown,
          appBarTheme: AppBarTheme(
            brightness: Brightness.dark,
            backgroundColor:  Color(0xff800000)
          ),
        ),
        home: SplashScreen());
  }
}

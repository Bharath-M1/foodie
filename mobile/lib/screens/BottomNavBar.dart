import 'dart:io';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/screens/Cart.dart';
import 'package:foodie/screens/Home.dart';
import 'package:foodie/screens/Profile.dart';
import 'package:foodie/screens/Wallet.dart';
import 'package:foodie/utils/const.dart';

class BottomNavBar extends StatefulWidget {
  final index;
  const BottomNavBar({Key? key, this.index}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late DateTime backButtonPressTime;
  int _selectedIndex = 0;

  @override
  void initState() {
    if (widget.index != null) {
      setState(() {
        _selectedIndex = widget.index;
      });
    }
    super.initState();
  }

  Future<bool> onbackpressed() async {
    // exit(0);
    final now = DateTime.now();
    // ignore: unnecessary_null_comparison
    final backButtonHasNotBeenPressed = backButtonPressTime == null ||
        now.difference(backButtonPressTime).inMilliseconds > 2500;

    if (backButtonHasNotBeenPressed) {
      setState(() {
        backButtonPressTime = now;
      });
      Fluttertoast.showToast(msg: "Press again to close.");
      return false;
    }
    // print("back button");
    exit(0);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: onbackpressed,
      child: Scaffold(
        body: Stack(alignment: Alignment.bottomCenter, children: [
          IndexedStack(
            index: _selectedIndex,
            children: [
              HomePage(),
              CartScreen(),
              WalletScreen(),
              ProfileScreen(),
            ],
          ),
          Positioned(
            // bottom: 0,
            // left: 0,
            child: Card(
              elevation: 5,
              color: solidWhite,
              child: Container(
                height: 60,
                width: size.width,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _selectedIndex = 0;
                          });
                        },
                        icon: Icon(
                          FontAwesomeIcons.home,
                          size: 20,
                          color: _selectedIndex == 0 ? primaryColor : solidGrey,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              _selectedIndex = 1;
                            });
                          },
                          icon: Badge(
                            showBadge: _selectedIndex != 1,
                            badgeContent: Text(
                              "2",
                              style: TextStyle(color: solidWhite),
                            ),
                            badgeColor: primaryColor,
                            child: Icon(
                              FontAwesomeIcons.shoppingBag,
                              size: 20,
                              color: _selectedIndex == 1
                                  ? primaryColor
                                  : solidGrey,
                            ),
                          )),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _selectedIndex = 2;
                          });
                        },
                        icon: Icon(
                          FontAwesomeIcons.wallet,
                          size: 20,
                          color: _selectedIndex == 2 ? primaryColor : solidGrey,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _selectedIndex = 3;
                          });
                        },
                        icon: Icon(
                          FontAwesomeIcons.userAlt,
                          size: 20,
                          color: _selectedIndex == 3 ? primaryColor : solidGrey,
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

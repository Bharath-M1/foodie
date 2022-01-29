import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/screens/BottomNavBar.dart';
import 'package:foodie/utils/const.dart';
import 'package:foodie/utils/storage_manager.dart';

import 'Login.dart';
// import 'package:intl/intl.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<Map<String, dynamic>> userData;
  String? isLogin;
  @override
  void initState() {
    isLogedin();
    super.initState();
    userData = getUser();
  }

  isLogedin() async {
    isLogin = await StorageManager.readData('token');
  }

  Future<Map<String, dynamic>> getUser() async {
    return {
      "imageUrl": null,
      "firstName": "Sabareeswaran",
      "lastName": "B",
      "email": "sabarees@gmail.com"
    };
  }

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
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: backgroundColor,
        ),
        // child: ClipRRect(
        //   borderRadius: BorderRadius.only(
        //     topLeft: Radius.circular(40),
        //     topRight: Radius.circular(40),
        //   ),
        //   child: Container(
        //     // height: MediaQuery.of(context).size.height * 0.72,
        //     width: MediaQuery.of(context).size.width,
        //     margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        //     decoration: BoxDecoration(
        //         color: solidWhite,
        //         borderRadius: BorderRadius.circular(35),
        //         boxShadow: [
        //           BoxShadow(
        //             color: Colors.grey.shade300,
        //             spreadRadius: 5,
        //             blurRadius: 5,
        //           )
        //         ]),
        child: FutureBuilder<Map<String, dynamic>>(
          future: userData,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Icon(
                  FontAwesomeIcons.exclamationCircle,
                  color: primaryColor,
                  size: 60,
                ),
              );
            }
            if (snapshot.hasData) {
              var user = snapshot.data!;
              return ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                child: isLogin == null
                    ? Center(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => solidWhite),
                            elevation: MaterialStateProperty.resolveWith(
                                (states) => 5.0),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (builder) => LoginPage(),
                              ),
                              (route) => false,
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width * 0.6,
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Login to view profile",
                              style: TextStyle(
                                color: solidGrey,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: "proximanova",
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(
                        // height: MediaQuery.of(context).size.height * 0.72,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.fromLTRB(15, 20, 15, 80),
                        decoration: BoxDecoration(
                            color: solidWhite,
                            borderRadius: BorderRadius.circular(35),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                spreadRadius: 5,
                                blurRadius: 5,
                              )
                            ]),
                        child: SingleChildScrollView(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 25),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: primaryColor.withOpacity(0.1),
                                      ),
                                      child: user['imageUrl'] == null
                                          ? Icon(
                                              FontAwesomeIcons.userAlt,
                                              size: 55,
                                              color: primaryColor,
                                            )
                                          : ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child: CachedNetworkImage(
                                                imageUrl: user['imageUrl'],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                    ),
                                    Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: primaryColor,
                                      ),
                                      child: IconButton(
                                        onPressed: () async {
                                          // var result = await Navigator.of(context).push(
                                          //     MaterialPageRoute(
                                          //         builder: (builder) => ProfileEdit()));
                                          // if (result != null) {
                                          //   userData = getUser();
                                          // }
                                        },
                                        icon: Icon(
                                          FontAwesomeIcons.pen,
                                          size: 18,
                                          color: solidWhite,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              Divider(
                                  height: 15,
                                  thickness: 0.7,
                                  color: Colors.grey.shade400),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                horizontalTitleGap: 50,
                                title: Text(
                                  "Name",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                                subtitle: Text(
                                  "${user['firstName']} ${user['lastName']}",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                                trailing: Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: primaryColor,
                                  ),
                                  child: Icon(
                                    FontAwesomeIcons.user,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ),
                              Divider(
                                  height: 15,
                                  thickness: 0.7,
                                  color: Colors.grey.shade400),
                              // ListTile(
                              //   contentPadding: EdgeInsets.zero,
                              //   horizontalTitleGap: 50,
                              //   title: Text(
                              //     "Username",
                              //     style: TextStyle(
                              //       color: Colors.grey,
                              //       fontSize: 16,
                              //     ),
                              //   ),
                              //   subtitle: Text(
                              //     "@${user['userName']}",
                              //     overflow: TextOverflow.ellipsis,
                              //     textAlign: TextAlign.left,
                              //     style: TextStyle(
                              //       color: Colors.black,
                              //       fontSize: 18,
                              //     ),
                              //   ),
                              //   trailing: Container(
                              //     height: 45,
                              //     width: 45,
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(30),
                              //       color: primaryColor,
                              //     ),
                              //     child: Icon(
                              //       FontAwesomeIcons.user,
                              //       color: Colors.white,
                              //       size: 25,
                              //     ),
                              //   ),
                              // ),
                              // Divider(
                              //     height: 15,
                              //     thickness: 0.7,
                              //     color: Colors.grey.shade400),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                horizontalTitleGap: 50,
                                title: Text(
                                  "Email",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                                subtitle: Text(
                                  user['email'],
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                                trailing: Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: primaryColor,
                                  ),
                                  child: Icon(
                                    FontAwesomeIcons.envelope,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ),
                              Divider(
                                  height: 15,
                                  thickness: 0.7,
                                  color: Colors.grey.shade400),
                              // ListTile(
                              //   contentPadding: EdgeInsets.zero,
                              //   horizontalTitleGap: 50,
                              //   title: Text(
                              //     "DOB",
                              //     style: TextStyle(
                              //       color: Colors.grey,
                              //       fontSize: 16,
                              //     ),
                              //   ),
                              //   subtitle: Text(
                              //     DateFormat("MMM dd, yyyy")
                              //         .format(DateTime.parse(user['dob']))
                              //         .toString(),
                              //     overflow: TextOverflow.ellipsis,
                              //     textAlign: TextAlign.left,
                              //     style: TextStyle(
                              //       color: Colors.black,
                              //       fontSize: 18,
                              //     ),
                              //   ),
                              //   trailing: Container(
                              //     height: 45,
                              //     width: 45,
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.circular(30),
                              //       color: primaryColor,
                              //     ),
                              //     child: Icon(
                              //       FontAwesomeIcons.calendarDay,
                              //       color: Colors.white,
                              //       size: 25,
                              //     ),
                              //   ),
                              // ),
                              // Divider(
                              //     height: 15,
                              //     thickness: 0.7,
                              //     color: Colors.grey.shade400),
                              SizedBox(height: 10),
                              Center(
                                child: Container(
                                  width:
                                      (MediaQuery.of(context).size.width / 2) -
                                          25,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade300,
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                        offset: Offset(3, 3),
                                      ),
                                    ],
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      StorageManager.clear().then((value) =>
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                      builder: (builder) =>
                                                          BottomNavBar()),
                                                  (route) => false));
                                    },
                                    child: Text(
                                      'Sign out',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              // Center(
                              //   child: Container(
                              //     child: Text(
                              //       "Sabareeswaran B",
                              //       textAlign: TextAlign.center,
                              //       overflow: TextOverflow.ellipsis,
                              //       style: TextStyle(
                              //           color: solidBlack,
                              //           fontWeight: FontWeight.bold,
                              //           fontSize: 18),
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(height: 5),
                              // Center(
                              //   child: Container(
                              //     child: Text(
                              //       "@sabarees",
                              //       textAlign: TextAlign.center,
                              //       overflow: TextOverflow.ellipsis,
                              //       style: TextStyle(
                              //           color: solidGrey,
                              //           fontWeight: FontWeight.normal,
                              //           fontSize: 14),
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(height: 10),
                              // Center(
                              //   child: Container(
                              //     child: Text(
                              //       "sabareeswaran2510@gmail.com",
                              //       textAlign: TextAlign.center,
                              //       overflow: TextOverflow.ellipsis,
                              //       style: TextStyle(
                              //           color: solidBlack,
                              //           fontWeight: FontWeight.bold,
                              //           fontSize: 14),
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(height: 10),
                              // Center(
                              //   child: Container(
                              //     child: Text(
                              //       "October 25, 1999",
                              //       textAlign: TextAlign.center,
                              //       overflow: TextOverflow.ellipsis,
                              //       style: TextStyle(
                              //           color: solidBlack,
                              //           fontWeight: FontWeight.bold,
                              //           fontSize: 14),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
              );
            }

            return Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          },
        ),
        //   ),
        // ),
      ),
    );
  }
}

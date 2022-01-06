import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/utils/const.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  ScrollController _scrollController = ScrollController();
  bool showbacktotop = false;
  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.offset > 250) {
        setState(() {
          showbacktotop = true;
        });
      } else {
        setState(() {
          showbacktotop = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        toolbarHeight: 75,
        elevation: 0,
        title: Text(
          "Wallet",
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
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          child: Stack(
            children: [
              ListView(
                controller: _scrollController,
                padding: EdgeInsets.only(bottom: 70, left: 15, right: 15),
                children: [
                  SizedBox(height: 40),
                  Container(
                    height: 200,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: solidWhite,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(1.5, 1.5),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundColor: halfGrey,
                          ),
                          title: Text("Sabareeswaran B"),
                          // subtitle: Text(""),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.infoCircle,
                              color: primaryColor,
                              size: 25,
                            ),
                          ),
                        ),
                        // Align(
                        //   alignment: Alignment.topRight,
                        //   child: IconButton(
                        //     onPressed: () {},
                        //     icon: Icon(
                        //       FontAwesomeIcons.infoCircle,
                        //       color: primaryColor,
                        //       size: 25,
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Total account balance:",
                            style: TextStyle(
                              color: solidGrey,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(
                              text: "\u{20B9}\t",
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                              children: [
                                TextSpan(
                                  text: "700",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600),
                                ),
                                TextSpan(
                                  text: ".00",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: solidWhite,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(50),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(1.5, 1.5),
                            ),
                          ],
                        ),
                        width: 175,
                        height: 50,
                        child: Text(
                          "Transactions",
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: solidWhite,
                      // border: Border.all(color: primaryColor, width: 5),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(1.5, 1.5),
                        ),
                      ],
                    ),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.all(10),
                      itemCount: 56,
                      itemBuilder: (context, index) {
                        return Container(
                          child: ListTile(
                            title: Text(
                                "\u{20B9}\t${collatzConjecture(index + 23)}"),
                            subtitle: Text("Nov 11, 2021"),
                            leading: CircleAvatar(
                              radius: 20,
                              child: Icon(
                                collatzConjecture(index + 23).toInt().isEven
                                    ? FontAwesomeIcons.arrowAltCircleLeft
                                    : FontAwesomeIcons.arrowAltCircleRight,
                                color: solidWhite,
                              ),
                            ),
                            trailing: Text(
                                collatzConjecture(index + 23).toInt().isEven
                                    ? "Recieved"
                                    : "Send"),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
              showbacktotop
                  ? Positioned(
                      bottom: 90,
                      right: 20,
                      child: FloatingActionButton(
                        onPressed: () {
                          _scrollController.jumpTo(0);
                        },
                        tooltip: "Back to top",
                        child: Icon(
                          FontAwesomeIcons.chevronUp,
                        ),
                      ),
                    )
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }

  collatzConjecture(int value) {
    if (value.isEven) {
      return value / 2;
    } else {
      return (value * 3) + 1;
    }
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/screens/Login.dart';
import 'package:foodie/utils/const.dart';
import 'package:foodie/utils/storage_manager.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int count = 1;

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
        leading: null,
        title: Text(
          "Cart",
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
            alignment: Alignment.center,
            children: [
              ListView(
                padding: EdgeInsets.only(bottom: 70, left: 15, right: 15),
                children: [
                  SizedBox(height: 40),
                  Container(
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
                      children: [
                        Container(
                          child: ListTile(
                            leading: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "https://res.cloudinary.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_508,h_320,c_fill/uuqtjieoqe2n2tpzwdec",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            title: Text(
                              "Blue Line Restaurant",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: secondaryColor,
                                fontFamily: "proximanova",
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Divider(
                            height: 15,
                            thickness: 0.7,
                            color: Colors.grey.shade400,
                          ),
                        ),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return productList();
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  billDeatils(),
                  SizedBox(
                    height: 75,
                  ),
                ],
              ),
              Positioned(
                bottom: 70,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => primaryColor),
                    elevation:
                        MaterialStateProperty.resolveWith((states) => 5.0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    var isLogin = await StorageManager.readData('token');
                    if (isLogin == null) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (builder) => LoginPage(),
                        ),
                      );
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: size.width * 0.6,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "ORDER",
                      style: TextStyle(
                        color: solidWhite,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "proximanova",
                      ),
                    ),
                  ),
                ),
                // GestureDetector(
                //   onTap: () {
                //     showLoginBottomBar();
                //   },
                //   child: Container(
                //     alignment: Alignment.center,
                //     decoration: BoxDecoration(
                //       color: primaryColor,
                //       borderRadius: BorderRadius.circular(15),
                //       boxShadow: [
                //         BoxShadow(
                //           color: Colors.black38,
                //           spreadRadius: 2,
                //           blurRadius: 2,
                //           offset: Offset(1.5, 1.5),
                //         ),
                //       ],
                //     ),
                //     width: size.width * 0.8,
                //     // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                //     child: TextButton(
                //       onPressed: () {
                //         showLoginBottomBar();
                //       },
                //       child: Text(
                //         "ORDER",
                //         style: TextStyle(
                //           color: solidWhite,
                //           fontSize: 18,
                //           fontWeight: FontWeight.bold,
                //           fontFamily: "proximanova",
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget productList() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text("Chicken Clear Soup"),
        subtitle: Text("\u{20B9} 72"),
        trailing: Container(
          height: 40,
          width: 115,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                iconSize: 12,
                onPressed: () {
                  setState(() {
                    count -= 1;
                  });
                },
                icon: Icon(
                  FontAwesomeIcons.minus,
                  color: solidWhite,
                  size: 12,
                ),
              ),
              Text(
                count.toString(),
                style: TextStyle(
                  color: solidWhite,
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                iconSize: 12,
                onPressed: () {
                  setState(() {
                    count += 1;
                  });
                },
                icon: Icon(
                  FontAwesomeIcons.plus,
                  color: solidWhite,
                  size: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget billDeatils() {
    Size size = MediaQuery.of(context).size;
    return Container(
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
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Bill Details",
              style: TextStyle(
                color: secondaryColor,
                fontFamily: "proximanova",
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Divider(
            height: 15,
            thickness: 0.7,
            color: Colors.grey.shade400,
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: List.generate(
              2,
              (index) => Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Chicken Clear Soup",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: solidGrey,
                          fontFamily: "proximanova",
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "\u{20B9} ${72 * count}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: secondaryColor,
                          fontFamily: "proximanova",
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 15,
            thickness: 0.7,
            color: Colors.grey.shade400,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Total amount to be paid:",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: solidGrey,
                      fontFamily: "proximanova",
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "\u{20B9} ${144 * count}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: secondaryColor,
                      fontFamily: "proximanova",
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 15,
            thickness: 0.7,
            color: Colors.grey.shade400,
          ),
        ],
      ),
    );
  }

  Widget emptyCart() {
    return Container(
      decoration: BoxDecoration(
        color: solidWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          "The cart is hungry!",
          style: TextStyle(
            color: secondaryColor,
            fontFamily: "proximanova",
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

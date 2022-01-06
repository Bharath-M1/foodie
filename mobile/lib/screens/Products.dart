import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/screens/BottomNavBar.dart';
import 'package:foodie/utils/const.dart';

class ProductScreeen extends StatefulWidget {
  final store;
  const ProductScreeen({Key? key, this.store}) : super(key: key);

  @override
  _ProductScreeenState createState() => _ProductScreeenState();
}

class _ProductScreeenState extends State<ProductScreeen> {
  @override
  void initState() {
    productTypes = products.map((e) => e['type']).toList();
    productTypes = productTypes.toSet().toList();
    super.initState();
  }

  bool collapse1 = false;
  bool collapse2 = false;
  bool collapse3 = false;

  List productTypes = [];

  List products = [
    {
      "type": "Bakery items",
      "name": "Methu vadai",
      "rate": "5",
      "varient": "Hot"
    },
    {
      "type": "Bakery items",
      "name": "Parappu vadai",
      "rate": "5",
      "varient": "Hot"
    },
    {"type": "Bakery items", "name": "Bonda", "rate": "5", "varient": "Hot"},
    {"type": "Breakfast", "name": "Idli set", "rate": "15", "varient": "Hot"},
    {"type": "Breakfast", "name": "Dosa", "rate": "10", "varient": "Hot"},
    {"type": "Beverages", "name": "Pepsi", "rate": "12", "varient": "Cold"},
    {"type": "Beverages", "name": "Cocacola", "rate": "12", "varient": "Cold"},
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        toolbarHeight: 75,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            FontAwesomeIcons.chevronLeft,
            color: solidWhite,
            size: 25,
          ),
        ),
      ),
      body: Container(
          height: size.height,
          width: size.width,
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
                  padding: EdgeInsets.only(bottom: 15, left: 15, right: 15),
                  children: [
                    SizedBox(height: 30),
                    Container(
                      height: 100,
                      padding: EdgeInsets.all(20),
                      width: size.width,
                      decoration: BoxDecoration(
                        color: solidWhite,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(1.5, 1.5),
                          ),
                        ],
                        image: DecorationImage(
                          image: NetworkImage(
                            widget.store['imageUrl'],
                          ),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black54, BlendMode.darken),
                        ),
                      ),
                      child: Text(
                        widget.store['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: solidWhite,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: productTypes.length,
                        itemBuilder: (context, index) {
                          var product = [...products];
                          product.retainWhere((element) =>
                              element['type'] == productTypes[index]);
                          return Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: ExpansionTile(
                                initiallyExpanded: true,
                                backgroundColor: solidWhite,
                                collapsedBackgroundColor: solidWhite,
                                collapsedIconColor: secondaryColor,
                                collapsedTextColor: secondaryColor,
                                textColor: secondaryColor,
                                iconColor: secondaryColor,
                                childrenPadding:
                                    EdgeInsets.symmetric(horizontal: 15),
                                title: Text(
                                  productTypes[index],
                                  style: TextStyle(
                                    color: secondaryColor,
                                    fontFamily: "proximanova",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                children: List.generate(
                                  product.length,
                                  (index2) => productList(product, index2),
                                ),
                              ),
                            ),
                          );
                        })
                  ],
                ),
                Positioned(
                  bottom: 15,
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
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (builder) => BottomNavBar(
                            index: 1,
                          ),
                        ),
                        (route) => false,
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: size.width * 0.3,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Go to cart",
                        style: TextStyle(
                          color: solidWhite,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: "proximanova",
                        ),
                      ),
                    ),
                  ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: primaryColor,
                  //     borderRadius: BorderRadius.circular(15),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Colors.black38,
                  //         spreadRadius: 2,
                  //         blurRadius: 2,
                  //         offset: Offset(1.5, 1.5),
                  //       ),
                  //     ],
                  //   ),
                  //   padding: EdgeInsets.symmetric(horizontal: 25),
                  //   child: TextButton(
                  //     onPressed: () {
                  //       Navigator.of(context).pushAndRemoveUntil(
                  //         MaterialPageRoute(
                  //           builder: (builder) => BottomNavBar(
                  //             index: 1,
                  //           ),
                  //         ),
                  //         (route) => false,
                  //       );
                  //     },
                  //     child: Text(
                  //       "Go to Cart",
                  //       style: TextStyle(
                  //         color: solidWhite,
                  //         fontWeight: FontWeight.bold,
                  //         fontFamily: "proximanova",
                  //         fontSize: 18,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ),
              ],
            ),
          )),
    );
  }

  Widget productList(List product, int index) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      // height: 75,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
            height: 120,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(
                  widget.store['imageUrl'],
                ),
                fit: BoxFit.cover,
                // colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
              ),
            ),
          ),
          // Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product[index]['name'],
                style: TextStyle(
                  color: secondaryColor,
                  fontFamily: "proximanova",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "\u{20B9} ${product[index]['rate']}",
                style: TextStyle(
                  color: halfGrey,
                  fontFamily: "proximanova",
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.minus,
                        color: solidWhite,
                        size: 16,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.plus,
                        color: solidWhite,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Divider(height: 15, thickness: 0.7, color: Colors.grey.shade400),
        ],
      ),
    );
  }
}

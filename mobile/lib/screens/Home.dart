import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodie/screens/Products.dart';
import 'package:foodie/utils/const.dart';
import 'package:foodie/utils/custompainter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late Future stores;

  @override
  void initState() {
    // stores = getStores();
    super.initState();
  }

  // Future getStores() {
  // }

  List stores = [
    {
      "imageUrl":
          "https://res.cloudinary.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_508,h_320,c_fill/uuqtjieoqe2n2tpzwdec",
      "name": "Blue Line Restaurant",
    },
    {
      "imageUrl":
          "https://res.cloudinary.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_508,h_320,c_fill/nn6j25gik17vhe0j14b8",
      "name": "SS Hyderabad Briyani",
    },
    {
      "imageUrl":
          "https://res.cloudinary.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_508,h_320,c_fill/fba8d1ivvwasnfrxgl4o",
      "name": "KCM",
    },
    {
      "imageUrl":
          "https://res.cloudinary.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_508,h_320,c_fill/bkhjsivteg9eqkqjpopf",
      "name": "Ocean Drive in Q",
    }
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.deepOrange.shade300,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: backgroundColor,
          body: Container(
            color: Colors.transparent,
            child: Stack(
              fit: StackFit.loose,
              children: <Widget>[
                ListView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.fromLTRB(15, size.height * 0.2, 15, 60),
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          child: Icon(
                            FontAwesomeIcons.store,
                            color: secondaryColor,
                            size: 20,
                          ),
                        ),
                        Text(
                          "Stores",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontFamily: "proximanova",
                            fontSize: 25,
                            color: secondaryColor,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      // height: size.height - 300,
                      width: size.width,
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (builder) =>
                                        ProductScreeen(store: stores[index]),
                                  ),
                                );
                              },
                              child: storesWidget(index));
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  width: size.width,
                  height: size.height * 0.16,
                  color: Colors.transparent,
                  child: CustomPaint(
                      painter: CustomToolbarShape(lineColor: primaryColor),
                      child: Container(
                        margin: EdgeInsets.only(
                          top: size.height * 0.03,
                          left: size.width * 0.05,
                        ),
                        child: Text(
                          "Food!e",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.5,
                            fontSize: 30,
                            color: solidWhite,
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget storesWidget(int index) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // height: 150,
      width: size.width,
      margin: EdgeInsets.symmetric(vertical: 5),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 115,
            width: 100,
            margin: EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: stores[index]['imageUrl'],
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Container(
                width: size.width - 175,
                child: Text(
                  stores[index]['name'],
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: secondaryColor,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "4.1 * 33 mins * rs.250 for two",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: halfGrey,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "South Indian, Chainese, Grill",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: halfGrey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

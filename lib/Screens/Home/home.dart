import 'package:flavourz/controllers/api_manager.dart';
import 'package:flavourz/controllers/globalState.dart';
import 'package:flavourz/models/menu_model.dart';
import 'package:flutter/material.dart';

import '../../Utils/constant.dart';
import '../../widgets.dart';
import '/Screens/details_item.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'Drawer.dart';

class Home1 extends StatefulWidget {
  @override
  State<Home1> createState() => _Home1State();
}

final _scaffoldKey = GlobalKey<ScaffoldState>();

class _Home1State extends State<Home1> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Menu(),
      key: _scaffoldKey,
      body: Container(
        height: size.height,
        color: appBgColor,
        child: Padding(
          padding: EdgeInsets.only(top: 12, left: 12, right: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      _scaffoldKey.currentState!.openDrawer();
                    },
                    child: Container(
                      height: 17,
                      width: 17,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/menu.png"))),
                    ),
                  ),
                  Text(
                    "Welcome",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: size.height * 0.024,
                        fontWeight: FontWeight.w700),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "Get Your Meals to",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: size.height * 0.022,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.013),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "Beat Your Hunger",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: secondary,
                    fontSize: size.height * 0.02,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              //  Slider horizontal move

              CarouselSlider(
                  items: [
                    slider(context, "assets/images/banner1.jpg"),
                    slider(context, "assets/images/banner2.jpg"),
                  ],
                  options: CarouselOptions(
                      height: size.height * 0.27,
                      autoPlay: true,
                      autoPlayAnimationDuration: Duration(seconds: 2),
                      autoPlayCurve: Curves.easeInOutBack,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      // initialPage: 2,
                      pageSnapping: false,
                      viewportFraction: 1,
                      autoPlayInterval: Duration(seconds: 5))),
              SizedBox(
                height: size.height * 0.04,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: size.height * 0.022,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "see all",
                    style: TextStyle(
                        color: secondary,
                        fontSize: size.height * 0.021,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),

              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 0.0, right: 0, top: 4),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DetailsItem()));
                          },
                          child: Card(
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Container(
                              height: 116,
                              width: size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        height: 110,
                                        width: size.width * 0.20,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              "assets/images/logo.png",
                                            ),
                                            fit: BoxFit.contain,
                                          ),
                                        )),
                                    Container(
                                      width: size.width * 0.40,
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            FittedBox(
                                              child: Text(
                                                "Double Chicken Burger",
                                                textAlign: TextAlign.start,
                                                maxLines: 2,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: size.height * 0.018,
                                                ),
                                              ),
                                            ),
                                            FittedBox(
                                              child: Text(
                                                "Vegan-Healthy",
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.black45),
                                              ),
                                            ),
                                            Text(
                                              "Dinner and Brunch-Pakistan-Chicken Burger",
                                              textAlign: TextAlign.start,
                                              maxLines: 2,
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.blueGrey),
                                            ),
                                            FittedBox(
                                              child: Text(
                                                "Free Delivery",
                                                style: TextStyle(
                                                    color: secondary,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize:
                                                        size.height * 0.016),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0, vertical: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          FittedBox(
                                            child: Text(" PKR 300",
                                                style: TextStyle(
                                                    color: secondary,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize:
                                                        size.height * 0.019)),
                                          ),
                                          FittedBox(
                                            child: InkWell(
                                              onTap: () {},
                                              child: Text(
                                                "Order Now",
                                                style: TextStyle(
                                                    color: primary,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize:
                                                        size.height * 0.017),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

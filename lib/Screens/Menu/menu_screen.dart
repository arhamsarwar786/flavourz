// import 'dart:ffi';

import 'package:flavourz/Screens/Menu/list_categoris.dart';
import 'package:flutter/material.dart';
import '../Home/BottomNavigationBar.dart';

import '/Utils/constant.dart';
import '/widgets.dart';

import '../details_item.dart';

List categories = [
  {
    "name": "Frozen",
    // "icon" :
  },
  {
    "name": "Desi Food Deal",
    // "icon" :
  },
  {
    "name": "Fast Foods",
    // "icon" :
  },
];

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          bottomNavigationBar: BottomBar(context),
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            title: Text(
              "Menu",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: size.height * 0.024,
                  fontWeight: FontWeight.w600),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                  )),
            ],
            backgroundColor: Colors.white,
            bottom: TabBar(
              indicatorColor: primary,
              labelColor: primary,
              unselectedLabelColor: Colors.black54,
              unselectedLabelStyle:
                  TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              indicatorSize: TabBarIndicatorSize.label,
              labelStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              tabs: [
                Tab(
                  text: "Resturent",
                ),
                Tab(
                  text: "Cafe",
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            resturent(context),
            resturent(context),
          ]),
        ),
      ),
    );
  }
}

Widget resturent(context) {
  final size = MediaQuery.of(context).size;

  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
      children: [
        SizedBox(
          height: 19,
        ),
        Container(
          child: listCategories(),
        ),
        Divider(
          color: primary,
        ),
        Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 0.0, right: 0, top: 8),
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
                          height: 115,
                          width: size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: 110,
                                    width: size.width * 0.20,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          "assets/images/shami.png",
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
                                            "SHAMI KABAB ",
                                            style: TextStyle(
                                              color: Colors.black,
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
                                          "Dinner and Brunch-Pakistan-Shami Kabab",
                                          textAlign: TextAlign.start,
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontSize: 10,
                                              overflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black54),
                                        ),
                                        Text(
                                          "read more",
                                          style: TextStyle(
                                              color: secondary,
                                              fontWeight: FontWeight.w700,
                                              fontSize: size.height * 0.017),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6.0, vertical: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("PKR 300",
                                          style: TextStyle(
                                              color: secondary,
                                              fontWeight: FontWeight.w700,
                                              fontSize: size.height * 0.019)),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.shopping_cart,
                                            color: Colors.black,
                                          )),
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
                }))
      ],
    ),
  );
}

listCategories() {
  List<Widget> lists = List.generate(
      categories.length,
      (index) => CategoryItem(
            data: categories[index],
          ));
  lists.insert(
      0,
      CategoryItem(
        data: {
          "name": "All",
        },
        seleted: true,
      ));
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    padding: EdgeInsets.only(bottom: 5, left: 15),
    child:
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: lists),
  );
}

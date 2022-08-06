// import 'dart:ffi';

import 'package:flavourz/Screens/Menu/list_categoris.dart';
import 'package:flavourz/Screens/Menu/restaurant_menu_list.dart';
import 'package:flavourz/controllers/globalState.dart';
import 'package:flavourz/controllers/providers/menu_provider.dart';
import 'package:flavourz/models/menu_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Home/BottomNavigationBar.dart';

import '/Utils/constant.dart';
import '/widgets.dart';

import '../details_item.dart';
import 'cafe_menu_list.dart';

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
  void initState() {
    super.initState();
   var provider =  Provider.of<MenuProvider>(context,listen: false);
    if (provider.menuProviderList == null) {
      provider.fetchMenu();
    }
  }

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
          body: RefreshIndicator(
            onRefresh: () async {
              Provider.of<MenuProvider>(context,listen: false).fetchMenu();
            },
            child:
                Consumer<MenuProvider>(builder: (context, menuProvider, child) {
              return menuProvider.menuProviderList == null
                  ? Center(
                    child: ElevatedButton.icon(
                        onPressed: () {
                          Provider.of<MenuProvider>(context,listen: false).fetchMenu();
                        },
                        icon: Icon(Icons.replay_outlined),
                        label: Text("Retry")),
                  )
                  : TabBarView(children: [
                      RestaurantMenuList(
                        restaurantList:
                            menuProvider.menuProviderList!.restaurant,
                      ),
                      CafeMenuList(
                        cafeList: menuProvider.menuProviderList!.cafe,
                      )
                    ]);
            }),
          ),
        ),
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../Utils/constant.dart';
import '../Root.dart';
import '../add_to_cart.dart';
import '../Menu/menu_screen.dart';
import '../profile_screen.dart';

void _onItemTapped(context) {
  if (screenIndex == 0) {
    Navigator.pushAndRemoveUntil(
      context,
      PageTransition(
        type: PageTransitionType.leftToRight,
        child: Home(),
      ),
      (Route<dynamic> route) => false,
    );
  } else if (screenIndex == 1) {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.leftToRight,
        child: Menu(),
      ),
    );
  } else if (screenIndex == 2) {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.leftToRight,
        child: AddToCart(),
      ),
      // (Route<dynamic> route) => false,
    );
  } else if (screenIndex == 3) {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.leftToRight,
        child: MyAccount(),
      ),
    );
    // } else {

    //   return Home();
  }
}

Widget BottomBar(context) {
  // var _onItemTapped;
  return BottomNavigationBar(
    currentIndex: screenIndex,
    onTap: (index) {
      screenIndex = index;
      _onItemTapped(context);
    },
    iconSize: 30,
    selectedLabelStyle: TextStyle(
      color: secondary,
    ),
    unselectedLabelStyle: TextStyle(
      color: Colors.black12,
    ),
    selectedItemColor: secondary,
    unselectedFontSize: 15.0,
    selectedIconTheme: IconThemeData(color: secondary),
    unselectedIconTheme: IconThemeData(color: Colors.black12),
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        // ignore: deprecated_member_use
        label: "home",
      ),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.menu,
          ),
          label: "Menu"),
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart),
        // ignore: deprecated_member_use
        label: "Cart",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        // ignore: deprecated_member_use
        label: "Account",
      ),
    ],
  );
}

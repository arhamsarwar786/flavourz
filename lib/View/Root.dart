import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../Utils/constant.dart';
import 'Home/BottomNavigationBar.dart';
import 'Home/deal_screen.dart';
import 'Home/home.dart';
import 'Menu/menu_screen.dart';
import '/View/profile_screen.dart';

import 'add_to_cart.dart';

List screens = [
  Home1(),
  Menu(),
  AddToCart(),
  DealScreen(),
  MyAccount(),
];
int screenIndex = 0;


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        
        resizeToAvoidBottomInset: false,
// Bottom Navigation Bar
        bottomNavigationBar: BottomBar(context),
        // Rooted Screens...
        body: screens[screenIndex],
      ),
    );
  }
  
Widget BottomBar(context) {
  // var _onItemTapped;
  return BottomNavigationBar(
    showUnselectedLabels: true,
    showSelectedLabels: true,
    currentIndex: screenIndex,
    onTap: (index) {
      screenIndex = index;
      print(index);
      Navigator.pushAndRemoveUntil(
      context,
      PageTransition(
        type: PageTransitionType.leftToRight,
        child: Home(),
      ),
      (Route<dynamic> route) => false,
    );
    },
    iconSize: 30,
    selectedLabelStyle: TextStyle(
      color: secondary,
    ),
    unselectedLabelStyle: TextStyle(
      color: Colors.black12,
    ),
    unselectedItemColor: Colors.grey,
    selectedItemColor: secondary,
    // unselectedFontSize: 15.0,
    selectedIconTheme: IconThemeData(color: secondary),
    unselectedIconTheme: IconThemeData(color: Colors.black12),
    items:  [

      BottomNavigationBarItem(
     
        icon: Icon(Icons.home),
        // icon: Column(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     Icon(Icons.home),
        //     Text("Home")
        //   ],
        // ),
        // ignore: deprecated_member_use
        label: "Home"
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
        icon: Icon(Icons.offline_bolt),
        // ignore: deprecated_member_use
        label: "Deals",
      ),

       BottomNavigationBarItem(
        icon: Icon(Icons.person),
        // ignore: deprecated_member_use
        label: "Account",
      ),
    ],
  );
}

}

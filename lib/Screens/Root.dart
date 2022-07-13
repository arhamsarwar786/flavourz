import 'package:flutter/material.dart';
import 'Home/BottomNavigationBar.dart';
import 'Home/home.dart';
import 'Menu/menu_screen.dart';
import '/Screens/profile_screen.dart';

import 'add_to_cart.dart';

List screens = [
  Home1(),
  Menu(),
  AddToCart(),
  MyAccount(),
];
int screenIndex = 0;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var selected = 0;
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
}

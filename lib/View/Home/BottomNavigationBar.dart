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

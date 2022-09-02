import 'dart:convert';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'preferences.dart';
import '../models/cart_model.dart';
import '../widgets.dart';

// var values=0;
class Cart {
  static insertToCart(context, cart) async {
    var modelCart = CartModel.fromJson(cart);
    var cartt = await SavedPreferences.getCart();
    if (cartt != null) {
      List<CartModel> cartList = cartModelFromJson(jsonEncode(cartt));
      var isFound = 0;
      for (var item in cartList) {
        print("card type ${cartList.runtimeType}");
        if (item.name == modelCart.name) {
          print(item.name == modelCart.name);
          isFound = 1;
        }
      }
      if (isFound == 0) {
        cartList.add(modelCart);
        SavedPreferences.setCart(cartList);
        snackBar(context, "Item Added Sucessfully!");
      } else {
        snackBar(context, "Already Added into Cart");
      }
    } else {
      print("else addes");
      List<CartModel> newCart = [];
      newCart.add(modelCart);
      SavedPreferences.setCart(newCart);
      return snackBar(context, "Item Added Sucessfully!");
    }
  }
}

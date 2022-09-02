import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';


class SavedPreferences {
  static setCart(items)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("deviceCart", jsonEncode(items));
  }

  static getCart()async{
    var data;
    SharedPreferences pref = await SharedPreferences.getInstance();
    var res = pref.getString("deviceCart");
    if(res != null){
      data = jsonDecode(res);
    }
    return data;
  }


  static clearPreference()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
    print("ALL CLEARED");
  }

}
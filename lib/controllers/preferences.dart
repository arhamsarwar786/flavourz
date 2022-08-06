import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';


class SavedPreferences {
  deviceCart(items)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("deviceCart", jsonEncode(items));
  }

  getDeviceCart()async{
    var data;
    SharedPreferences pref = await SharedPreferences.getInstance();
    var res = pref.getString("deviceCart");
    if(res != null){
      data = res;
    }
    return data;
  }

}
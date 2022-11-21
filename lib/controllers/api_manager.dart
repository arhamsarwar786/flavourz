import 'package:flavourz/models/menu_model.dart';
import 'package:flavourz/models/order_model.dart';
import 'package:flavourz/models/track_order_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class APIManager {
  static fetchMenu() async {
    try {
      var data = await http
          .get(Uri.parse("https://www.geoinvest.pk/food/api/products_api.php"));
      print(data);
      var res = menuModelFromJson(data.body);
      return res;
    } catch (e) {
      print(e);
    }
  }

  static trackOrder({@required number}) async {
    print(number);
    try {
      var data = await http.post(
          Uri.parse("https://www.geoinvest.pk/food/api/order_tacking.php"),
          body: {'phone_number': "$number"});
      print(data.body);
      if (data.body != '0') {
        var res = trackOrderModelFromJson(data.body);
        return res;
      }else{
        return data.body;
      }
    } catch (e) {
      print(e);
    }
  }
   static delete_order({@required number}) async {
    print(number);
    try {
      var data = await http.post(
          Uri.parse("https://www.geoinvest.pk/food/api/delete_order_api.php"),
          body: {'phone_number': "$number"});
      print(data.body);
      if (data.body != '0') {
        // var res = trackOrderModelFromJson(data.body);
        return data.body;
      }else{
        return data.body;
      }
    } catch (e) {
      print(e);
    }
  }

  static placeOrder(OrderModel order) async {
    try {
      var data = await http.post(
          Uri.parse("https://www.geoinvest.pk/food/api/order_api.php"),
          body: order.toJson());

      return data.body;
    } catch (e) {
      print(e);
    }
  }
}



import 'package:flavourz/models/menu_model.dart';

import '../models/cart_model.dart';
import '../models/order_model.dart';

class GlobalState{
  static MenuModel? menuList;
  static String? location;

  static OrderModel? orderModel;
  static List<CartModel>? cartModel = [];
  
}
import 'package:flavourz/controllers/cart.dart';

class ControllerCart{
  static addCart(context,cart){

    return Cart.insertToCart(context, cart);
      // value;
  }
}
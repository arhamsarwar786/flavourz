import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavourz/View/authentication/register_screen.dart';
import 'package:flavourz/View/set_prefrences.dart';
import 'package:flavourz/controllers/preferences.dart';
import 'package:flavourz/widgets.dart';
import 'package:flutter/material.dart';
import '../Utils/constant.dart';
import '../controllers/controller_cart.dart';
import '../controllers/globalState.dart';
import '../models/cart_model.dart';
import '../models/order_model.dart';
import 'Root.dart';
import 'add_to_cart.dart';

class DetailsItem extends StatefulWidget {
  var item;
  DetailsItem({@required this.item});

  @override
  State<DetailsItem> createState() => _DetailsItemState();
}

class _DetailsItemState extends State<DetailsItem> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: size.height * 0.35,
                width: size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "${widget.item['product_image_base64'] ?? widget.item['image']}"))),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: size.height * 0.35,
                width: size.width,
                color: Colors.black12,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      color: Colors.white,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              size: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      color: Colors.white,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                               screenIndex = 2;
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> Home() ));
                        setState(() {
                          
                        });
                            },
                            icon: Icon(
                              Icons.shopping_cart,
                              size: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: size.height * 0.65,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${widget.item['product_name'] ?? widget.item['name']}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: size.height * 0.019),
                              ),
                              Text(
                                "Rs. ${widget.item['product_price'] ?? widget.item['price']}",
                                style: TextStyle(
                                    color: primary,
                                    fontWeight: FontWeight.w600,
                                    fontSize: size.height * 0.021),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Vegan-Healthy",
                            style: TextStyle(
                                fontSize: size.height * 0.022,
                                color: Colors.black54),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Text(
                            "Category ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: size.height * 0.019),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "${widget.item['product_category'] ?? widget.item['product_category']}",
                              style: TextStyle(
                                  fontSize: size.height * 0.018,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Description ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: size.height * 0.019),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              "${widget.item['product_description'] ?? widget.item['productDescription']}",
                              style: TextStyle(
                                  fontSize: size.height * 0.018,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Number Of Items",
                                style: TextStyle(
                                    color: primary,
                                    fontSize: size.height * 0.021,
                                    fontWeight: FontWeight.w600),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                        color: primary,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Center(
                                      child: IconButton(
                                        onPressed: () {
                                          if ((widget.item['quantity'] ?? quantity) > 1) {
                                            setState(() {
                                              if(widget.item['quantity'] != null){
                                                widget.item['quantity'] = widget.item['quantity'] - 1;
                                              }else{
                                                quantity = quantity - 1;
                                              }
                                              
                                            });
                                          } else {
                                            snackBar(context,
                                                "At Least 1 Item Must");
                                          }
                                        },
                                        icon: Icon(
                                          Icons.remove,
                                          size: 10,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    "${widget.item['quantity'] ?? quantity}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                        color: primary,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                            if(widget.item['quantity'] != null){
                                                widget.item['quantity'] = widget.item['quantity'] + 1;
                                              }else{
                                                quantity = quantity + 1;
                                              }
                                        });
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        size: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  var placeOrder = {
                                    "product_id": widget.item['id'],
                                    "product_qty":
                                        "${widget.item['quantity'] ?? quantity}",
                                    "total_amount":
                                        "${(widget.item['quantity'] ?? quantity) * (num.parse(widget.item['product_price'] ?? widget.item['price']))}"
                                  };
                                  GlobalState.orderModel =
                                      OrderModel.fromJson(placeOrder);
                                  GlobalState.cartModel!.add(CartModel(
                                      id: widget.item['id'],
                                      productType:
                                          widget.item['product_type'] ?? widget.item['productType'],
                                          product_category:
                                          widget.item['product_category'] ?? widget.item['product_category'],
                                      name: widget.item['product_name'] ?? widget.item['name'],
                                      productDescription: widget.item['product_description'] ?? widget.item['productDescription'],
                                      image:
                                          widget.item['product_image_base64'] ?? widget.item['image'],
                                      price: widget.item['product_price'] ?? widget.item['price'],
                                      quantity: widget.item['quantity'] ?? quantity,
                                    
                                  ));
                                  snackBar(context, "Item Added");
                                  
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => FirebaseAuth.instance.currentUser == null ? RegisterScreen() : SetPreference()));
                                },
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width *
                                          0.50,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        gradient: LinearGradient(colors: [
                                          primary,
                                          primary,
                                        ]),
                                      ),
                                      child: Text("Order Now",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18.0))),
                                ),
                              ),
                              Tooltip(
                                message: "Add to Cart",
                                child: InkWell(
                                  onTap: () {
                                    var cart = {
                                      "id": widget.item['id'],
                                      "productType":
                                          widget.item['product_type'] ??
                                              widget.item['productType'],
                                      "name": widget.item['product_name'] ??
                                          widget.item['name'],
                                               "product_category":
                                          widget.item['product_category'] ?? widget.item['product_category'],
                                      "productDescription":
                                          widget.item['product_description'] ??
                                              widget.item['productDescription'],
                                      "image":
                                          widget.item['product_image_base64'] ??
                                              widget.item['image'],
                                      "price": widget.item['product_price'] ??
                                          widget.item['price'],
                                      "quantity":
                                          widget.item['quantity'] ?? quantity,
                                    };
                                    print(widget.item);
                                    ControllerCart.addCart(context, cart);
                                    screenIndex = 2;
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => Home()));
                                  },
                                  child: Card(
                                      elevation: 5,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Container(
                                          alignment: Alignment.center,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.30,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            gradient: LinearGradient(colors: [
                                              primary,
                                              primary,
                                            ]),
                                          ),
                                          child: Icon(
                                            Icons.shopping_cart,
                                            color: Colors.white,
                                          ))),
                                ),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

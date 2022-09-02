import 'dart:convert';

import 'package:flavourz/View/details_item.dart';
import 'package:flavourz/View/set_prefrences.dart';
import 'package:flavourz/controllers/globalState.dart';
import 'package:flavourz/models/order_model.dart';
import 'package:flutter/material.dart';
import '../controllers/preferences.dart';
import '../models/cart_model.dart';
import '/Utils/constant.dart';

import 'Home/BottomNavigationBar.dart';
import 'Menu/widgets.dart';
import 'user_details.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({Key? key}) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  void _incrementCounter(quantity) {
    setState(() {
      quantity++;
    });
  }

  void _decrementCounter(quantity) {
    setState(() {
      quantity--;
    });
  }

  List<CartModel>? cart;
  checkCart() async {
   var data =  await SavedPreferences.getCart();
   if(data != null){
    cart = cartModelFromJson(jsonEncode(data));
    setState(() {});
   }

  }

  @override
  void initState() {
    super.initState();
    checkCart();
  }

  removeItem({cart, index}) {
    cart!.removeAt(index);
    SavedPreferences.setCart(cart);
    setState(() {});
  }


  num totalAmount = 0;

  totalCalculator(List<CartModel> currentCart) {
    num total = 0;
    currentCart.forEach((cartt) {
      total += (num.parse(cartt.price!) * cartt.quantity!);
      print(cart);
    });
totalAmount = total;
    return total;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(               
        appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
          elevation: 1,
          backgroundColor: appBgColor,
          title: const Text(
            "Add to Cart",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        // bottomNavigationBar: BottomBar(context),
        body: cart == null
            ? Center(
                child: Text("No Cart Added"),
              )
            : cart!.isEmpty ?
            Center(child: Text("No Cart Added"),)
             : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: cart!.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8, top: 8),
                            child: InkWell(
                              onTap: (){
                                print(cart![index].toJson());
                                Navigator.push(context, MaterialPageRoute(builder: (_)=> DetailsItem(item: cart![index].toJson()) ));
                              },
                              child: Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Container(
                                  height: 120,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, top: 2, bottom: 0),
                                        child: Container(
                                            height: 110,
                                            width: size.width * 0.20,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  cart![index].image!,
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            )),
                                      ),
                                      Container(
                                        height: 120,
                                        width: size.width * 0.7,
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  FittedBox(
                                                    child: Text(
                                                      cart![index].name!,
                                                      maxLines: 2,
                                                      textDirection:
                                                          TextDirection.ltr,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: size.height *
                                                              0.018),
                                                    ),
                                                  ),
                                                  Text(cart![index].price!,
                                                      style: TextStyle(
                                                          color: secondary,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          fontSize: size.height *
                                                              0.018)),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 3,
                                              ),
                                              // Text(("12 PCS"),
                                              //     style: TextStyle(
                                              //         color: primary,
                                              //         fontWeight: FontWeight.w700,
                                              //         fontSize:
                                              //             size.height * 0.017)),
                                              const SizedBox(
                                                height: 3,
                                              ),
                                              Text(
                                                "${cart![index].quantity} X ${cart![index].price} = ${(num.parse(cart![index].price!) * cart![index].quantity!)}",
                                                style: TextStyle(
                                                    fontSize: size.height * 0.018,
                                                    color: Colors.black54),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        height: 25,
                                                        width: 25,
                                                        decoration: BoxDecoration(
                                                            color: secondary,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100)),
                                                        child: Center(
                                                          child: IconButton(
                                                            onPressed: () {
                                                              if (cart![index]
                                                                      .quantity! >
                                                                  1) {
                                                                setState(() {
                                                                  cart![index]
                                                                          .quantity =
                                                                      (cart![index]
                                                                              .quantity)! -
                                                                          1;
                                                                });

                                                              } else {
                                                                removeItem(cart: cart!,index: index);
                                                              }

                                                              SavedPreferences.setCart(cart);
                                                            },
                                                            icon: const Icon(
                                                              Icons.remove,
                                                              size: 10,
                                                              color: Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 7,
                                                      ),
                                                      Text(
                                                        "${cart![index].quantity}",
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w600),
                                                      ),
                                                      const SizedBox(
                                                        width: 7,
                                                      ),
                                                      Container(
                                                        height: 25,
                                                        width: 25,
                                                        decoration: BoxDecoration(
                                                            color: secondary,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        100)),
                                                        child: IconButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              cart![index]
                                                                  .quantity = (cart![
                                                                          index]
                                                                      .quantity)! +
                                                                  1;
                                                            });
                                                            SavedPreferences.setCart(cart);
                                                          },
                                                          icon: const Icon(
                                                            Icons.add,
                                                            size: 10,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Tooltip(
                                                    message: "Delete Item",
                                                    child: IconButton(
                                                      onPressed: () {
                                                        removeItem(cart: cart!,index: index);
                                                      },
                                                      icon: const Icon(
                                                        Icons.delete,
                                                        color: primary,
                                                        size: 25,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.black38,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bill Details",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Item Sub Total",
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "PKR ${totalCalculator(cart!)}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "PST",
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "PKR O",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Delivery Charge",
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "PKR O",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // ORDER 
                  Center(
                    child: InkWell(
                      onTap: () {
                        List productIdList = [];
                        List productQuantity = [];

                        cart!.forEach((item) {
                          productIdList.add(item.id);
                          productQuantity.add(item.quantity);
                        });
                        var placeOrder = {
                          "phone_number": "",
                          "product_id": productIdList.join(','),
                          "product_qty": productQuantity.join(','),
                          "total_amount":"$totalAmount"                      
                        };
                        GlobalState.orderModel = OrderModel.fromJson(placeOrder);
                        GlobalState.cartModel = cart;
                        SavedPreferences.setCart(cart);

                        
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SetPreference()));
                      },
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.60,
                            height: 40.0,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              gradient: LinearGradient(colors: [
                                primary,
                                primary,
                              ]),
                            ),
                            child: const Text("Continue",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18.0))),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}





// https://www.geoinvest.pk/loan_dashboad/api/user_repayments.php



// {
//                           "phone_number": "",
//                           "product_id": "",
//                           "product_qty": "",
//                           "total_amount":"",
//                           "set_preference":"",
//                           "email":"",
//                           "name":"",
//                           "address":"",
//                           "comment":"",
//                           "payment_type":"",

//                         }
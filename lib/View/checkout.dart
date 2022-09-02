import 'package:flavourz/Utils/constant.dart';
import 'package:flavourz/View/Root.dart';
import 'package:flavourz/View/track_your_order.dart';
import 'package:flavourz/controllers/api_manager.dart';
import 'package:flavourz/controllers/globalState.dart';
import 'package:flavourz/controllers/preferences.dart';
import 'package:flavourz/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'bottom_sheet.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  var _groupValue;

  bool isOrdering = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: primary),
        backgroundColor: primary,
        title: const Text(
          "Checkout",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              // crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.delivery_dining_outlined,
                    color: Colors.green,
                    size: 40,
                  ),
                  title: Text(
                    "${GlobalState.orderModel!.address}",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                  // subtitle: const Text(
                  //   "jalio parkBlock NBlock NLahore Cannt 2 near jalio park, Block N Gulberg |||, Lahore,Punjab,Pakistan",
                  //   style: TextStyle(
                  //       color: Colors.grey,
                  //       fontWeight: FontWeight.normal,
                  //       fontSize: 12),
                  // ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total Amount to pay",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              // fontSize: 16
                            ),
                          ),
                          SizedBox(
                            width: 120,
                            height: 26,
                            child: CupertinoButton(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              color: primary,
                              onPressed: () {
                                sheet(context);
                              },
                              borderRadius: BorderRadius.circular(4),
                              child: const Text(
                                "Bill Summary",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "PKR ${GlobalState.orderModel!.totalAmount}",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          // fontSize: 16
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Choose Payment Method",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          // fontSize: 16
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Please note: Contactless delivery won't be supported for cash paid orders.",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w400,
                          // fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Colors.grey.shade400,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Divider(
                        color: Colors.grey.shade400,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Pay on Delivery",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          // fontSize: 16,
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        contentPadding:
                            const EdgeInsets.only(left: 0.0, right: 0.0),
                        visualDensity: const VisualDensity(
                            horizontal: VisualDensity.minimumDensity,
                            vertical: VisualDensity.minimumDensity),
                        dense: true,
                        title: const Text(
                          "CASH",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            // fontSize: 16,
                          ),
                        ),
                        trailing: Radio(
                            activeColor: Colors.green,
                            toggleable: true,
                            visualDensity: const VisualDensity(
                                horizontal: VisualDensity.minimumDensity,
                                vertical: VisualDensity.minimumDensity),
                            value: 1,
                            groupValue: _groupValue,
                            onChanged: (newValue) {
                              setState(() {
                                _groupValue = newValue;

                                print(_groupValue);
                              });
                            }),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: InkWell(
                    onTap: () async {
                      if (_groupValue == 1) {
                        GlobalState.orderModel!.paymentType = "cash";
                        print(GlobalState.orderModel!.toJson());
                        setState(() {
                          isOrdering = true;
                        });
                        var res = await APIManager.placeOrder(
                            GlobalState.orderModel!);
                        if (res == "1") {
                          print("Congratulations");

                          setState(() {
                            isOrdering = false;
                          });
                          GlobalState.cartModel!.clear();
                          GlobalState.orderModel = null;
                          SavedPreferences.setCart([]);
                          Navigator.push(context, MaterialPageRoute(builder: (_) => Home() ));
                          screenIndex = 0;
                          setState(() {
                            
                          });

                          showAlert(context,
                              title: "Congratulations!",
                              content:
                                  "Your Order is Successfully Placed!",
                              type: "success");

                          snackBar(context, "Order is placed");
                        }
                      } else {
                        snackBar(context, "Please! Select Payment Method");
                      }
                      // Navigator.of(context).push(
                      //     MaterialPageRoute(builder: (context) => TrackOrder()));
                    },
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.60,
                          height: 40.0,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            gradient: LinearGradient(colors: [
                              primary,
                              primary,
                            ]),
                          ),
                          child: Text("Trace Order",
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
          if (isOrdering)
            Container(
              color: Colors.black54,
              child: Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
        ],
      ),
    );
  }
}

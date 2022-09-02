import 'package:flavourz/Utils/constant.dart';
import 'package:flavourz/View/contact_us.dart';
import 'package:flavourz/models/track_order_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Root.dart';

class TrackOrder extends StatelessWidget {
  TrackOrderModel? order;

  TrackOrder(this.order);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: primary,
        ),
        backgroundColor: primary,
        title: const Text(
          "Track Your Order",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10, bottom: 10, top: 10),
            child: MaterialButton(
              color: Colors.white.withOpacity(0.8),
              textColor: primary,
              colorBrightness: Brightness.light,
              // height: 30,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_)=> ContactUs() ));
              },
              child: Text("Contact"),
            ),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Status",style:TextStyle(fontWeight: FontWeight.bold)),
                    Text(order!.orderStatus!,style:TextStyle(fontSize: 30))
                    // const ListTile(
                    //   leading: CircleAvatar(
                    //       radius: 14,
                    //       backgroundColor: Colors.green,
                    //       child: Icon(
                    //         Icons.done,
                    //         color: Colors.white,
                    //         size: 24,
                    //       )),
                    //   title: Text(
                    //     "Placed",
                    //     style: TextStyle(
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.w400,
                    //       // fontSize: 16,
                    //     ),
                    //   ),
                    // ),
                    // Container(
                    //   margin: EdgeInsets.only(left: 30),
                    //   height: 30,
                    //   width: 2,
                    //   color: Colors.black,
                    // ),
                    // const ListTile(
                    //   leading: CircleAvatar(
                    //       radius: 14,
                    //       backgroundColor: Colors.green,
                    //       child: Icon(
                    //         Icons.done,
                    //         color: Colors.white,
                    //         size: 24,
                    //       )),
                    //   title: Text(
                    //     "Your order has been accepted",
                    //     style: TextStyle(
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.w400,
                    //       // fontSize: 16,
                    //     ),
                    //   ),
                    //   subtitle: Text(
                    //     "Your order is being prepare",
                    //     style: TextStyle(
                    //       color: Colors.grey,
                    //     ),
                    //   ),
                    // ),
                    // Container(
                    //   margin: const EdgeInsets.only(left: 30),
                    //   height: 30,
                    //   width: 2,
                    //   color: Colors.black,
                    // ),
                    // const ListTile(
                    //   leading: CircleAvatar(
                    //       radius: 14,
                    //       backgroundColor: Colors.grey,
                    //       child: Text(
                    //         "3",
                    //         style: TextStyle(
                    //             color: Colors.white, fontWeight: FontWeight.bold),
                    //       )),
                    //   title: Text(
                    //     "Dispatched",
                    //     style: TextStyle(
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.w400,
                    //       // fontSize: 16,
                    //     ),
                    //   ),
                    // ),
                    // Container(
                    //   margin: const EdgeInsets.only(left: 30),
                    //   height: 30,
                    //   width: 2,
                    //   color: Colors.black,
                    // ),
                    // const ListTile(
                    //   leading: CircleAvatar(
                    //       radius: 14,
                    //       backgroundColor: Colors.grey,
                    //       child: Text(
                    //         "4",
                    //         style: TextStyle(
                    //             color: Colors.white, fontWeight: FontWeight.bold),
                    //       )),
                    //   title: Text(
                    //     "Delivered",
                    //     style: TextStyle(
                    //       color: Colors.black,
                    //       fontWeight: FontWeight.w400,
                    //       // fontSize: 16,
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                   
                    ,Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          const Divider(
                            color: Colors.black,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 0.8.toInt(),
                                      child: const Icon(
                                        Icons.plagiarism,
                                        color: Colors.green,
                                        // size: 30,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    const Expanded(
                                      flex: 2,
                                      child: Text(
                                        "Order Detail",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          // fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    // Expanded(
                                    //   flex: 2.toInt(),
                                    //   child: SizedBox(
                                    //     // width: 120,
                                    //     height: 26,
                                    //     child: CupertinoButton(
                                    //       padding: const EdgeInsets.symmetric(
                                    //           horizontal: 0),
                                    //       color: primary,
                                    //       onPressed: () {
                                    //         // sheet(context);
                                    //       },
                                    //       borderRadius: BorderRadius.circular(4),
                                    //       child: const Text(
                                    //         "Bill Summary",
                                    //         style: TextStyle(
                                    //           color: Colors.white,
                                    //           fontSize: 14,
                                    //           fontWeight: FontWeight.w600,
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                  
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Your Order Id",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      "${order!.orderNumber}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        // fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total Amount",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      "PKR ${order!.productPrice}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        // fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Divider(
                                  color: Colors.grey,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      "Payment method",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      "Cash",
                                      style: TextStyle(
                                        color: Colors.black,
                                        // fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // ListTile(
                          //   onTap: () {},
                          //   contentPadding: EdgeInsets.only(left: 0.0),
                          //   leading: const Icon(
                          //     Icons.delivery_dining_outlined,
                          //     color: Colors.green,
                          //     size: 40,
                          //   ),
                          //   title: const Padding(
                          //     padding: EdgeInsets.only(bottom: 6),
                          //     child: Text(
                          //       "Deliever Address",
                          //       style: TextStyle(
                          //         color: Colors.black,
                          //         fontWeight: FontWeight.w600,
                          //         // fontSize: 14
                          //       ),
                          //     ),
                          //   ),
                          //   subtitle: const Text(
                          //     "jalio parkBlock NBlock NLahore Cannt 2 near jalio park, Block N Gulberg |||, Lahore,Punjab,Pakistan",
                          //     style: TextStyle(
                          //       color: Colors.black,
                          //       fontWeight: FontWeight.normal,
                          //       // fontSize: 14
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          // ListTile(
                          //   onTap: () {},
                          //   contentPadding: const EdgeInsets.only(left: 0.0),
                          //   leading: const Icon(
                          //     Icons.location_on_outlined,
                          //     color: Colors.green,
                          //     size: 30,
                          //   ),
                          //   title: const Padding(
                          //     padding: EdgeInsets.only(bottom: 6),
                          //     child: Text(
                          //       "Oulet Adress",
                          //       style: TextStyle(
                          //         color: Colors.black,
                          //         fontWeight: FontWeight.w600,
                          //         // fontSize: 14
                          //       ),
                          //     ),
                          //   ),
                          //   subtitle: const Text(
                          //     "Jail Rd, G-O-R,-1",
                          //     style: TextStyle(
                          //       color: Colors.black,
                          //       fontWeight: FontWeight.normal,
                          //       // fontSize: 14
                          //     ),
                          //   ),
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //   children: [
                          //     Container(
                          //       padding:
                          //           const EdgeInsets.symmetric(horizontal: 20),
                          //       alignment: Alignment.center,
                          //       height: 40,
                          //       // width: 140,
                          //       decoration: BoxDecoration(
                          //           border: Border.all(color: primary),
                          //           borderRadius: BorderRadius.circular(10)),
                          //       child: const Text(
                          //         "GET DIRECTION",
                          //         style: TextStyle(
                          //           color: primary,
                          //           fontWeight: FontWeight.w600,
                          //           // fontSize: 14
                          //         ),
                          //       ),
                          //     ),
                          //     SizedBox(
                          //       //  flex: 1,
                          //       width: 120,
                          //       child: CupertinoButton(
                          //         padding:
                          //             const EdgeInsets.symmetric(horizontal: 4),
                          //         color: primary,
                          //         onPressed: () {},
                          //         child: const Text(
                          //           "Outlet call",
                          //           style: TextStyle(
                          //             color: Colors.white,
                          //             fontSize: 14,
                          //             fontWeight: FontWeight.w600,
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // const SizedBox(
                          //   height: 100,
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  // height: 80,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      border: Border.all(color: Colors.grey)),
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: CupertinoButton(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        color: primary,
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Home()));

                              screenIndex = 0;
                              
                        },
                        child: const Text(
                          "Go to Home",
                          style: TextStyle(
                            color: Colors.white,
                            // fontSize: 14,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavourz/View/Root.dart';
import 'package:flavourz/View/authentication/opt_screen.dart';
import 'package:flavourz/controllers/api_manager.dart';
import 'package:flavourz/controllers/globalState.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Utils/constant.dart';
import '../models/track_order_model.dart';
import '../widgets.dart';
import 'authentication/register_screen.dart';
import 'track_your_order.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  dynamic data;
  orderTracking() async {
    if (FirebaseAuth.instance.currentUser != null) {
      var res = await APIManager.trackOrder(
          number: FirebaseAuth.instance.currentUser!.phoneNumber);

          if(res == '0'){
            data = "No History Found";
          }else{
            data = res;
          }
      setState(() {});
    } 
    else {
      Navigator.push(context, MaterialPageRoute(builder: (_)=> RegisterScreen()) );
      // var number = addNumberDialog(context);

      // data = await APIManager.trackOrder(number: number);
      // setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    orderTracking();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(       
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Navigator.push(context, MaterialPageRoute(builder: (_)=> Home()));
                  // screenIndex = 0 ;
                  // setState(() {

                  // });
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            title: Text(
              "Order History",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: size.height * 0.022,
                  fontWeight: FontWeight.w500),
            ),
            backgroundColor: Colors.white,
            // bottom: const TabBar(
            //   indicatorColor: primary,
            //   labelColor: primary,
            //   unselectedLabelColor: Colors.black54,
            //   unselectedLabelStyle:
            //       TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            //   indicatorSize: TabBarIndicatorSize.label,
            //   labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            //   tabs: [
            //     Tab(
            //       text: "Current",
            //     ),
            //     Tab(
            //       text: "Previous",
            //     ),
            //   ],
            // ),
          ),
          body: _current(context)),
    );
  }

  Widget _current(
    context,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: data == null
            ? Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : data.runtimeType == String ? Center(child: Text(data)) : ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  TrackOrderModel order = data![index];
                  return InkWell(
                    onTap: () {
                      // print(order.toJson());
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TrackOrder(order)));
                    },
                    child: Card(
                      child: ListTile(
                        title: const Text(
                          "Trace Your Order",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(dater(order.orderDate)),
                            Icon(
                              Icons.circle,
                              color: order.orderStatus == "Delivered"
                                  ? Colors.green
                                  : Colors.amber,
                            )
                          ],
                        ),
                        leading: Container(
                          height: 40,
                          width: 40,
                          decoration: order.productImage != null
                              ? BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(order.productImage!),
                                      fit: BoxFit.contain))
                              : BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage("assets/images/logo.png"),
                                      fit: BoxFit.contain)),
                        ),
                        subtitle: Text(
                          "check your order status!",
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
      ),
    );
  }

  dater(date) {
    return DateFormat('dd-MMM kk:mm:a').format(date);
  }
}


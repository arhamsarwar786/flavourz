import 'package:flutter/material.dart';

import '../Utils/constant.dart';
import '../widgets.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        centerTitle: true,
        title: Text(
          "Order Now",
          style: TextStyle(
              color: Colors.black,
              fontSize: size.height * 0.022,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Full Name",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: size.height * 0.021,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            TextField1(context, "Enter Name"),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              "Phone Number ",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: size.height * 0.021,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            TextField1(context, "Enter Phone Number"),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              "Address",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: size.height * 0.021,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            TextField1(context, "Enter Address"),
            SizedBox(
              height: size.height * 0.03,
            ),
            Text(
              "Comment",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: size.height * 0.021,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            TextField2(context, "Enter Comment"),
            SizedBox(
              height: size.height * 0.02,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) =>()));
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
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        gradient: LinearGradient(colors: [
                          primary,
                          primary,
                        ]),
                      ),
                      child: Text("Confirm Order",
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

import 'package:flutter/material.dart';

import '../Utils/constant.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 1,
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            title: Text(
              "Contact Us",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: size.height * 0.022,
                  fontWeight: FontWeight.w700),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Text(
                    'Opening Hours',
                    style: TextStyle(
                      color: secondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const FittedBox(
                  child: Text(
                    "Monday – Sun – 11am to 12am",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const FittedBox(
                  child: Text(
                    "Open all Public Holidays Except 10th of Ashura. ",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Card(
                  elevation: 2,
                  child: Container(
                      height: 120,
                      width: size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.call,
                              size: 30,
                            ),
                            Text(
                              "Cafe: +92 315 6422715",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 14.0,
                              ),
                            ),
                            Text(
                              "Restaurant: +92 340 6422715",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 14.0,
                              ),
                            ),
                            Text(
                              "+92 323 6422715",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 14.0,
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                const SizedBox(
                  height: 40,
                ),
                Card(
                  elevation: 2,
                  child: Container(
                      height: 100,
                      width: size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.email,
                            size: 30,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "info@flavourz.pk",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      )),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Center(
                  child: Text(
                    "Find us here",
                    style: TextStyle(
                      color: secondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                ),
                const FittedBox(
                  child: Text(
                    "Flavourz Restaurant, Chichawatni, Road Kamalia.",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

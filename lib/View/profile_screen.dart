import 'package:flavourz/View/about_us.dart';
import 'package:flavourz/View/contact_us.dart';
import 'package:flavourz/View/order_history.dart';
import 'package:flavourz/View/share_us.dart';
import 'package:flutter/material.dart';
import '../widgets.dart';
import '/Utils/constant.dart';

import 'Home/BottomNavigationBar.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  static const _title = [
    'About us',
    'Contact Us',
    'Order History',
    'Share',
    // 'Log Out',
  ];
  static const _icon = [
    Icons.info_outline,
    Icons.contacts,
    Icons.shopping_cart,
    Icons.share,
    // Icons.logout,
  ];
  final _navigationSc = [
    const AboutUs(),
    const ContactUs(),
    const OrderHistory(),
    const Share()
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: appBgColor,
            elevation: 1,
            centerTitle: true,
         
            title: Text(
              "Profile",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: size.height * 0.027,
                  fontWeight: FontWeight.w400),
            ),
          ),
          // bottomNavigationBar: BottomBar(context),
          body: Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/images/profile.jpg"),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Flavourz Resturent",
                  style: TextStyle(
                      color: secondary,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: _title.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 2, vertical: 3),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => _navigationSc[index]));
                            },
                            child: Card(
                              elevation: 1,
                              child: Container(
                                height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                          radius: 20,
                                          backgroundColor: cardColor,
                                          child: Icon(
                                            _icon[index],
                                            color: primary,
                                            size: 20,
                                          )),
                                      SizedBox(
                                        width: size.width * 0.1,
                                      ),
                                      Text(
                                        _title[index],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: size.height * 0.021,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),

                Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 2, vertical: 3),
                          child: InkWell(
                            onTap: () {
                              showAlertDialog(context);
                            },
                            child: Card(
                              elevation: 1,
                              child: Container(
                                height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                          radius: 20,
                                          backgroundColor: cardColor,
                                          child: Icon(
                                            Icons.logout,
                                            color: primary,
                                            size: 20,
                                          )),
                                      SizedBox(
                                        width: size.width * 0.1,
                                      ),
                                      Text(
                                        "Logout",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: size.height * 0.021,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),


                        SizedBox(height: 50,),
                   
              ],
            ),
          )),
    );
  }
}

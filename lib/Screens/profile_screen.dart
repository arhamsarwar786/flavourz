import 'package:flavourz/Screens/about_us.dart';
import 'package:flavourz/Screens/add_to_cart.dart';
import 'package:flavourz/Screens/contact_us.dart';
import 'package:flavourz/Screens/share_us.dart';
import 'package:flutter/material.dart';
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
    'My Order',
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
  var _navigationSc = [AboutUs(), ContactUs(), AddToCart(), Share()];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: appBgColor,
            elevation: 1,
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            title: Text(
              "Profile",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: size.height * 0.027,
                  fontWeight: FontWeight.w400),
            ),
          ),
          bottomNavigationBar: BottomBar(context),
          body: Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/images/profile.jpg"),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Flavourz Resturent",
                  style: TextStyle(
                      color: secondary,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
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
                )
              ],
            ),
          )),
    );
  }
}

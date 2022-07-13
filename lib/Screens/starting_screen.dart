import 'dart:async';

import 'package:flutter/material.dart';

import '/Utils/constant.dart';

import 'Root.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  late Animation colorAnimation;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 8), () {});
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 150, end: 230).animate(controller);
    colorAnimation =
        ColorTween(begin: Colors.red, end: Colors.green).animate(controller);
    animation.addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // backgroundColor: primary,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: size.height * 0.2,
              width: size.width * 0.4,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/logo.png',
                      ),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Receive High Quality Food Close To You!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: size.height * 0.035,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => Home()));
                },
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.70,
                      height: 40.0,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          gradient:
                              LinearGradient(colors: [appBgColor, appBgColor]),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 0),
                              color: appBgColor,
                            ),
                            BoxShadow(
                              offset: Offset(0, 0),
                              color: appBgColor,
                            ),
                            BoxShadow(
                              offset: Offset(0, 0),
                              color: appBgColor,
                            ),
                          ]),
                      child: const Text("Get Started",
                          style: TextStyle(
                              color: secondary,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.0))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

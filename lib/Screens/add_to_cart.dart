import 'package:flutter/material.dart';

import '/Utils/constant.dart';

import 'Home/BottomNavigationBar.dart';
import 'order.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({Key? key}) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  int _counter = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 20,
            ),
          ),
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
        bottomNavigationBar: BottomBar(context),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, right: 8, top: 8),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, top: 2, bottom: 2),
                                child: Container(
                                    height: 110,
                                    width: size.width * 0.20,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          "assets/images/shami.png",
                                        ),
                                        fit: BoxFit.contain,
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
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          FittedBox(
                                            child: Text(
                                              "SHAMI KABAB ",
                                              maxLines: 2,
                                              textDirection: TextDirection.ltr,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize:
                                                      size.height * 0.018),
                                            ),
                                          ),
                                          Text("PKR 300",
                                              style: TextStyle(
                                                  color: secondary,
                                                  fontWeight: FontWeight.w800,
                                                  fontSize:
                                                      size.height * 0.018)),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(("12 PCS"),
                                          style: TextStyle(
                                              color: primary,
                                              fontWeight: FontWeight.w700,
                                              fontSize: size.height * 0.017)),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "Vegan-Healthy",
                                        style: TextStyle(
                                            fontSize: size.height * 0.018,
                                            color: Colors.black54),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                height: 25,
                                                width: 25,
                                                decoration: BoxDecoration(
                                                    color: secondary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100)),
                                                child: Center(
                                                  child: IconButton(
                                                    onPressed: () {
                                                      _decrementCounter();
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
                                                "$_counter",
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
                                                        BorderRadius.circular(
                                                            100)),
                                                child: IconButton(
                                                  onPressed: () {
                                                    _incrementCounter();
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
                                              onPressed: () {},
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
                    );
                  }),
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Order()));
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
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        gradient: LinearGradient(colors: [
                          primary,
                          primary,
                        ]),
                      ),
                      child: const Text("Order Now",
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

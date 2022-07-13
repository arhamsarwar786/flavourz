import 'package:flutter/material.dart';

import '../Utils/constant.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Center(
                    child: Text(
                      'Flavourz Restaurant',
                      style: TextStyle(
                        color: secondary,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Flavourz Restaurant provides you best Quality, Hygienic and Homemade frozen and desi stuff. We made it simpler for you to order food online and offline if you don’t want to cook. Order your favorite and desired food with just one click and enjoy your meal on your doorstep. Initially it was started a year ago and our clients are liked our food as well as our services. We delivered best healthy foods in our town. Cooked in a very clean environment with hygienic and natural masalas and ingredients. Our Frozen stuff is fully preserved and fresh. We made it with pure things. BECAUSE PURITY MATTERS. We are providing you different foods i.e. Desi, Chinese, Deserts, Fast Food, Indian foods, Frozen stuff and many more.\n In this Pandemic our customers faced difficulties to take their order physically. So, we arranged a fully functional and dynamic food App for you. In Which You Order your desired food easily with internet.\n",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Text(
                        "FEATURES:\n",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("•"),
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: Text(
                              "In this app you can order your food with  easy methods.",
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("•"),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 12),
                              child: Text(
                                "It is fully functional and dynamic application.",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("•"),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 12),
                              child: Text(
                                "It provides you different Categorized Food Menus.",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("•"),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 12),
                              child: Text(
                                "It also provides you recent offers and events of Flavourz Restaurant.",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("•"),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 12),
                              child: Text(
                                "It also provides you user authentication features.",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("•"),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 12),
                              child: Text(
                                "It uses different animations and transition that inspired users.",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("•"),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 12),
                              child: Text(
                                "It is user-friendly Food Application.",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      ///   Why Us ///

                      const Text(
                        "\n WHY US? \n",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("o"),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 12),
                              child: Text(
                                "Flavourz Restaurant & cafe is exceptionally renowned and  one of the topmost restaurant in Region by the grace of ALLAH ALMIGHTY.",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("o"),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 12),
                              child: Text(
                                "We provides warm and agreeable environment all the day with comfortable dining experience to make its guests relished and delighted .",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("o"),
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: Text(
                              "If you can’t cook. You can order us and beat your hunger",
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("o"),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 12),
                              child: Text(
                                "When Guests accidently come and you have nothing to cook. Order our appetizing Frozen stuff.",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const Text(
                        "\nThanks for choosing us.\n",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      const Text(
                        "Hope you like our Services for more info may visit our social media pages and review us on GooglePlayStore.\n",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

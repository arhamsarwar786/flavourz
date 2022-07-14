import 'package:flavourz/Screens/Menu/widgets.dart';
import 'package:flavourz/models/menu_model.dart';
import 'package:flutter/material.dart';

import '../../Utils/constant.dart';
import '../details_item.dart';

class RestaurantMenuList extends StatelessWidget {
  final List<Restaurant>? restaurantList;
  RestaurantMenuList({this.restaurantList});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          // SizedBox(
          //   height: 19,
          // ),
          // Container(
          //   child: listCategories(),
          // ),
          Divider(
            color: primary,
          ),
          Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: restaurantList!.length,
                  itemBuilder: (context, index) {
                    Restaurant item = restaurantList![index];
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 0.0, right: 0, top: 8),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailsItem()));
                        },
                        child: Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            height: 115,
                            width: size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      height: 110,
                                      width: size.width * 0.20,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: MemoryImage(
                                            decodedImage(item.productImageBase64)
                                          ),
                                          fit: BoxFit.contain,
                                        ),
                                      )),
                                  Container(
                                    width: size.width * 0.40,
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          FittedBox(
                                            child: Text(
                                              "${item.productName}",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: size.height * 0.018,
                                              ),
                                            ),
                                          ),
                                          FittedBox(
                                            child: Text(
                                              "Vegan-Healthy",
                                              style: TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.black45),
                                            ),
                                          ),
                                          Text(
                                            "Dinner and Brunch-Pakistan-Shami Kabab",
                                            textAlign: TextAlign.start,
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontSize: 10,
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black54),
                                          ),
                                          Text(
                                            "read more",
                                            style: TextStyle(
                                                color: secondary,
                                                fontWeight: FontWeight.w700,
                                                fontSize: size.height * 0.017),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6.0, vertical: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("PKR 300",
                                            style: TextStyle(
                                                color: secondary,
                                                fontWeight: FontWeight.w700,
                                                fontSize: size.height * 0.019)),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.shopping_cart,
                                              color: Colors.black,
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}

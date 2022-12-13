import 'package:flavourz/View/Root.dart';
import 'package:flavourz/models/menu_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/controller_cart.dart';
import '../../controllers/providers/menu_provider.dart';
import '../../widgets.dart';
import '../details_item.dart';

import '../../Utils/constant.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'Drawer.dart';
import 'items.dart';

class Home1 extends StatefulWidget {
  @override
  State<Home1> createState() => _Home1State();
}



class _Home1State extends State<Home1> {


  @override
  void initState() {    
    super.initState();
     var provider = Provider.of<MenuProvider>(context, listen: false);
    if (provider.menuProviderList == null) {
      provider.fetchMenu();
    }
  }




  @override
  Widget build(BuildContext context) {
  final scaffoldKey = GlobalKey<ScaffoldState>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Menu(),
      key: scaffoldKey,
      body: Container(
        height: size.height,
        color: appBgColor,
        child: Padding(
          padding: EdgeInsets.only(top: 12, left: 12, right: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      print("click");
                      scaffoldKey.currentState!.openDrawer();
                    },
                    child: Container(
                      height: 17,
                      width: 17,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/menu.png"))),
                    ),
                  ),
                  Text(
                    "Welcome",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: size.height * 0.024,
                        fontWeight: FontWeight.w700),
                  ),
                  IconButton(
                      onPressed: () {
                        screenIndex = 2;
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> Home() ));
                        setState(() {
                          
                        });
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "Get Your Meals to",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: size.height * 0.022,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.013),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  "Beat Your Hunger",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: secondary,
                    fontSize: size.height * 0.02,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              //  Slider horizontal move

              CarouselSlider(
                  items: [
                    slider(context, "assets/images/banner1.jpg"),
                    slider(context, "assets/images/banner2.jpg"),
                  ],
                  options: CarouselOptions(
                      height: size.height * 0.27,
                      autoPlay: true,
                      autoPlayAnimationDuration: Duration(seconds: 2),
                      autoPlayCurve: Curves.easeInOutBack,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      // initialPage: 2,
                      pageSnapping: false,
                      viewportFraction: 1,
                      autoPlayInterval: Duration(seconds: 5))),
              SizedBox(
                height: size.height * 0.04,
              ),

            

              Expanded(
                child: Consumer<MenuProvider>(
                  builder: (context,provider,child) {
                    return 
                    provider.menuProviderList == null ?  
                    Center(child: CircularProgressIndicator.adaptive(),) 
                    :
                     Column(
                       children: [
                          Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: size.height * 0.022,
                        fontWeight: FontWeight.w500),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Items(provider.menuProviderList!.restaurant)));
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(
                          color: secondary,
                          fontSize: size.height * 0.021,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
                         Expanded(
                           child: ListView.builder(
                              shrinkWrap: true,
                              // physics: NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: provider.menuProviderList!.restaurant!.length,
                              itemBuilder: (context, index) {
                                Restaurant item =  provider.menuProviderList!.restaurant![index];
                                return Padding(
                                padding:
                                    const EdgeInsets.only(left: 0.0, right: 0, top: 8),
                                child: InkWell(
                                  onTap: () {                          
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => DetailsItem(item: item.toJson(),)));
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
                                                  image: NetworkImage(item.productImageBase64!),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
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
                                                      "${item.productDescription!}",
                                                      textAlign: TextAlign.start,
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          overflow: TextOverflow.ellipsis,
                                                          fontWeight: FontWeight.w400,
                                                          color: Colors.black54),
                                                    ),
                                                    Text(
                                                      "Read More",
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
                                                  Text("PKR ${item.productPrice}",
                                                      style: TextStyle(
                                                          color: secondary,
                                                          fontWeight: FontWeight.w700,
                                                          fontSize: size.height * 0.019)),
                                                  IconButton(
                                                      onPressed: () {
                                                        var cart = {
                                                          "id":item.id,
                                                          "productType":item.productType,
                                                          "name": item.productName,
                                                          "image": item.productImageBase64,
                                                          "price": item.productPrice,
                                                          "quantity": 1,                                                
                                                        };                                                                
                                                        print(cart);
                                                        ControllerCart.addCart(context, cart);
                                                      },
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
                            }),
                         ),
                       ],
                     );
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

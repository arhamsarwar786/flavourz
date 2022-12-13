import 'package:flavourz/View/Menu/widgets.dart';
import 'package:flavourz/controllers/controller_cart.dart';
import 'package:flavourz/controllers/preferences.dart';
import 'package:flavourz/models/menu_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Utils/constant.dart';
import '../../controllers/api_manager.dart';
import '../../controllers/providers/menu_provider.dart';
import '../details_item.dart';

class DealScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Deals'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: FutureBuilder(
          future: fetchMenu(),
          builder: (context, AsyncSnapshot snapshot) {
          if(snapshot.hasData && snapshot.data != null){
            MenuModel menuProviderList = snapshot.data;
          return Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: menuProviderList.cafe!.length,
                itemBuilder: (context, index) {
                  Cafe item =
                      menuProviderList.cafe![index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 0.0, right: 0, top: 8),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailsItem(
                                  item: item.toJson(),
                                )));
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 110,
                                  width: size.width * 0.20,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          item.productImageBase64!),
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
                                    crossAxisAlignment: CrossAxisAlignment.end,
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
                                              "id": item.id,
                                              "productType": item.productType,
                                              "name": item.productName,
                                              "image": item.productImageBase64,
                                              "price": item.productPrice,
                                              "quantity": 1,
                                            };

                                            ControllerCart.addCart(
                                                context, cart);
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
          );
        
          }
          return Center(child: CircularProgressIndicator.adaptive(),);
        }),
      ),
    );
  }
  fetchMenu()async{
    return await APIManager.fetchMenu();
  }
}

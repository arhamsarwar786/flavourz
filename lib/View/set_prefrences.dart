import 'package:flavourz/controllers/globalState.dart';
import 'package:flutter/material.dart';

import '../Utils/constant.dart';
import '../widgets.dart';
import 'user_details.dart';

final deliveryLocationController = TextEditingController();
final takewayLocationController = TextEditingController();

class SetPreference extends StatefulWidget {
  const SetPreference({Key? key}) : super(key: key);

  @override
  State<SetPreference> createState() => _SetPreferenceState();
}

class _SetPreferenceState extends State<SetPreference> {


  String setPreference = "delivery";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  
                  if(GlobalState.cartModel!.isNotEmpty){
                    GlobalState.cartModel!.clear();
                  }
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            title: Text(
              "Set Prefrences",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: size.height * 0.022,
                  fontWeight: FontWeight.w500),
            ),
            backgroundColor: Colors.white,
            bottom:  TabBar(
              onTap: (val){
                if(val == 1){
                  setPreference = 'takeway';
                }else{
                  setPreference = 'delivery';

                }
              },
              indicatorColor: primary,
              labelColor: primary,
              unselectedLabelColor: Colors.black54,
              unselectedLabelStyle:
                  TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              indicatorSize: TabBarIndicatorSize.label,
              labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              tabs: [
                Tab(
                  icon: Icon(Icons.directions_bike),
                  text: "Home Delivery",
                ),
                Tab(
                  icon: Icon(Icons.shopping_basket),
                  text: "Takeway",
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            _delivery(context),
            _takeway(context),
          ]),
        ),
      ),
    );
  }

Widget _delivery(context) {
  final size = MediaQuery.of(context).size;
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   "SET YOUR LOCATION",
          //   style: TextStyle(
          //       color: Colors.black,
          //       fontSize: size.height * 0.020,
          //       fontWeight: FontWeight.w600),
          // ),
          SizedBox(
            height: size.height * 0.012,
          ),
          // CustomTextField(
          //   title: "Set Location",
          //   controller: deliveryLocationController,
          // ),
          const Divider(
            color: primary,
            thickness: 0.5,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: const [
              // Icon(
              //   Icons.location_searching,
              //   size: 25,
              //   color: Colors.black,
              // ),
              SizedBox(
                width: 10,
              ),
              // Text(
              //   "Use Current Location",
              //   style: TextStyle(
              //       color: Colors.black,
              //       fontSize: 17,
              //       fontWeight: FontWeight.w500),
              // ),
            ],
          ),
          SizedBox(
            height: size.height * 0.15,
          ),
          Center(
            child: InkWell(
              onTap: () {
                if(setPreference == "takeway"){
                  GlobalState.orderModel!.setPreference = "takeway";
                }else{
                  GlobalState.orderModel!.setPreference = "delivery";

                }
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => UserDetails()));
              },
              child: Card(
                elevation: 3,
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
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0))),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _takeway(context) {
  final size = MediaQuery.of(context).size;
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   "SET YOUR LOCATION",
          //   style: TextStyle(
          //       color: Colors.black,
          //       fontSize: size.height * 0.020,
          //       fontWeight: FontWeight.w600),
          // ),
          SizedBox(
            height: size.height * 0.012,
          ),
          // CustomTextField(
          //   title: "Set Location",
          //   controller: takewayLocationController,
          // ),
          const Divider(
            color: primary,
            thickness: 0.5,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: const [
              // Icon(
              //   Icons.location_searching,
              //   size: 25,
              //   color: Colors.black,
              // ),
              SizedBox(
                width: 10,
              ),
              // Text(
              //   "Use Current Location",
              //   style: TextStyle(
              //       color: Colors.black,
              //       fontSize: 17,
              //       fontWeight: FontWeight.w500),
              // ),
            ],
          ),
          SizedBox(
            height: size.height * 0.15,
          ),
          Center(
            child: InkWell(
              onTap: () {
                if(setPreference == "takeway"){
                  GlobalState.orderModel!.setPreference = "takeway";
                }else{
                  GlobalState.orderModel!.setPreference = "delivery";

                }
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => UserDetails()));
              },
              child: Card(
                elevation: 3,
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
                            fontWeight: FontWeight.w500,
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

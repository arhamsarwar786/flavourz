import 'package:flavourz/controllers/globalState.dart';
import 'package:flavourz/controllers/location_permission.dart';
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
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      
          SizedBox(
            height: size.height * 0.012,
          ),
       Container(
      color: Colors.white,
      child: TextField(
        onChanged: (e){
           setState(() {
           GlobalState.location = e; 
             
           });
        },
        controller: deliveryLocationController,
        keyboardType: TextInputType.text,
        cursorColor: primary,
        // maxLines: lines,
        autofocus: false,
        style:TextStyle(fontSize:12),
        decoration: InputDecoration(        
          contentPadding: const EdgeInsets.only(left: 10, right: 10,top: 20),
          fillColor: Colors.white,
          // filled: true,
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primary, width: 3),
            borderRadius: BorderRadius.circular(10),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primary, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: primary, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primary, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: " Enter Location",
          hintStyle: TextStyle(color: Colors.black38, fontSize: 12),
        ),
      ),
    ),
  
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: primary,
            thickness: 0.5,
          ),
    
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('OR',style: TextStyle(fontSize: 30),),
            ],
          ),
          const Divider(
            color: primary,
            thickness: 0.5,
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: ()async{
              await getCurrentLocation();
              setState(() {                
              });
            },
            child: Row(
              children: const [
                Icon(
                  Icons.gps_fixed,
                  size: 25,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Use Current Location",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
SizedBox(
            height: 10,
          ),
              Text('Address',style: TextStyle(fontSize: 20),),


           if(GlobalState.location!=null)
          Text('${GlobalState.location}'),
          SizedBox(
            height: 10,
          ),
          Center(
            child: InkWell(
              onTap: () {
                if(GlobalState.location == null){
                  snackBar(context, "Please! Select Location Option");
                }else{

                if(setPreference == "takeway"){
                  GlobalState.orderModel!.setPreference = "takeway";
                }else{
                  GlobalState.orderModel!.setPreference = "delivery";
    
                }
                GlobalState.orderModel!.address = '${GlobalState.location}';
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => UserDetails()));
                }
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
                    child: const Text("Next",
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
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      
          SizedBox(
            height: size.height * 0.012,
          ),
       Container(
      color: Colors.white,
      child: TextField(

        controller: deliveryLocationController,
        keyboardType: TextInputType.text,
        cursorColor: primary,
        // maxLines: lines,
        autofocus: false,
        style:TextStyle(fontSize:12),
        decoration: InputDecoration(
          suffixIcon: IconButton(onPressed: (){


            if(deliveryLocationController.text.isEmpty){
              snackBar(context, 'Please Enter some location');
            }else{
              GlobalState.location = deliveryLocationController.text; 
            }

            setState(() {
              
            });

          }, icon:  Icon(Icons.add,color: primary,)),
          contentPadding: const EdgeInsets.only(left: 10, right: 10,top: 20),
          fillColor: Colors.white,
          // filled: true,
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primary, width: 3),
            borderRadius: BorderRadius.circular(10),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primary, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: primary, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primary, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: " Enter Location",
          hintStyle: TextStyle(color: Colors.black38, fontSize: 12),
        ),
      ),
    ),
  
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: primary,
            thickness: 0.5,
          ),
    
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('OR',style: TextStyle(fontSize: 30),),
            ],
          ),
          const Divider(
            color: primary,
            thickness: 0.5,
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: ()async{
              await getCurrentLocation();
              setState(() {                
              });
            },
            child: Row(
              children: const [
                Icon(
                  Icons.gps_fixed,
                  size: 25,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Use Current Location",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
SizedBox(
            height: 10,
          ),
              Text('Address',style: TextStyle(fontSize: 20),),


           if(GlobalState.location!=null)
          Text('${GlobalState.location}'),
          SizedBox(
            height: 10,
          ),
          Center(
            child: InkWell(
              onTap: () {
                if(GlobalState.location == null){
                  snackBar(context, "Please! Select Location Option");
                }else{

                if(setPreference == "takeway"){
                  GlobalState.orderModel!.setPreference = "takeway";
                }else{
                  GlobalState.orderModel!.setPreference = "delivery";
    
                }
                GlobalState.orderModel!.address = '${GlobalState.location}';
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => UserDetails()));
                }
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
                    child: const Text("Next",
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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavourz/View/add_adrees.dart';
import 'package:flavourz/View/checkout.dart';
import 'package:flavourz/controllers/globalState.dart';
import 'package:flutter/material.dart';

import '../Utils/constant.dart';
import '../widgets.dart';
import 'add_adrees.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  State<UserDetails> createState() => UserDetailsState();
}

class UserDetailsState extends State<UserDetails> {
    final fullNameController = TextEditingController();
    // final phonenumberController = TextEditingController();
    final emailController = TextEditingController();
    final addressController = TextEditingController();
    final commentController = TextEditingController();


    @override
  void initState() {  
    super.initState();

    addressController.text = GlobalState.location!;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        centerTitle: true,
        title: Text(
          "Order Now",
          style: TextStyle(
              color: Colors.black,
              fontSize: size.height * 0.022,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
         GlobalState.orderModel!.setPreference == 'takeway' ? Container() :     Text(
                "Full Name",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: size.height * 0.021,
                    fontWeight: FontWeight.w700),
              ),
            GlobalState.orderModel!.setPreference == 'takeway' ? Container() :  SizedBox(
                height: 5,
              ),
           GlobalState.orderModel!.setPreference == 'takeway' ? Container() :   CustomTextField(
                title: "Enter Full Name",
                controller: fullNameController,
              ),
            

            GlobalState.orderModel!.setPreference == 'takeway' ? Container() :  SizedBox(
                height: 5,
              ),
            GlobalState.orderModel!.setPreference == 'takeway' ? Container() :    Text(
                "Phone Number (Optional)",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: size.height * 0.021,
                    fontWeight: FontWeight.w700),
              ),
            GlobalState.orderModel!.setPreference == 'takeway' ? Container() :    CustomTextField(
                title: "Enter Phone Number ",
                controller: emailController,
                type: TextInputType.number,
              ),
              // SizedBox(
              //   height: 5,
              // ),
           GlobalState.orderModel!.setPreference == 'takeway' ? Container() :   Text(
                "Address",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: size.height * 0.021,
                    fontWeight: FontWeight.w700),
              ),
          GlobalState.orderModel!.setPreference == 'takeway' ? Container() :    SizedBox(
                height: 5,
              ),
          GlobalState.orderModel!.setPreference == 'takeway' ? Container() :    CustomTextField(
                title: "Enter Address",
                controller: addressController,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Extra Note (Optional)",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: size.height * 0.021,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(
                title: "Add Some Extra Notes",
                controller: commentController,
                lines: 5,
                type: TextInputType.text,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    if(GlobalState.orderModel!.setPreference == "takeway"){
                        fullNameController.text = " ";
                    }
                    if (fullNameController.text.isEmpty) {
                      snackBar(context, "Please! Enter Full Name");
                    }
                    //  else if (addressController.text.isEmpty) {
                    //   snackBar(context, "Please! Enter Address");
                    // }
                    //  else if (commentController.text.isEmpty) {
                    //   snackBar(context, "Please! Enter Some Comment");
                    // } 
                    else {

                      GlobalState.orderModel!.name = fullNameController.text;
                      GlobalState.orderModel!.phoneNumber = FirebaseAuth.instance.currentUser!.phoneNumber;
                      GlobalState.orderModel!.email = emailController.text;
                      // GlobalState.orderModel!.address = addressController.text;
                      GlobalState.orderModel!.comment = commentController.text;
                      
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => CheckOut()));
                      // Navigator.of(context).push(
                      //     MaterialPageRoute(builder: (context) => AddAddress()));
                    }
                  },
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.60,
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          gradient: LinearGradient(colors: [
                            primary,
                            primary,
                          ]),
                        ),
                        child: Text("Continue",
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
      ),
    );
  }
}

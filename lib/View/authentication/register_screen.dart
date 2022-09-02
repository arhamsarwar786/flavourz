import 'package:flavourz/View/about_us.dart';
import 'package:flutter/material.dart';

import '../../Utils/constant.dart';

import '../../widgets.dart';
import 'opt_screen.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final phoneNumber = TextEditingController();
  bool _value = false;

  clearTextInput() {
    phoneNumber.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(         
               
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5.0, left: 15, right: 15, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 30,
                          ),
                          // IconButton(
                          //   onPressed: () {
                          //     Navigator.pop(context);
                          //   },
                          //   iconSize: 25,
                          //   color: primary,
                          //   icon: const Icon(Icons.arrow_back),
                          // ),
                          Text(
                            "Flavourz",
                            style: TextStyle(
                                color: primary,
                                fontSize: 25,
                                fontWeight: FontWeight.w700),
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AboutUs()));
                              },
                              child: Icon(
                                Icons.help,
                                size: 25,
                                color: primary,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.10,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.30,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/bro.png"),
                                fit: BoxFit.fitHeight)),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.10,
                      ),
                      TextField(
                        controller: phoneNumber,
                        keyboardType: TextInputType.number,
                        cursorColor: primary,
                        autofocus: false,
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 15.0),
                            fillColor: Colors.white,
                            filled: true,
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            hintText: "Mobile Number",
                            hintStyle:
                                TextStyle(color: Colors.black38, fontSize: 16),
                            prefixIcon: SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 12, left: 10),
                                child: Text(
                                  "+92 |",
                                  style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                            suffixIcon: IconButton(
                                icon: const Icon(
                                  Icons.clear,
                                  color: Colors.black38,
                                ),
                                onPressed: clearTextInput)),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Center(
                                child: InkWell(
                              onTap: () {
                                setState(() {
                                  _value = !_value;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1.5),
                                    shape: BoxShape.circle,
                                    color: Colors.white),
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: _value
                                      ? Icon(
                                          Icons.check,
                                          size: 14.0,
                                          color: Colors.green,
                                        )
                                      : Icon(
                                          Icons.check_box_outline_blank,
                                          size: 14.0,
                                          color: Colors.white,
                                        ),
                                ),
                              ),
                            )),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "I agree to the",
                              style: TextStyle(
                                  color: primary,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Privicy Policy  Terms of Services",
                              style: TextStyle(
                                  color: secondary,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // Botton
        
                      InkWell(
                        onTap: () {
        
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=> OtpScreen(phoneNumber: "+923084695012",) ));

                           FocusScope.of(context).unfocus();
                          var number;
                          if (phoneNumber.text.length >= 10 && _value == true) {
                            if(phoneNumber.text[0] == '0' ){
                              number = '92${phoneNumber.text}'.split('920');
                              number = number[1];
                            }else{
                              number = phoneNumber.text;
                            }
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> OtpScreen(phoneNumber: number,) ));
                          
                          } else {
                            snackBar(context,
                                "Please! Check your Phone Number OR Terms and Conditions");
                          }
        
                        },
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width * 0.60,
                              height: 50.0,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0)),
                                  gradient: LinearGradient(colors: [
                                    primary,
                                    primary,
                                    primary,
                                    // Colors.white,
                                  ]),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 0),
                                      color: primary,
                                      blurRadius: 1.0,
                                    ),
                                    BoxShadow(
                                      offset: Offset(0, 0),
                                      color: primary,
                                      blurRadius: 1.0,
                                    ),
                                    BoxShadow(
                                      offset: Offset(0, 0),
                                      color: primary,
                                      blurRadius: 1.0,
                                    ),
                                  ]),
                              child: const Text("Next",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 18.0))),
                        ),
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
  }
}

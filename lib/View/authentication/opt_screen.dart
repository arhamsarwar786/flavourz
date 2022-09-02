import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Utils/constant.dart';
import '../../controllers/globalState.dart';
import '../../widgets.dart';
import '../Root.dart';
class OtpScreen extends StatefulWidget {
  final phoneNumber;
  OtpScreen({this.phoneNumber});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final codeDigit1 = TextEditingController();
  final codeDigit2 = TextEditingController();
  final codeDigit3 = TextEditingController();
  final codeDigit4 = TextEditingController();
  final codeDigit5 = TextEditingController();
  final codeDigit6 = TextEditingController();

  @override
  void initState() {
    super.initState();
    registerUser(context, widget.phoneNumber);
  }

  String? smsCode;


  FirebaseAuth auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   print(GlobalState.userDetails!.toJson().toString());
      // }),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xfff7f6fb),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24, horizontal: 10),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back,
                          size: 32,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.amber.shade50,
                        shape: BoxShape.circle,
                      ),
                      // child: Image.asset(
                      //   'assets/images/illustration-3.png',
                      // ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "+92${widget.phoneNumber}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Verification',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Enter your OTP code number",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Container(
                      padding: EdgeInsets.all(28),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              if (!isEnable) {
                                snackBar(context, "Please! wait for OTP");
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _textFieldOTP(
                                    first: true,
                                    last: false,
                                    controller: codeDigit1),
                                _textFieldOTP(
                                    first: false,
                                    last: false,
                                    controller: codeDigit2),
                                _textFieldOTP(
                                    first: false,
                                    last: false,
                                    controller: codeDigit3),
                                _textFieldOTP(
                                    first: false,
                                    last: false,
                                    controller: codeDigit4),
                                _textFieldOTP(
                                    first: false,
                                    last: false,
                                    controller: codeDigit5),
                                _textFieldOTP(
                                    first: false,
                                    last: true,
                                    controller: codeDigit6),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 22,
                          ),
                          // SizedBox(
                          //   width: double.infinity,
                          //   child: ElevatedButton(
                          //     onPressed: () async {

                          //     },
                          //     style: ButtonStyle(
                          //       foregroundColor:
                          //           MaterialStateProperty.all<Color>(Colors.white),
                          //       backgroundColor:
                          //           MaterialStateProperty.all<Color>(primayColor),
                          //       shape:
                          //           MaterialStateProperty.all<RoundedRectangleBorder>(
                          //         RoundedRectangleBorder(
                          //           borderRadius: BorderRadius.circular(24.0),
                          //         ),
                          //       ),
                          //     ),
                          //     child: Padding(
                          //       padding: EdgeInsets.all(14.0),
                          //       child: Text(
                          //         'Verify',
                          //         style: TextStyle(fontSize: 16),
                          //       ),
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Text(
                      "Didn't you receive any code?",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    InkWell(
                      onTap: () {
                        snackBar(context, "Resending New OTP");
                        registerUser(context, widget.phoneNumber);
                      },
                      child: Text(
                        "Resend New Code",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: secondary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              if (isLoad || isEnable)
                Container(
                  height: size.height,
                  width: size.width,
                  alignment: Alignment.center,
                  color: primary.withOpacity(0.5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator.adaptive(
                        backgroundColor: secondary,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Please! Wait Verifing Credentials",
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  bool isLoad = false;
  bool isEnable = false;

  Widget _textFieldOTP({bool? first, last, controller}) {
    return Container(
      height: 70,
      child: AspectRatio(
        aspectRatio: 0.6,
        child: TextField(
          // enabled: isEnable,
          controller: controller,
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
            if (last == true) {
              smsCode =
                  "${codeDigit1.text}${codeDigit2.text}${codeDigit3.text}${codeDigit4.text}${codeDigit5.text}${codeDigit6.text}";
              print(smsCode);
              FocusScope.of(context).unfocus();
              setState(() {
                isLoad = true;
              });
              print("ar" + smsCode.toString());

              auth
                  .signInWithCredential(PhoneAuthProvider.credential(
                      verificationId: _verificationId!, smsCode: smsCode!))
                  .then((res) async {
                if (res.user != null) {
                  print("COME HERE");
                  setState(() {
                    user = FirebaseAuth.instance.currentUser;
                  });
                }
              }).whenComplete(() {
                if (user != null) {
                  print("DONE");
                  verifyOTP(widget.phoneNumber);

                } else {
                  print("ALL");
                }
              }).catchError((e) {
                setState(() {
                  isLoad = false;
                });
                snackBar(context, e.toString());
              });
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: secondary),
                borderRadius: BorderRadius.circular(12)),
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: secondary),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: secondary),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }

  String? _verificationId;
  User? user;

  registerUser(context, phoneNumber) {
    // FocusScope.of(context).unfocus();
    setState(() {
      isEnable = true;
    });
    auth.verifyPhoneNumber(
      phoneNumber: "+92"+phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          print("You are logged in successfully");
          verifyOTP('+92+$phoneNumber');
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
        snackBar(context, e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        isEnable = false;
        _verificationId = verificationId;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  verifyOTP(number) async {
    
    // if (GlobalState.userDetails == null) {
      
    // }
    setState(() {
      isLoad = false;
    });
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }
}

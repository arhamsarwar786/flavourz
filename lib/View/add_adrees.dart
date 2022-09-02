import 'package:flavourz/Utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets.dart';
import 'checkout.dart';

class AddAddress extends StatefulWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  int _groupValue = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final searchContoller = TextEditingController();
    final completeAddressController = TextEditingController();
    final localityController = TextEditingController();
    final cityController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: primary,
        ),
        backgroundColor: primary,
        title: const Text(
          "Add/Edit Adress",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Stack(
              //   children: [
              //     // Container(
              //     //   height: 200,
              //     //   width: size.width,
              //     //   // color: Colors.black,
              //     //   child: const Center(child: Text("Show map here")),
              //     // ),
              //     // Positioned(
              //     //     bottom: 0,
              //     //     left: 0,
              //     //     right: 0,
              //     //     child: Padding(
              //     //       padding: EdgeInsets.only(
              //     //           left: 10, right: size.width / 5, bottom: 10),
              //     //       child: CupertinoSearchTextField(
              //     //         controller: searchContoller,
              //     //         style: const TextStyle(
              //     //             color: Colors.black,
              //     //             fontWeight: FontWeight.normal),
              //     //         decoration: BoxDecoration(
              //     //             borderRadius: BorderRadius.circular(6),
              //     //             border: Border.all(
              //     //               color: Colors.grey,
              //     //             )),
              //     //       ),
              //     //     )),
              //     // Positioned(
              //     //   bottom: 0,
              //     //   right: 0,
              //     //   child: Container(
              //     //     height: 40,
              //     //     margin:
              //     //         EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //     //     decoration: BoxDecoration(
              //     //       border: Border.all(color: Colors.grey),
              //     //       // color: Colors.grey,
              //     //       borderRadius: BorderRadius.circular(6.0),
              //     //     ),
              //     //     child: IconButton(
              //     //         onPressed: () {},
              //     //         icon: const Icon(
              //     //           Icons.location_searching_rounded,
              //     //           color: Color.fromARGB(255, 4, 11, 15),
              //     //           size: 20,
              //     //         )),
              //     //   ),
              //     // ),
              //   ],
              // ),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                        "Your address will be saved for your future reference.You can edit it any time you want"),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Complete Address"),
                    const SizedBox(
                      height: 4,
                    ),
                    CustomTextField(
                      title: "Complete Address",
                      controller: completeAddressController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Locality"),
                    const SizedBox(
                      height: 4,
                    ),
                    CustomTextField(
                      title: "Locality",
                      controller: localityController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("City"),
                    const SizedBox(
                      height: 4,
                    ),
                    CustomTextField(
                      title: "Enter City Name",
                      controller: cityController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("NickName eg. Home, work etc"),
                  ],
                ),
              ),
              _myRadioButton(
                  title: "Home",
                  value: 0,
                  onChanged: (newValue) => setState(
                        () => _groupValue = newValue,
                      )),
              _myRadioButton(
                  title: "Work",
                  value: 1,
                  onChanged: (newValue) => setState(
                        () => _groupValue = newValue,
                      )),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  width: size.width,
                  child: CupertinoButton(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    color: primary,
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => CheckOut()));
                    },
                    child: const Text(
                      "SAVE AND PROCEED TO CHECKOUT",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _myRadioButton({String? title, int? value, onChanged}) {
    return RadioListTile(
      contentPadding: EdgeInsets.all(0),
      visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity),
      dense: true,
      activeColor: Colors.green,
      value: value,
      groupValue: _groupValue,
      onChanged: onChanged,
      title: Text(title.toString()),
    );
  }
}

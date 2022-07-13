import 'package:flutter/material.dart';

import '../Utils/constant.dart';

class Share extends StatelessWidget {
  const Share({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Share Us",
          style: TextStyle(
              color: Colors.black,
              fontSize: size.height * 0.022,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Center(child: Text("Comming Soon")),
    );
  }
}

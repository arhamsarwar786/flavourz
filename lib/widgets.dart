import 'package:flutter/material.dart';
import 'Utils/constant.dart';
import 'controllers/api_manager.dart';
import 'controllers/globalState.dart';



  fetchMenuList()async{
    GlobalState.menuList = await APIManager.fetchMenu();
  }


Widget CustomAppBar(context, title, int color) {
  final size = MediaQuery.of(context).size;

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: Color(color),
        ),
      ),
      Text(
        title,
        style: TextStyle(
            color: Color(color),
            fontSize: size.height * 0.035,
            fontWeight: FontWeight.w700),
      ),
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.shopping_cart,
            color: Color(color),
          )),
    ],
  );
}

Widget NormalAppBar(context, title) {
  final size = MediaQuery.of(context).size;

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        color: Colors.white,
        child: CircleAvatar(
          radius: 15,
          backgroundColor: Colors.white,
          child: Center(
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                size: 15,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      Text(
        title,
        style: TextStyle(
            color: Colors.black,
            fontSize: size.height * 0.021,
            fontWeight: FontWeight.w500),
      ),
      Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        color: Colors.white,
        child: CircleAvatar(
          radius: 15,
          backgroundColor: Colors.white,
          child: Center(
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                size: 15,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget slider(context, image) {
  return Container(
    margin: EdgeInsets.all(8),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.black54,
              offset: Offset(1, 1),
              blurRadius: 2,
              spreadRadius: 1)
        ],
        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image))),
  );
}

Widget TextField1(context, title) {
  return TextField(
    // controller: text,
    keyboardType: TextInputType.name,
    cursorColor: primary,
    autofocus: false,
    decoration: InputDecoration(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25),
      fillColor: Colors.white,
      filled: true,
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary),
        borderRadius: BorderRadius.circular(10.0),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary),
        borderRadius: BorderRadius.circular(10.0),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: primary),
        borderRadius: BorderRadius.circular(10.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary),
        borderRadius: BorderRadius.circular(10.0),
      ),
      hintText: title,
      hintStyle: TextStyle(color: primary, fontSize: 16),
    ),
  );
}

Widget TextField2(context, title) {
  return TextField(
    maxLines: 5,
    // controller: text,
    keyboardType: TextInputType.name,
    cursorColor: primary,
    autofocus: false,
    decoration: InputDecoration(
      contentPadding:
          const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25),
      fillColor: Colors.white,
      filled: true,
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary),
        borderRadius: BorderRadius.circular(10.0),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary),
        borderRadius: BorderRadius.circular(10.0),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: primary),
        borderRadius: BorderRadius.circular(10.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary),
        borderRadius: BorderRadius.circular(10.0),
      ),
      hintText: title,
      hintStyle: TextStyle(color: primary, fontSize: 16),
    ),
  );
}

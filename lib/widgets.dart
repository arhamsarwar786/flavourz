import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavourz/View/Root.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Utils/constant.dart';
import 'View/authentication/register_screen.dart';
import 'controllers/globalState.dart';
import 'models/menu_model.dart';

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

snackBar(context, text) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
    duration: Duration(milliseconds: 300),
  ));
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

class CustomTextField extends StatelessWidget {
  final title, controller, type, lines;
  CustomTextField({this.controller, this.title, this.type, this.lines});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TextField(
        controller: controller,
        keyboardType: type,
        cursorColor: primary,
        maxLines: lines,
        autofocus: false,
        style: TextStyle(fontSize: 12),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 10, right: 10, top: 20),
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
          hintText: " $title",
          hintStyle: TextStyle(color: Colors.black38, fontSize: 12),
        ),
      ),
    );
  }
}

showAlert(BuildContext context,
    {@required title, @required content, @required type}) {
  Widget continueButton = MaterialButton(
    color: type == "error" ? Colors.red : Colors.green,
    child: Text(
      "OK",
      style: TextStyle(color: Colors.white),
    ),
    onPressed: () {
      if (type == "success") {
        // GlobalState.isDataPosted = false;
      }
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      title,
      style: TextStyle(
          color: type == "error" ? Colors.red : Colors.green,
          fontSize: 30,
          fontWeight: FontWeight.bold),
    ),
    content: Text('$content'),
    actions: [
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

addNumberDialog(BuildContext context) {
  final numberController = TextEditingController();
  // set up the buttons

  Widget continueButton = MaterialButton(
    color: primary,
    child: Text(
      "OK",
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    onPressed: () async {
      if (numberController.text.isEmpty || numberController.text.length != 11) {
        snackBar(context, "Enter Valid Number");
      } else {
        Navigator.pop(context);
      }
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      "Enter Number",
      style: TextStyle(color: primary, fontWeight: FontWeight.bold),
    ),
    content: CustomTextField(
      title: "ENTER 11 DIGITS NUMBER",
      controller: numberController,
      type: TextInputType.number,
    ),
    actions: [
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );

  return numberController.text;
}

//  FUNCTION FOR ALERTBOX
showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = MaterialButton(
    color: primary,
    child: Text(
      "OK",
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    onPressed: () {
      FirebaseAuth.instance.signOut();
      GlobalState.orderModel = null;
      GlobalState.cartModel = null;
      screenIndex = 0;
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => Home()), (route) => false);
    },
  );

  Widget cancelbutton = MaterialButton(
    color: primary,
    child: Text(
      "Cancel",
      style: TextStyle(color: Colors.white),
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      "Alert",
      style:
          TextStyle(color: primary, fontSize: 18, fontWeight: FontWeight.w800),
    ),
    content: Text(
      "Are You Sure Want to Log Out?",
      style:
          TextStyle(color: primary, fontSize: 15, fontWeight: FontWeight.w600),
    ),
    actions: [
      okButton,
      cancelbutton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class CustomSearchBar extends StatefulWidget {
  final controller, enabled,allItems, searchItems;
  CustomSearchBar({this.controller, this.enabled = true,this.allItems,this.searchItems});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {





  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 45,
      child: new Card(
        child: new ListTile(
          leading: new Icon(Icons.search),
          title: new TextField(
            enabled: widget.enabled,
            controller: widget.controller,
            decoration: new InputDecoration(

                hintText: 'Search',
                border: InputBorder.none),
            // onChanged: onSearchTextChanged,
          ),
          trailing: new IconButton(
            icon: new Icon(Icons.cancel),
            onPressed: () {
              widget.controller.clear();
              // onSearchTextChanged('');
            },
          ),
        ),
      ),
    );
  }
}

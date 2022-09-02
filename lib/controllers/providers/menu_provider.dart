import 'package:flavourz/controllers/api_manager.dart';
import 'package:flavourz/models/menu_model.dart';
import 'package:flutter/material.dart';

class MenuProvider extends ChangeNotifier {
  MenuModel? menuProviderList;

  fetchMenu() async {
    print("FETCHING MENU...");
    menuProviderList = await APIManager.fetchMenu();
    print(menuProviderList);
    notifyListeners();
  }
}

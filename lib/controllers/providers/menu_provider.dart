import 'package:flavourz/controllers/api_manager.dart';
import 'package:flavourz/models/menu_model.dart';
import 'package:flutter/material.dart';

class MenuProvider extends ChangeNotifier {
  MenuModel? menuProviderList;

  fetchMenu() async {
    menuProviderList = await APIManager.fetchMenu();
    notifyListeners();
  }
}

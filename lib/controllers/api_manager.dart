import 'package:flavourz/models/menu_model.dart';
import 'package:http/http.dart' as http;

class APIManager {
 static fetchMenu() async {
    var data = await http
        .get(Uri.parse("https://www.geoinvest.pk/food/api/products_api.php"));
    var res = menuModelFromJson(data.body);
    return res;
  }
}

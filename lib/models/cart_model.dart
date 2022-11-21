// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

List<CartModel> cartModelFromJson(String str) => List<CartModel>.from(json.decode(str).map((x) => CartModel.fromJson(x)));

String cartModelToJson(List<CartModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartModel {
    CartModel({
        this.id,
        this.productType,
        this.name,
        this.product_category,
        this.productDescription,
        this.image,
        this.price,
        this.quantity,
    });

    String? id;
    String? productType;
    String? product_category;
    String? name;
    String? productDescription;
    String? image;
    String? price;
    int? quantity;

    factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        product_category: json["product_category"],
        productType: json["productType"],
        name: json["name"],
        productDescription: json["productDescription"],
        image: json["image"],
        price: json["price"],
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "productType": productType,
        "name": name,
        "name": product_category,
        "productDescription": productDescription,
        "image": image,
        "price": price,
        "quantity": quantity,
    };
}

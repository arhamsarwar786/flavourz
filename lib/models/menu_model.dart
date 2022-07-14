// To parse this JSON data, do
//
//     final menuModel = menuModelFromJson(jsonString);

import 'dart:convert';

MenuModel menuModelFromJson(String str) => MenuModel.fromJson(json.decode(str));

String menuModelToJson(MenuModel data) => json.encode(data.toJson());

class MenuModel {
    MenuModel({
        this.restaurant,
        this.cafe,
    });

    List<Restaurant>? restaurant;
    List<Cafe>? cafe;

    factory MenuModel.fromJson(Map<String, dynamic> json) => MenuModel(
        restaurant: List<Restaurant>.from(json["Restaurant"].map((x) => Restaurant.fromJson(x))),
        cafe: List<Cafe>.from(json["Cafe"].map((x) => Cafe.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Restaurant": List<dynamic>.from(restaurant!.map((x) => x.toJson())),
        "Cafe": List<dynamic>.from(cafe!.map((x) => x.toJson())),
    };
}

class Cafe {
    Cafe({
        this.id,
        this.productType,
        this.productName,
        this.productDescription,
        this.productPrice,
        this.productImageBase64,
    });

    String? id;
    String? productType;
    String? productName;
    String? productDescription;
    String? productPrice;
    String? productImageBase64;

    factory Cafe.fromJson(Map<String, dynamic> json) => Cafe(
        id: json["id"],
        productType: json["product_type"],
        productName: json["product_name"],
        productDescription: json["product_description"],
        productPrice: json["product_price"],
        productImageBase64: json["product_image_base64"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product_type": productType,
        "product_name": productName,
        "product_description": productDescription,
        "product_price": productPrice,
        "product_image_base64": productImageBase64,
    };
}



class Restaurant {
    Restaurant({
        this.id,
        this.productType,
        this.productName,
        this.productDescription,
        this.productPrice,
        this.productImageBase64,
    });

    String? id;
    String? productType;
    String? productName;
    String? productDescription;
    String? productPrice;
    String? productImageBase64;

    factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        productType: json["product_type"],
        productName: json["product_name"],
        productDescription: json["product_description"],
        productPrice: json["product_price"],
        productImageBase64: json["product_image_base64"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product_type": productType,
        "product_name": productName,
        "product_description": productDescription,
        "product_price": productPrice,
        "product_image_base64": productImageBase64,
    };
}

// To parse this JSON data, do
//
//     final trackOrderModel = trackOrderModelFromJson(jsonString);

import 'dart:convert';

List<TrackOrderModel> trackOrderModelFromJson(String str) => List<TrackOrderModel>.from(json.decode(str).map((x) => TrackOrderModel.fromJson(x)));

String trackOrderModelToJson(List<TrackOrderModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TrackOrderModel {
    TrackOrderModel({
        this.id,
        this.orderNumber,
        this.phoneNumber,
        this.productId,
        this.productImage,
        this.productPrice,
        this.orderDate,
        this.orderStatus,
    });

    String? id;
    String? orderNumber;
    String? phoneNumber;
    String? productId;
    String? productImage;
    String? productPrice;
    DateTime? orderDate;
    String? orderStatus;

    factory TrackOrderModel.fromJson(Map<String, dynamic> json) => TrackOrderModel(
        id: json["id"],
        orderNumber: json["order_number"],
        phoneNumber: json["phone_number"],
        productId: json["product_id"],
        productImage: json["product_image"],
        productPrice: json["product_price"],
        orderDate: DateTime.parse(json["order_date"]),
        orderStatus: json["order_status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "order_number": orderNumber,
        "phone_number": phoneNumber,
        "product_id": productId,
        "product_image": productImage,
        "product_price": productPrice,
        "order_date": orderDate!.toIso8601String(),
        "order_status": orderStatus,
    };
}

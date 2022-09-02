// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) => OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
    OrderModel({
        this.phoneNumber,
        this.productId,
        this.productQty,
        this.totalAmount,
        this.setPreference,
        this.email,
        this.name,
        this.address,
        this.comment,
        this.paymentType,
    });

    String? phoneNumber;
    String? productId;
    String? productQty;
    String? totalAmount;
    String? setPreference;
    String? email;
    String? name;
    String? address;
    String? comment;
    String? paymentType;

    factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        phoneNumber: json["phone_number"],
        productId: json["product_id"],
        productQty: json["product_qty"],
        totalAmount: json["total_amount"],
        setPreference: json["set_preference"],
        email: json["email"],
        name: json["name"],
        address: json["address"],
        comment: json["comment"],
        paymentType: json["payment_type"],
    );

    Map<String, dynamic> toJson() => {
        "phone_number": phoneNumber,
        "product_id": productId,
        "product_qty": productQty,
        "total_amount": totalAmount,
        "set_preference": setPreference,
        "email": email,
        "name": name,
        "address": address,
        "comment": comment,
        "payment_type": paymentType,
    };
}

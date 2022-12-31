// To parse this JSON data, do
//
//     final sliderModel = sliderModelFromJson(jsonString);

import 'dart:convert';

List<SliderModel> sliderModelFromJson(String str) => List<SliderModel>.from(json.decode(str).map((x) => SliderModel.fromJson(x)));

String sliderModelToJson(List<SliderModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SliderModel {
    SliderModel({
        this.id,
        this.sliderImageBase64,
    });

    String? id;
    String? sliderImageBase64;

    factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
        id: json["id"],
        sliderImageBase64: json["slider_image_base64"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slider_image_base64": sliderImageBase64,
    };
}

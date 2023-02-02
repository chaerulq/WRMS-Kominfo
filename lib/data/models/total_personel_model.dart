// To parse this JSON data, do
//
//     final totalPersonelModel = totalPersonelModelFromJson(jsonString);

import 'dart:convert';

TotalPersonelModel totalPersonelModelFromJson(String str) =>
    TotalPersonelModel.fromJson(json.decode(str));

String totalPersonelModelToJson(TotalPersonelModel data) =>
    json.encode(data.toJson());

class TotalPersonelModel {
  TotalPersonelModel({
    required this.status,
    required this.data,
  });

  int status;
  int data;

  factory TotalPersonelModel.fromJson(Map<String, dynamic> json) =>
      TotalPersonelModel(
        status: json["status"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data,
      };
}

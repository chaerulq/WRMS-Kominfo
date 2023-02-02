// To parse this JSON data, do
//
//     final bebanKeeseluruhanModel = bebanKeeseluruhanModelFromJson(jsonString);

import 'dart:convert';

BebanKeeseluruhanModel bebanKeeseluruhanModelFromJson(String str) =>
    BebanKeeseluruhanModel.fromJson(json.decode(str));

String bebanKeeseluruhanModelToJson(BebanKeeseluruhanModel data) =>
    json.encode(data.toJson());

class BebanKeeseluruhanModel {
  BebanKeeseluruhanModel({
    required this.status,
    required this.data,
  });

  int status;
  Data data;

  factory BebanKeeseluruhanModel.fromJson(Map<String, dynamic> json) =>
      BebanKeeseluruhanModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.beban,
    required this.bg,
  });

  String beban;
  String bg;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        beban: json["beban"],
        bg: json["bg"],
      );

  Map<String, dynamic> toJson() => {
        "beban": beban,
        "bg": bg,
      };
}

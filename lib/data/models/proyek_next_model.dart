// To parse this JSON data, do
//
//     final proyekNextModel = proyekNextModelFromJson(jsonString);

import 'dart:convert';

ProyekNextModel proyekNextModelFromJson(String str) =>
    ProyekNextModel.fromJson(json.decode(str));

String proyekNextModelToJson(ProyekNextModel data) =>
    json.encode(data.toJson());

class ProyekNextModel {
  ProyekNextModel({
    required this.status,
    required this.data,
  });

  int status;
  Data data;

  factory ProyekNextModel.fromJson(Map<String, dynamic> json) =>
      ProyekNextModel(
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
    required this.pembangunan,
    required this.pengembangan,
  });

  List<Pembangunan> pembangunan;
  List<dynamic> pengembangan;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pembangunan: List<Pembangunan>.from(
            json["pembangunan"].map((x) => Pembangunan.fromJson(x))),
        pengembangan: List<dynamic>.from(json["pengembangan"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "pembangunan": List<dynamic>.from(pembangunan.map((x) => x.toJson())),
        "pengembangan": List<dynamic>.from(pengembangan.map((x) => x)),
      };
}

class Pembangunan {
  Pembangunan({
    required this.id,
    required this.idUsulan,
    required this.kodeOpd,
    required this.idAplikasi,
    required this.namaProjek,
    required this.desc,
    required this.createdAt,
    this.updatedAt,
    this.deletedAt,
    required this.kodeProjek,
    this.tglMulai,
    this.tglSelesai,
    required this.statusPengerjaan,
    required this.createdBy,
    this.publishedAt,
    this.thumbnail,
    required this.alias,
    this.thumbnailUsulan,
    required this.timeElapsed,
  });

  int id;
  int idUsulan;
  String kodeOpd;
  int idAplikasi;
  String namaProjek;
  String desc;
  DateTime createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  String kodeProjek;
  DateTime? tglMulai;
  DateTime? tglSelesai;
  int statusPengerjaan;
  String createdBy;
  dynamic publishedAt;
  dynamic thumbnail;
  String alias;
  String? thumbnailUsulan;
  TimeElapsed timeElapsed;

  factory Pembangunan.fromJson(Map<String, dynamic> json) => Pembangunan(
        id: json["id"],
        idUsulan: json["id_usulan"],
        kodeOpd: json["kode_opd"],
        idAplikasi: json["id_aplikasi"],
        namaProjek: json["nama_projek"],
        desc: json["desc"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        kodeProjek: json["kode_projek"],
        tglMulai: json["tgl_mulai"] == null
            ? null
            : DateTime.parse(json["tgl_mulai"]),
        tglSelesai: json["tgl_selesai"] == null
            ? null
            : DateTime.parse(json["tgl_selesai"]),
        statusPengerjaan: json["status_pengerjaan"],
        createdBy: json["created_by"],
        publishedAt: json["published_at"],
        thumbnail: json["thumbnail"],
        alias: json["alias"],
        thumbnailUsulan: json["thumbnail_usulan"],
        timeElapsed: TimeElapsed.fromJson(json["timeElapsed"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_usulan": idUsulan,
        "kode_opd": kodeOpd,
        "id_aplikasi": idAplikasi,
        "nama_projek": namaProjek,
        "desc": desc,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "kode_projek": kodeProjek,
        "tgl_mulai":
            "${tglMulai!.year.toString().padLeft(4, '0')}-${tglMulai!.month.toString().padLeft(2, '0')}-${tglMulai!.day.toString().padLeft(2, '0')}",
        "tgl_selesai":
            "${tglSelesai!.year.toString().padLeft(4, '0')}-${tglSelesai!.month.toString().padLeft(2, '0')}-${tglSelesai!.day.toString().padLeft(2, '0')}",
        "status_pengerjaan": statusPengerjaan,
        "created_by": createdBy,
        "published_at": publishedAt,
        "thumbnail": thumbnail,
        "alias": alias,
        "thumbnail_usulan": thumbnailUsulan,
        "timeElapsed": timeElapsed.toJson(),
      };
}

class TimeElapsed {
  TimeElapsed({
    required this.bg,
    required this.time,
  });

  String bg;
  String time;

  factory TimeElapsed.fromJson(Map<String, dynamic> json) => TimeElapsed(
        bg: json["bg"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "bg": bg,
        "time": time,
      };
}

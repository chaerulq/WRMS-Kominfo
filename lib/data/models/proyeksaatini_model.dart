import 'dart:convert';

Proyek? welcomeFromJson(String str) => Proyek.fromJson(json.decode(str));

String welcomeToJson(Proyek? data) => json.encode(data!.toJson());

class Proyek {
  Proyek({
    this.status,
    this.data,
  });

  int? status;
  Data? data;

  factory Proyek.fromJson(Map<String, dynamic> json) => Proyek(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.pembangunan,
    this.pengembangan,
  });

  List<Pembangunan?>? pembangunan;
  List<Pembangunan?>? pengembangan;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pembangunan: json["pembangunan"] == null
            ? []
            : List<Pembangunan?>.from(
                json["pembangunan"]!.map((x) => Pembangunan.fromJson(x))),
        pengembangan: json["pengembangan"] == null
            ? []
            : List<Pembangunan?>.from(
                json["pengembangan"]!.map((x) => Pembangunan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pembangunan": pembangunan == null
            ? []
            : List<dynamic>.from(pembangunan!.map((x) => x!.toJson())),
        "pengembangan": pengembangan == null
            ? []
            : List<dynamic>.from(pengembangan!.map((x) => x!.toJson())),
      };
}

class Pembangunan {
  Pembangunan({
    this.id,
    this.idUsulan,
    this.kodeOpd,
    this.idAplikasi,
    this.namaProjek,
    this.desc,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.kodeProjek,
    this.tglMulai,
    this.tglSelesai,
    this.statusPengerjaan,
    this.createdBy,
    this.publishedAt,
    this.thumbnail,
    this.timeElapsed,
  });

  int? id;
  int? idUsulan;
  String? kodeOpd;
  int? idAplikasi;
  String? namaProjek;
  String? desc;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  String? kodeProjek;
  DateTime? tglMulai;
  DateTime? tglSelesai;
  int? statusPengerjaan;
  String? createdBy;
  DateTime? publishedAt;
  dynamic thumbnail;
  TimeElapsed? timeElapsed;

  factory Pembangunan.fromJson(Map<String, dynamic> json) => Pembangunan(
        id: json["id"],
        idUsulan: json["id_usulan"],
        kodeOpd: json["kode_opd"],
        idAplikasi: json["id_aplikasi"],
        namaProjek: json["nama_projek"],
        desc: json["desc"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        kodeProjek: json["kode_projek"],
        tglMulai: DateTime.parse(json["tgl_mulai"]),
        tglSelesai: DateTime.parse(json["tgl_selesai"]),
        statusPengerjaan: json["status_pengerjaan"],
        createdBy: json["created_by"],
        publishedAt: json["published_at"],
        thumbnail: json["thumbnail"],
        timeElapsed: TimeElapsed.fromJson(json["timeElapsed"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_usulan": idUsulan,
        "kode_opd": kodeOpd,
        "id_aplikasi": idAplikasi,
        "nama_projek": namaProjek,
        "desc": desc,
        "created_at": createdAt?.toIso8601String(),
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
        "timeElapsed": timeElapsed!.toJson(),
      };
}

class TimeElapsed {
  TimeElapsed({
    this.bg,
    this.time,
  });

  Bg? bg;
  String? time;

  factory TimeElapsed.fromJson(Map<String, dynamic> json) => TimeElapsed(
        bg: bgValues!.map[json["bg"]],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "bg": bgValues.reverse![bg],
        "time": time,
      };
}

enum Bg { DANGER, WARNING, PRIMARY }

final bgValues = EnumValues(
    {"danger": Bg.DANGER, "primary": Bg.PRIMARY, "warning": Bg.WARNING});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

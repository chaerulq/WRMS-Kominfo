import 'dart:convert';

ProyekNowModel proyekNowModelFromJson(String str) =>
    ProyekNowModel.fromJson(json.decode(str));

String proyekNowModelToJson(ProyekNowModel data) => json.encode(data.toJson());

class ProyekNowModel {
  ProyekNowModel({
    required this.status,
    required this.data,
  });

  int status;
  Data data;

  factory ProyekNowModel.fromJson(Map<String, dynamic> json) => ProyekNowModel(
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
  List<Pembangunan> pengembangan;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pembangunan: List<Pembangunan>.from(
            json["pembangunan"].map((x) => Pembangunan.fromJson(x))),
        pengembangan: List<Pembangunan>.from(
            json["pengembangan"].map((x) => Pembangunan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pembangunan": List<dynamic>.from(pembangunan.map((x) => x.toJson())),
        "pengembangan": List<dynamic>.from(pengembangan.map((x) => x.toJson())),
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
    required this.updatedAt,
    this.deletedAt,
    required this.kodeProjek,
    required this.tglMulai,
    required this.tglSelesai,
    required this.statusPengerjaan,
    required this.createdBy,
    this.publishedAt,
    this.thumbnail,
    required this.timeElapsed,
    required this.progress,
  });

  int id;
  int idUsulan;
  String kodeOpd;
  int idAplikasi;
  String namaProjek;
  String desc;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String kodeProjek;
  DateTime tglMulai;
  DateTime tglSelesai;
  int statusPengerjaan;
  String createdBy;
  DateTime? publishedAt;
  dynamic thumbnail;
  TimeElapsed timeElapsed;
  dynamic progress;

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
        publishedAt: json["published_at"] == null
            ? null
            : DateTime.parse(json["published_at"]),
        thumbnail: json["thumbnail"],
        timeElapsed: TimeElapsed.fromJson(json["timeElapsed"]),
        progress: json["progress"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_usulan": idUsulan,
        "kode_opd": kodeOpd,
        "id_aplikasi": idAplikasi,
        "nama_projek": namaProjek,
        "desc": desc,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "kode_projek": kodeProjek,
        "tgl_mulai":
            "${tglMulai.year.toString().padLeft(4, '0')}-${tglMulai.month.toString().padLeft(2, '0')}-${tglMulai.day.toString().padLeft(2, '0')}",
        "tgl_selesai":
            "${tglSelesai.year.toString().padLeft(4, '0')}-${tglSelesai.month.toString().padLeft(2, '0')}-${tglSelesai.day.toString().padLeft(2, '0')}",
        "status_pengerjaan": statusPengerjaan,
        "created_by": createdBy,
        "published_at": publishedAt?.toIso8601String(),
        "thumbnail": thumbnail,
        "timeElapsed": timeElapsed.toJson(),
        "progress": progress,
      };
}

class TimeElapsed {
  TimeElapsed({
    required this.bg,
    required this.time,
  });

  Bg bg;
  String time;

  factory TimeElapsed.fromJson(Map<String, dynamic> json) => TimeElapsed(
        bg: bgValues.map[json["bg"]]!,
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "bg": bgValues.reverse[bg],
        "time": time,
      };
}

enum Bg { DANGER, WARNING, PRIMARY }

final bgValues = EnumValues(
    {"danger": Bg.DANGER, "primary": Bg.PRIMARY, "warning": Bg.WARNING});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

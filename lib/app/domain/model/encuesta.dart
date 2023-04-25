class Encuestas {
  Encuestas({
    this.openModal,
    this.dataEncuesta,
  });

  int? openModal;
  DataEncuesta? dataEncuesta;

  factory Encuestas.fromJson(dynamic json) => Encuestas(
        openModal: json["openModal"] as int?,
        dataEncuesta:
            json["data"] == false ? null : DataEncuesta.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "openModal": openModal,
        "data": dataEncuesta?.toJson(),
      };
}

class DataEncuesta {
  DataEncuesta({
    this.id,
    this.name,
    this.message,
    this.active,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? message;
  int? active;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory DataEncuesta.fromJson(Map<String, dynamic> json) => DataEncuesta(
        id: json["id"],
        name: json["name"],
        message: json["message"],
        active: json["active"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "message": message,
        "active": active,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

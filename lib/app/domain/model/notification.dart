class Notification {
  int? id;
  int? userId;
  String? tipo;
  int? itemId;
  String? mensaje;
  String? read;
  int? delete;

  Notification({
    this.id,
    this.userId,
    this.tipo,
    this.itemId,
    this.mensaje,
    this.read,
    this.delete,
  });

  factory Notification.fromJson(dynamic json) => Notification(
        id: json["id"] as int?,
        userId: json["user_id"] as int?,
        tipo: json["tipo"] as String?,
        itemId: json["item_id"] as int?,
        mensaje: json["mensaje"] as String?,
        read: json["read"] as String?,
        delete: json["delete"] as int?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "tipo": tipo,
        "item_id": itemId,
        "mensaje": mensaje,
        "read": read,
        "delete": delete,
      };
}

class Notification {
  int? id;
  int? userId;
  String? tipo;
  int? itemId;
  String? mensaje;
  String? read;
  String? elapsedTime;
  int? delete;
  dynamic dataNotification;
  String? externalLink;

  Notification({
    this.id,
    this.userId,
    this.tipo,
    this.itemId,
    this.mensaje,
    this.read,
    this.elapsedTime,
    this.delete,
    this.dataNotification,
    this.externalLink,
  });

  factory Notification.fromJson(dynamic json) => Notification(
    id: json["id"] as int?,
    userId: json["user_id"] as int?,
    tipo: json["tipo"] as String?,
    itemId: json["item_id"] as int?,
    mensaje: json["mensaje"] as String?,
    read: json["read"] as String?,
    elapsedTime: json["elapsed_time"] as String?,
    delete: json["delete"] as int?,
    dataNotification: json["data_notification"],
    externalLink: json["external_link"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "tipo": tipo,
    "item_id": itemId,
    "mensaje": mensaje,
    "read": read,
    "elapsed_time": elapsedTime,
    "delete": delete,
    "data_notification": dataNotification,
    "external_link": externalLink,
  };
}

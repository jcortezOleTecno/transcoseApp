class ReturnsCartModel {
  ReturnsCartModel({
    this.id,
    this.userId,
    this.codigoEmpresa,
    this.direccionRecogida,
    this.notasRecogidas,
    this.fechaSolicitud,
    this.status,
    this.createdAt,
    this.updateAt,
    this.items,
  });

  int? id;
  int? userId;
  String? codigoEmpresa;
  String? direccionRecogida;
  String? notasRecogidas;
  DateTime? fechaSolicitud;
  String? status;
  DateTime? createdAt;
  DateTime? updateAt;
  List<ItemsProductCartReturns>? items;

  factory ReturnsCartModel.fromJson(dynamic json) => ReturnsCartModel(
      id: json["id"] as int?,
      userId: json["user_id"] as int?,
      codigoEmpresa: json["codigo_empresa"] as String?,
      direccionRecogida: json["direccion_recogida"] as String?,
      notasRecogidas: json["notas_recogidas"] as String?,
      fechaSolicitud: json["fecha_solicitud"] == null ? null : DateTime.parse(json["fecha_solicitud"]),
      status: json["status"] as String?,
      createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
      updateAt: json["update_at"] == null ? null : DateTime.parse(json["update_at"]),
      items: (json["items"] as List).map(ItemsProductCartReturns.fromJson).toList(),
  );

  ReturnsCartModel.fromMap(Map snapshot) :
        id = snapshot['id'],
        userId = snapshot['user_id'],
        codigoEmpresa = snapshot['codigo_empresa'] ?? '',
        direccionRecogida = snapshot['direccion_recogida'] ?? '',
        notasRecogidas = snapshot['notas_recogidas'] ?? '',
        fechaSolicitud = snapshot["fecha_solicitud"] == null ? null : DateTime.parse(snapshot["fecha_solicitud"]),
        status = snapshot['stfcmtoken'] ?? '',
        createdAt = snapshot["created_at"] == null ? null : DateTime.parse(snapshot["created_at"]),
        updateAt = snapshot["update_at"] == null ? null : DateTime.parse(snapshot["update_at"]),
        items = (snapshot["items"] as List).map(ItemsProductCartReturns.fromJson).toList()
  ;

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "codigo_empresa": codigoEmpresa,
        "direccion_recogida": direccionRecogida,
        "notas_recogidas": notasRecogidas,
        "fecha_solicitud":"${fechaSolicitud!.year.toString().padLeft(4, '0')}-${fechaSolicitud!.month.toString().padLeft(2, '0')}-${fechaSolicitud!.day.toString().padLeft(2, '0')}",
        "status": status,
        "created_at":"${createdAt!.year.toString().padLeft(4, '0')}-${createdAt!.month.toString().padLeft(2, '0')}-${createdAt!.day.toString().padLeft(2, '0')}",
        "update_at":"${updateAt!.year.toString().padLeft(4, '0')}-${updateAt!.month.toString().padLeft(2, '0')}-${updateAt!.day.toString().padLeft(2, '0')}",
      };
}

class ItemsProductCartReturns {
  ItemsProductCartReturns({
    this.id,
    this.orderReturnId,
    this.codigoAlbaran,
    this.referencia,
    this.descripcion,
    this.cantidad,
    this.albaran,
    this.createdAt,
    this.updateAt,
  });

  int? id;
  int? orderReturnId;
  String? codigoAlbaran;
  String? referencia;
  String? descripcion;
  String? cantidad;
  String? albaran;
  DateTime? createdAt;
  DateTime? updateAt;

  factory ItemsProductCartReturns.fromJson(dynamic json) => ItemsProductCartReturns(
    id: json["id"] as int?,
    orderReturnId: json["order_return_id"] as int?,
    codigoAlbaran: json["codigo_albaran"] as String?,
    referencia: json["referencia"] as String?,
    descripcion: json["descripcion"] as String?,
    cantidad: json["cantidad"] as String?,
    albaran: json["albaran"] as String?,
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updateAt: json["update_at"] == null ? null : DateTime.parse(json["update_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_return_id": orderReturnId,
    "codigo_albaran": codigoAlbaran,
    "referencia": referencia,
    "descripcion": descripcion,
    "cantidad": cantidad,
    "albaran": albaran,
    "created_at":"${createdAt!.year.toString().padLeft(4, '0')}-${createdAt!.month.toString().padLeft(2, '0')}-${createdAt!.day.toString().padLeft(2, '0')}",
    "update_at":"${updateAt!.year.toString().padLeft(4, '0')}-${updateAt!.month.toString().padLeft(2, '0')}-${updateAt!.day.toString().padLeft(2, '0')}",
  };
}

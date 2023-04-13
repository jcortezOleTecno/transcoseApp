class Albaran {
  Albaran({
    this.ejercicio,
    this.cliente,
    this.contador,
    this.documento,
    this.fecha,
    this.almacen,
    this.modoEntrega,
    this.tipoAlbaran,
    this.cargoAbono,
    this.facturado,
    this.totalImporte,
    this.id,
  });

  int? ejercicio;
  int? cliente;
  String? contador;
  int? documento;
  DateTime? fecha;
  String? almacen;
  String? modoEntrega;
  String? tipoAlbaran;
  String? cargoAbono;
  String? facturado;
  double? totalImporte;
  String? id;

  factory Albaran.fromJson(dynamic json) => Albaran(
        ejercicio: json["ejercicio"] as int?,
        cliente: json["cliente"] as int?,
        contador: json["contador"] as String?,
        documento: json["documento"] as int?,
        fecha: json["fecha"] == null ? null : DateTime.parse(json["fecha"]),
        almacen: json["almacen"] as String?,
        modoEntrega: json["modo_entrega"] as String?,
        tipoAlbaran: json["tipo_albaran"] as String?,
        cargoAbono: json["cargo_abono"] as String?,
        facturado: json["facturado"] as String?,
        totalImporte: json["total_importe"]?.toDouble() as double?,
        id: json["id"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "ejercicio": ejercicio,
        "cliente": cliente,
        "contador": contador,
        "documento": documento,
        "fecha":
            "${fecha!.year.toString().padLeft(4, '0')}-${fecha!.month.toString().padLeft(2, '0')}-${fecha!.day.toString().padLeft(2, '0')}",
        "almacen": almacen,
        "modo_entrega": modoEntrega,
        "tipo_albaran": tipoAlbaran,
        "cargo_abono": cargoAbono,
        "facturado": facturado,
        "total_importe": totalImporte,
        "id": id,
      };
}

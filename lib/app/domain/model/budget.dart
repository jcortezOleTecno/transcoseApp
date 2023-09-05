class Budget {
  Budget({
    this.fecha,
    this.fechaCaducidad,
    this.estado,
    this.permiteFirma,
    this.firmado,
    this.numero,
    this.asunto,
    this.codigoPresupuesto,
    this.version,
    this.importe,
    this.tieneCrd,
    this.crdId,
    this.crdFirmado,
  });

  String? fecha;
  String? fechaCaducidad;
  String? estado;
  bool? permiteFirma;
  bool? firmado;
  String? numero;
  String? asunto;
  int? codigoPresupuesto;
  int? version;
  double? importe;
  bool? tieneCrd;
  int? crdId;
  bool? crdFirmado;

  Budget copyWith({
    String? fecha,
    String? fechaCaducidad,
    String? estado,
    bool? permiteFirma,
    bool? firmado,
    String? numero,
    String? asunto,
    int? codigoPresupuesto,
    int? version,
    double? importe,
    bool? tieneCrd,
    int? crdId,
    bool? crdFirmado,
  }) =>
      Budget(
        fecha: fecha ?? this.fecha,
        fechaCaducidad: fechaCaducidad ?? this.fechaCaducidad,
        estado: estado ?? this.estado,
        permiteFirma: permiteFirma ?? this.permiteFirma,
        firmado: firmado ?? this.firmado,
        numero: numero ?? this.numero,
        asunto: asunto ?? this.asunto,
        codigoPresupuesto: codigoPresupuesto ?? this.codigoPresupuesto,
        version: version ?? this.version,
        importe: importe ?? this.importe,
        tieneCrd: tieneCrd ?? this.tieneCrd,
        crdId: crdId ?? this.crdId,
        crdFirmado: crdFirmado ?? this.crdFirmado,
      );

  factory Budget.fromJson(dynamic json) => Budget(
        fecha: json["fecha"] as String?,
        fechaCaducidad: json["fecha_caducidad"] as String?,
        estado: json["estado"] as String?,
        permiteFirma: json["permite_firma"] as bool?,
        firmado: json["firmado"] as bool?,
        numero: json["numero"] as String?,
        asunto: json["asunto"] as String?,
        codigoPresupuesto: json["codigo_presupuesto"] as int?,
        version: json["version"] as int?,
        importe: json["importe"]?.toDouble() as double?,
        tieneCrd: json["tiene_crd"] as bool?,
        crdId: json["crd_id"] as int?,
        crdFirmado: json["crd_firmado"] as bool?,
      );

  Map<String, dynamic> toJson() => {
        "fecha": fecha,
        "fecha_caducidad": fechaCaducidad,
        "estado": estado,
        "permite_firma": permiteFirma,
        "firmado": firmado,
        "numero": numero,
        "asunto": asunto,
        "codigo_presupuesto": codigoPresupuesto,
        "version": version,
        "importe": importe,
        "tiene_crd": tieneCrd,
        "crd_id": crdId,
        "crd_firmado": crdFirmado,
      };

  String toFilter() => {
        "fecha": fecha,
        "fecha_caducidad": fechaCaducidad,
        "estado": estado,
        "firmado": firmado,
        "numero": numero,
        "asunto": asunto,
        "codigo_presupuesto": codigoPresupuesto,
        "version": version,
        "importe": importe,
      }.toString();
}

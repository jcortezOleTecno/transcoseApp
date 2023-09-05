class BudgetDetail {
  BudgetDetail({
    this.codigo,
    this.asunto,
    this.activo,
    this.condicionesGenereles,
    this.condicionesEspecificas,
    this.fecha,
    this.fechaValidez,
    this.version,
    this.importeSatMontaje,
    this.importeSatTransporte,
    this.importeNeto,
    this.baseImponible,
    this.importeIva,
    this.descuento,
    this.lineasPresupuesto,
    this.transporteIncluido,
    this.montajeIncluido,
    this.permiteFirma,
    this.firmado,
    this.fechaFirma,
    this.quienFirma,
    this.nifQuienFirma,
  });

  int? codigo;
  String? asunto;
  bool? activo;
  String? condicionesGenereles;
  String? condicionesEspecificas;
  String? fecha;
  String? fechaValidez;
  int? version;
  int? importeSatMontaje;
  int? importeSatTransporte;
  String? importeNeto;
  String? baseImponible;
  String? importeIva;
  String? descuento;
  List<LineasPresupuesto>? lineasPresupuesto;
  bool? transporteIncluido;
  bool? montajeIncluido;
  bool? permiteFirma;
  bool? firmado;
  String? fechaFirma;
  String? quienFirma;
  String? nifQuienFirma;

  factory BudgetDetail.fromJson(dynamic json) => BudgetDetail(
        codigo: json["codigo"] as int?,
        asunto: json["asunto"] as String?,
        activo: json["activo"] as bool?,
        condicionesGenereles: json["condiciones_genereles"] as String?,
        condicionesEspecificas: json["condiciones_especificas"] as String?,
        fecha: json["fecha"] as String?,
        fechaValidez: json["fecha_validez"] as String?,
        version: json["version"] as int?,
        importeSatMontaje: json["importe_sat_montaje"] as dynamic,
        importeSatTransporte: json["importe_sat_transporte"] as dynamic,
        importeNeto: json["importe_neto"] as String?,
        baseImponible: json["base_imponible"] as String?,
        importeIva: json["importe_iva"] as String?,
        descuento: json["descuento"] as String?,
        lineasPresupuesto: json["lineas_presupuesto"] == null
            ? []
            : List<LineasPresupuesto>.from(json["lineas_presupuesto"]!
                .map((x) => LineasPresupuesto.fromJson(x))),
        transporteIncluido: json["transporte_incluido"] as bool?,
        montajeIncluido: json["montaje_incluido"] as bool?,
        permiteFirma: json["permite_firma"] as bool?,
        firmado: json["firmado"] as bool?,
        fechaFirma: json["fecha_firma"] as String?,
        quienFirma: json["quien_firma"] as String?,
        nifQuienFirma: json["nif_quien_firma"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "codigo": codigo,
        "asunto": asunto,
        "activo": activo,
        "condiciones_genereles": condicionesGenereles,
        "condiciones_especificas": condicionesEspecificas,
        "fecha": fecha,
        "fecha_validez": fechaValidez,
        "version": version,
        "importe_sat_montaje": importeSatMontaje,
        "importe_sat_transporte": importeSatTransporte,
        "importe_neto": importeNeto,
        "base_imponible": baseImponible,
        "importe_iva": importeIva,
        "descuento": descuento,
        "lineas_presupuesto": lineasPresupuesto == null
            ? []
            : List<dynamic>.from(lineasPresupuesto!.map((x) => x.toJson())),
        "transporte_incluido": transporteIncluido,
        "montaje_incluido": montajeIncluido,
        "permite_firma": permiteFirma,
        "firmado": firmado,
        "fecha_firma": fechaFirma,
        "quien_firma": quienFirma,
        "nif_quien_firma": nifQuienFirma,
      };
}

class LineasPresupuesto {
  LineasPresupuesto({
    this.orden,
    this.referencia,
    this.url,
    this.descripcionBreve,
    this.descripcion,
    this.cantidad,
    this.importeNeto,
  });

  int? orden;
  String? referencia;
  String? url;
  String? descripcionBreve;
  String? descripcion;
  int? cantidad;
  String? importeNeto;

  factory LineasPresupuesto.fromJson(Map<String, dynamic> json) =>
      LineasPresupuesto(
        orden: json["orden"],
        referencia: json["referencia"],
        url: json["url"],
        descripcionBreve: json["descripcion_breve"],
        descripcion: json["descripcion"],
        cantidad: json["cantidad"],
        importeNeto: json["importe_neto"],
      );

  Map<String, dynamic> toJson() => {
        "orden": orden,
        "referencia": referencia,
        "url": url,
        "descripcion_breve": descripcionBreve,
        "descripcion": descripcion,
        "cantidad": cantidad,
        "importe_neto": importeNeto,
      };

  String toFilter() => {
        "orden": orden,
        "referencia": referencia,
        "url": url,
        "descripcion_breve": descripcionBreve,
        "cantidad": cantidad,
        "importe_neto": importeNeto,
      }.toString();
}

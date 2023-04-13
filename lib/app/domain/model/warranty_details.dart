class WarrantyDetailModel {
  WarrantyDetailModel({
    this.codigoGarantia,
    this.fecha,
    this.numero,
    this.centroReparto,
    this.estadoSustitucion,
    this.estadoTramitacion,
    this.importeVemare,
    this.importeCliente,
    this.visar,
    this.firmado,
    this.quienFirma,
    this.nifQuienFirma,
    this.fechaFirma,
    this.notasNoFirmaCliente,
    this.referencias,
  });

  int? codigoGarantia;
  String? fecha;
  int? numero;
  String? centroReparto;
  String? estadoSustitucion;
  String? estadoTramitacion;
  String? importeVemare;
  String? importeCliente;
  String? visar;
  String? firmado;
  String? quienFirma;
  String? nifQuienFirma;
  DateTime? fechaFirma;
  String? notasNoFirmaCliente;
  List<Referencia>? referencias;

  factory WarrantyDetailModel.fromJson(Map<String, dynamic> json) =>
      WarrantyDetailModel(
        codigoGarantia: json["codigo_garantia"] as int?,
        fecha: json["fecha"] as String?,
        numero: json["numero"] as int?,
        centroReparto: json["centro_reparto"] as String?,
        estadoSustitucion: json["estado_sustitucion"] as String?,
        estadoTramitacion: json["estado_tramitacion"] as String?,
        importeVemare: json["importe_vemare"] as String?,
        importeCliente: json["importe_cliente"] as String?,
        visar: json["visar"] as String?,
        firmado: json["firmado"] as String?,
        quienFirma: json["quien_firma"] as String?,
        nifQuienFirma: json["nif_quien_firma"] as String?,
        fechaFirma: json["fecha_firma"] == null
            ? null
            : DateTime.parse(json["fecha_firma"]),
        notasNoFirmaCliente: json["notas_no_firma_cliente"] as String?,
        referencias: json["referencias"] == null
            ? []
            : List<Referencia>.from(
                json["referencias"]!.map((x) => Referencia.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "codigo_garantia": codigoGarantia,
        "fecha": fecha,
        "numero": numero,
        "centro_reparto": centroReparto,
        "estado_sustitucion": estadoSustitucion,
        "estado_tramitacion": estadoTramitacion,
        "importe_vemare": importeVemare,
        "importe_cliente": importeCliente,
        "visar": visar,
        "firmado": firmado,
        "quien_firma": quienFirma,
        "nif_quien_firma": nifQuienFirma,
        "fecha_firma":
            "${fechaFirma!.year.toString().padLeft(4, '0')}-${fechaFirma!.month.toString().padLeft(2, '0')}-${fechaFirma!.day.toString().padLeft(2, '0')}",
        "notas_no_firma_cliente": notasNoFirmaCliente,
        "referencias": referencias == null
            ? []
            : List<dynamic>.from(referencias!.map((x) => x.toJson())),
      };
}

class Referencia {
  Referencia({
    this.referencia,
    this.descripcion,
    this.familia,
    this.marca,
    this.cantidad,
    this.importeNeto,
  });

  String? referencia;
  String? descripcion;
  String? familia;
  String? marca;
  int? cantidad;
  String? importeNeto;

  factory Referencia.fromJson(Map<String, dynamic> json) => Referencia(
        referencia: json["referencia"],
        descripcion: json["descripcion"],
        familia: json["familia"],
        marca: json["marca"],
        cantidad: json["cantidad"],
        importeNeto: json["importe_neto"],
      );

  Map<String, dynamic> toJson() => {
        "referencia": referencia,
        "descripcion": descripcion,
        "familia": familia,
        "marca": marca,
        "cantidad": cantidad,
        "importe_neto": importeNeto,
      };
}

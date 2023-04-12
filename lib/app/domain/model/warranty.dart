class Warranty {
  Warranty({
    this.fechaAlta,
    this.numero,
    this.codigoGarantia,
    this.centroReparto,
    this.firmado,
    this.estadoSu,
    this.estadoTr,
    this.quienFirma,
    this.nifQuienFirma,
    this.fechaFirma,
    this.visar,
    this.importe,
    this.linea,
    this.color,
  });

  DateTime? fechaAlta;
  int? numero;
  int? codigoGarantia;
  String? centroReparto;
  String? firmado;
  String? estadoSu;
  String? estadoTr;
  String? quienFirma;
  String? nifQuienFirma;
  String? fechaFirma;
  String? visar;
  String? importe;
  String? linea;
  String? color;

  factory Warranty.fromJson(dynamic json) => Warranty(
        fechaAlta: json["fecha_alta"] == null
            ? null
            : DateTime.parse(json["fecha_alta"]),
        numero: json["numero"] as int?,
        codigoGarantia: json["codigo_garantia"] as int?,
        centroReparto: json["centro_reparto"] as String?,
        firmado: json["firmado"] as String?,
        estadoSu: json["estado_su"] as String?,
        estadoTr: json["estado_tr"] as String?,
        quienFirma: json["quien_firma"] as String?,
        nifQuienFirma: json["nif_quien_firma"] as String?,
        fechaFirma: json["fecha_firma"] as String?,
        visar: json["visar"] as String?,
        importe: json["importe"] as String?,
        linea: json["linea"] as String?,
        color: json["color"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "fecha_alta":
            "${fechaAlta!.year.toString().padLeft(4, '0')}-${fechaAlta!.month.toString().padLeft(2, '0')}-${fechaAlta!.day.toString().padLeft(2, '0')}",
        "numero": numero,
        "codigo_garantia": codigoGarantia,
        "centro_reparto": centroReparto,
        "firmado": firmado,
        "estado_su": estadoSu,
        "estado_tr": estadoTr,
        "quien_firma": quienFirma,
        "nif_quien_firma": nifQuienFirma,
        "fecha_firma": fechaFirma,
        "visar": visar,
        "importe": importe,
        "linea": linea,
        "color": color,
      };
}

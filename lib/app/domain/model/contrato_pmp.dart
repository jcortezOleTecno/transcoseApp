class ContratoPmp {
  ContratoPmp({
    this.codigoContrato,
    this.fechaInicio,
    this.fechaFin,
    this.fechaFirma,
    this.firmado,
    this.firmaPersonaquefirma,
    this.nifPersonaquefirma,
    this.fechaBaja,
  });

  int? codigoContrato;
  String? fechaInicio;
  String? fechaFin;
  String? fechaFirma;
  bool? firmado;
  String? firmaPersonaquefirma;
  String? nifPersonaquefirma;
  String? fechaBaja;

  factory ContratoPmp.fromJson(dynamic json) => ContratoPmp(
        codigoContrato: json["codigo_contrato"] as int?,
        fechaInicio: json["fecha_inicio"] as String?,
        fechaFin: json["fecha_fin"] as String?,
        fechaFirma: json["fecha_firma"] as String?,
        firmado: json["firmado"] as bool?,
        firmaPersonaquefirma: json["firma_personaquefirma"] as String?,
        nifPersonaquefirma: json["nif_personaquefirma"] as String?,
        fechaBaja: json["fecha_baja"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "codigo_contrato": codigoContrato,
        "fecha_inicio": fechaInicio,
        "fecha_fin": fechaFin,
        "fecha_firma": fechaFirma,
        "firmado": firmado,
        "firma_personaquefirma": firmaPersonaquefirma,
        "nif_personaquefirma": nifPersonaquefirma,
        "fecha_baja": fechaBaja,
      };
}

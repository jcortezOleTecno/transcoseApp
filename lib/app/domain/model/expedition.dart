class Expedicion {
  Expedicion({
    this.fechaEntrega,
    this.estadoTxt,
    this.estadoCod,
    this.conFirma,
  });

  String? fechaEntrega;
  String? estadoTxt;
  int? estadoCod;
  String? conFirma;

  factory Expedicion.fromJson(Map<String, dynamic> json) => Expedicion(
        fechaEntrega: json["fecha_entrega"],
        estadoTxt: json["estado_txt"],
        estadoCod: json["estado_cod"],
        conFirma: json["con_firma"],
      );

  Map<String, dynamic> toJson() => {
        "fecha_entrega": fechaEntrega,
        "estado_txt": estadoTxt,
        "estado_cod": estadoCod,
        "con_firma": conFirma,
      };
}

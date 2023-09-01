class ContratDetail {
  ContratDetail({
    this.codigoContrato,
    this.numeroProyecto,
    this.fechaCreacionContrato,
    this.tipoContrato,
    this.datosContrato,
    this.firmado,
    this.representanteLegal,
    this.nifRepresentante,
    this.fechaFirma,
  });

  int? codigoContrato;
  String? numeroProyecto;
  String? fechaCreacionContrato;
  String? tipoContrato;
  DatosContrato? datosContrato;
  bool? firmado;
  String? representanteLegal;
  String? nifRepresentante;
  String? fechaFirma;

  factory ContratDetail.fromJson(dynamic json) => ContratDetail(
        codigoContrato: json["codigo_contrato"] as int?,
        numeroProyecto: json["numero_proyecto"] as String?,
        fechaCreacionContrato: json["fecha_creacion_contrato"] as String?,
        tipoContrato: json["tipo_contrato"] as String?,
        datosContrato: json["datos_contrato"] == null
            ? null
            : DatosContrato.fromJson(json["datos_contrato"]),
        firmado: json["firmado"] as bool?,
        representanteLegal: json["representante_legal"] as String?,
        nifRepresentante: json["nif_representante"] as String?,
        fechaFirma: json["fecha_firma"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "codigo_contrato": codigoContrato,
        "numero_proyecto": numeroProyecto,
        "fecha_creacion_contrato": fechaCreacionContrato,
        "tipo_contrato": tipoContrato,
        "datos_contrato": datosContrato?.toJson(),
        "firmado": firmado,
        "representante_legal": representanteLegal,
        "nif_representante": nifRepresentante,
        "fecha_firma": fechaFirma,
      };
}

class DatosContrato {
  DatosContrato({
    this.nombreRepresentante,
    this.dniRepresentante,
    this.fechaAceptado,
    this.plazoEntrega,
    this.nombreTaller,
    this.cifTaller,
    this.domicilioSocial,
    this.registroContrato,
    this.tomoRegistro,
    this.folioRegistro,
    this.hojaRegistro,
    this.precioTotal,
    this.entregaCuenta,
    this.numMensualidades,
    this.importeMensualidad,
  });

  String? nombreRepresentante;
  String? dniRepresentante;
  String? fechaAceptado;
  String? plazoEntrega;
  String? nombreTaller;
  String? cifTaller;
  String? domicilioSocial;
  String? registroContrato;
  String? tomoRegistro;
  String? folioRegistro;
  String? hojaRegistro;
  String? precioTotal;
  String? entregaCuenta;
  String? numMensualidades;
  String? importeMensualidad;

  factory DatosContrato.fromJson(Map<String, dynamic> json) => DatosContrato(
        nombreRepresentante: json["nombre_representante"],
        dniRepresentante: json["dni_representante"],
        fechaAceptado: json["fecha_aceptado"],
        plazoEntrega: json["plazo_entrega"],
        nombreTaller: json["nombre_taller"],
        cifTaller: json["cif_taller"],
        domicilioSocial: json["domicilio_social"],
        registroContrato: json["registro_contrato"],
        tomoRegistro: json["tomo_registro"],
        folioRegistro: json["folio_registro"],
        hojaRegistro: json["hoja_registro"],
        precioTotal: json["precio_total"],
        entregaCuenta: json["entrega_cuenta"],
        numMensualidades: json["num_mensualidades"],
        importeMensualidad: json["importe_mensualidad"],
      );

  Map<String, dynamic> toJson() => {
        "nombre_representante": nombreRepresentante,
        "dni_representante": dniRepresentante,
        "fecha_aceptado": fechaAceptado,
        "plazo_entrega": plazoEntrega,
        "nombre_taller": nombreTaller,
        "cif_taller": cifTaller,
        "domicilio_social": domicilioSocial,
        "registro_contrato": registroContrato,
        "tomo_registro": tomoRegistro,
        "folio_registro": folioRegistro,
        "hoja_registro": hojaRegistro,
        "precio_total": precioTotal,
        "entrega_cuenta": entregaCuenta,
        "num_mensualidades": numMensualidades,
        "importe_mensualidad": importeMensualidad,
      };
}

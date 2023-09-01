class ContratPmpDetail {
  ContratPmpDetail({
    this.codigoContrato,
    this.fechaInicio,
    this.fechaFin,
    this.fechaFirma,
    this.firmado,
    this.personaFirma,
    this.nifPersonafirma,
    this.fechaBaja,
    this.importeTotal,
    this.descuento,
    this.importeFinal,
    this.cuotaInicial,
    this.cuotaMensual,
    this.numeroCuotas,
    this.maquinas,
    this.servicions,
    this.documentoFirmado,
  });

  int? codigoContrato;
  String? fechaInicio;
  String? fechaFin;
  String? fechaFirma;
  String? firmado;
  String? personaFirma;
  String? nifPersonafirma;
  String? fechaBaja;
  String? importeTotal;
  String? descuento;
  String? importeFinal;
  String? cuotaInicial;
  String? cuotaMensual;
  int? numeroCuotas;
  List<Maquina>? maquinas;
  List<Servicion>? servicions;
  DocumentoFirmado? documentoFirmado;

  factory ContratPmpDetail.fromJson(dynamic json) => ContratPmpDetail(
        codigoContrato: json["codigo_contrato"] as int?,
        fechaInicio: json["fecha_inicio"] as String?,
        fechaFin: json["fecha_fin"] as String?,
        fechaFirma: json["fecha_firma"] as String?,
        firmado: json["firmado"] as String?,
        personaFirma: json["persona_firma"] as String?,
        nifPersonafirma: json["nif_personafirma"] as String?,
        fechaBaja: json["fecha_baja"] as String?,
        importeTotal: json["importe_total"] as String?,
        descuento: json["descuento"] as String?,
        importeFinal: json["importe_final"] as String?,
        cuotaInicial: json["cuota_inicial"] as String?,
        cuotaMensual: json["cuota_mensual"] as String?,
        numeroCuotas: json["numero_cuotas"] as int?,
        maquinas: json["maquinas"] == null
            ? []
            : List<Maquina>.from(
                json["maquinas"]!.map((x) => Maquina.fromJson(x))),
        servicions: json["servicions"] == null
            ? []
            : List<Servicion>.from(
                json["servicions"]!.map((x) => Servicion.fromJson(x))),
        documentoFirmado: json["documento_firmado"] == null
            ? null
            : DocumentoFirmado.fromJson(json["documento_firmado"]),
      );

  Map<String, dynamic> toJson() => {
        "codigo_contrato": codigoContrato,
        "fecha_inicio": fechaInicio,
        "fecha_fin": fechaFin,
        "fecha_firma": fechaFirma,
        "firmado": firmado,
        "persona_firma": personaFirma,
        "nif_personafirma": nifPersonafirma,
        "fecha_baja": fechaBaja,
        "importe_total": importeTotal,
        "descuento": descuento,
        "importe_final": importeFinal,
        "cuota_inicial": cuotaInicial,
        "cuota_mensual": cuotaMensual,
        "numero_cuotas": numeroCuotas,
        "maquinas": maquinas == null
            ? []
            : List<dynamic>.from(maquinas!.map((x) => x.toJson())),
        "servicions": servicions == null
            ? []
            : List<dynamic>.from(servicions!.map((x) => x.toJson())),
        "documento_firmado": documentoFirmado?.toJson(),
      };
}

class DocumentoFirmado {
  DocumentoFirmado({
    this.codigoDocumento,
    this.nombre,
    this.descripcion,
    this.anio,
  });

  int? codigoDocumento;
  String? nombre;
  String? descripcion;
  int? anio;

  factory DocumentoFirmado.fromJson(Map<String, dynamic> json) =>
      DocumentoFirmado(
        codigoDocumento: json["codigo_documento"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        anio: json["anio"],
      );

  Map<String, dynamic> toJson() => {
        "codigo_documento": codigoDocumento,
        "nombre": nombre,
        "descripcion": descripcion,
        "anio": anio,
      };
}

class Maquina {
  Maquina({
    this.marca,
    this.modelo,
    this.numeroSerie,
    this.anioFabricacion,
    this.pmp,
    this.numeroPmp,
    this.tipoEquipoTaller,
    this.fiPmp,
    this.ffPmp,
  });

  String? marca;
  String? modelo;
  String? numeroSerie;
  int? anioFabricacion;
  String? pmp;
  String? numeroPmp;
  String? tipoEquipoTaller;
  String? fiPmp;
  String? ffPmp;

  factory Maquina.fromJson(Map<String, dynamic> json) => Maquina(
        marca: json["marca"],
        modelo: json["modelo"],
        numeroSerie: json["numero_serie"],
        anioFabricacion: json["anio_fabricacion"],
        pmp: json["pmp"],
        numeroPmp: json["numero_pmp"],
        tipoEquipoTaller: json["tipo_equipo_taller"],
        fiPmp: json["fi_pmp"],
        ffPmp: json["ff_pmp"],
      );

  Map<String, dynamic> toJson() => {
        "marca": marca,
        "modelo": modelo,
        "numero_serie": numeroSerie,
        "anio_fabricacion": anioFabricacion,
        "pmp": pmp,
        "numero_pmp": numeroPmp,
        "tipo_equipo_taller": tipoEquipoTaller,
        "fi_pmp": fiPmp,
        "ff_pmp": ffPmp,
      };
  String toFilter() => {
        "marca": marca,
        "modelo": modelo,
        "numero_serie": numeroSerie,
        "anio_fabricacion": anioFabricacion.toString(),
        "pmp": pmp,
        "numero_pmp": numeroPmp,
        "tipo_equipo_taller": tipoEquipoTaller,
        "fi_pmp": fiPmp,
        "ff_pmp": ffPmp,
      }.toString();
}

class Servicion {
  Servicion({
    this.nombre,
    this.importeMantenimiento,
    this.importeReparacion,
    this.importeAveria,
  });

  String? nombre;
  double? importeMantenimiento;
  double? importeReparacion;
  double? importeAveria;

  factory Servicion.fromJson(Map<String, dynamic> json) => Servicion(
        nombre: json["nombre"],
        importeMantenimiento: json["importe_mantenimiento"]?.toDouble(),
        importeReparacion: json["importe_reparacion"]?.toDouble(),
        importeAveria: json["importe_averia"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "importe_mantenimiento": importeMantenimiento,
        "importe_reparacion": importeReparacion,
        "importe_averia": importeAveria,
      };
  String toFilter() => {
        "nombre": nombre,
        "importe_mantenimiento": importeMantenimiento,
        "importe_reparacion": importeReparacion,
        "importe_averia": importeAveria,
      }.toString();
}

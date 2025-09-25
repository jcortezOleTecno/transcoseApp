class Intervenciones {
  Intervenciones({
    this.codigoIntervencion,
    this.fechaIntervencion,
    this.asuntoIntervencion,
    this.fechaPlanificacion,
    this.horaPlanificacion,
    this.numero,
    this.fechaCierreIntervencion,
    this.numeroAlbaran,
    this.enGarantia,
    this.numeroGarantia,
    this.fechaLlegadaMaterial,
    this.fechaSalidaProveedor,
    this.fechaSalidaCliente,
    this.taller,
    this.tipoAgrupacion,
    this.situacion,
    this.tipoIntervencion,
    this.marcaIntervencion,
  });

  int? codigoIntervencion;
  String? fechaIntervencion;
  String? asuntoIntervencion;
  String? fechaPlanificacion;
  String? horaPlanificacion;
  String? numero;
  String? fechaCierreIntervencion;
  String? numeroAlbaran;
  bool? enGarantia;
  String? numeroGarantia;
  String? fechaLlegadaMaterial;
  String? fechaSalidaProveedor;
  String? fechaSalidaCliente;
  String? taller;
  String? tipoAgrupacion;
  String? situacion;
  String? tipoIntervencion;
  String? marcaIntervencion;

  factory Intervenciones.fromJson(dynamic json) => Intervenciones(
    codigoIntervencion: json["codigo_intervencion"] as int?,
    fechaIntervencion: json["fecha_intervencion"] as String?,
    asuntoIntervencion: json["asunto_intervencion"] as String?,
    fechaPlanificacion: json["fecha_planificacion"] as String?,
    horaPlanificacion: json["hora_planificacion"] as String?,
    numero: json["numero"] as String?,
    fechaCierreIntervencion: json["fecha_cierre_intervencion"] as String?,
    numeroAlbaran: json["numero_albaran"] as String?,
    enGarantia: json["en_garantia"] as bool?,
    numeroGarantia: json["numero_garantia"].toString() as String?,
    fechaLlegadaMaterial: json["fecha_llegada_material"] as String?,
    fechaSalidaProveedor: json["fecha_salida_proveedor"] as String?,
    fechaSalidaCliente: json["fecha_salida_cliente"] as String?,
    taller: json["taller"] as String?,
    tipoAgrupacion: json["tipo_agrupacion"] as String?,
    situacion: json["situacion"] as String?,
    tipoIntervencion: json["tipo_intervencion"] as String?,
    marcaIntervencion: json["marca_intervencion"] as String?,
  );

  Map<String, dynamic> toJson() => {
    "codigo_intervencion": codigoIntervencion,
    "fecha_intervencion": fechaIntervencion,
    "asunto_intervencion": asuntoIntervencion,
    "fecha_planificacion": fechaPlanificacion,
    "hora_planificacion": horaPlanificacion,
    "numero": numero,
    "fecha_cierre_intervencion": fechaCierreIntervencion,
    "numero_albaran": numeroAlbaran,
    "en_garantia": enGarantia,
    "numero_garantia": numeroGarantia,
    "fecha_llegada_material": fechaLlegadaMaterial,
    "fecha_salida_proveedor": fechaSalidaProveedor,
    "fecha_salida_cliente": fechaSalidaCliente,
    "taller": taller,
    "tipo_agrupacion": tipoAgrupacion,
    "situacion": situacion,
    "tipo_intervencion": tipoIntervencion,
    "marca_intervencion": marcaIntervencion,
  };

  String toFilter() => {
    "codigo_intervencion": codigoIntervencion,
    "fecha_intervencion": fechaIntervencion,
    "asunto_intervencion": asuntoIntervencion,
    // "numero": numero,
    "fecha_cierre_intervencion": fechaCierreIntervencion,
    // "numero_albaran": numeroAlbaran,
    // "en_garantia": enGarantia,
    // "numero_garantia": numeroGarantia,
    // "fecha_llegada_material": fechaLlegadaMaterial,
    // "fecha_salida_proveedor": fechaSalidaProveedor,
    // "fecha_salida_cliente": fechaSalidaCliente,
    "taller": taller,
    // "tipo_agrupacion": tipoAgrupacion,
    // "situacion": situacion,
    "tipo_intervencion": tipoIntervencion,
    // "marca_intervencion": marcaIntervencion,
  }.toString();
}

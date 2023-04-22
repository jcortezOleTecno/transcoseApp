class IntervencionesDetalle {
  IntervencionesDetalle({
    this.codigoIntervencion,
    this.clasificacion,
    this.fechaPlanificacion,
    this.horaPlanificacion,
    this.numero,
    this.asunto,
    this.trabajoRealizado,
    this.materialUtilizado,
    this.observaciones,
    this.firmado,
    this.fechaCargo,
    this.albaran,
    this.fechaCierre,
    this.enGarantia,
    this.numeroGarantia,
    this.fechaLlegadaMaterial,
    this.fechaSalidaProveedor,
    this.fechaSalidaCliente,
    this.marcaIntervencion,
    this.maquinas,
    this.materiales,
  });

  int? codigoIntervencion;
  String? clasificacion;
  String? fechaPlanificacion;
  String? horaPlanificacion;
  String? numero;
  String? asunto;
  String? trabajoRealizado;
  String? materialUtilizado;
  String? observaciones;
  String? firmado;
  String? fechaCargo;
  String? albaran;
  String? fechaCierre;
  bool? enGarantia;
  String? numeroGarantia;
  String? fechaLlegadaMaterial;
  String? fechaSalidaProveedor;
  String? fechaSalidaCliente;
  String? marcaIntervencion;
  List<MaquinaInt>? maquinas;
  List<dynamic>? materiales;

  factory IntervencionesDetalle.fromJson(Map<String, dynamic> json) =>
      IntervencionesDetalle(
        codigoIntervencion: json["codigo_intervencion"] as int?,
        clasificacion: json["clasificacion"] as String?,
        fechaPlanificacion: json["fecha_planificacion"] as String?,
        horaPlanificacion: json["hora_planificacion"] as String?,
        numero: json["numero"] as String?,
        asunto: json["asunto"] as String?,
        trabajoRealizado: json["trabajo_realizado"] as String?,
        materialUtilizado: json["material_utilizado"] as String?,
        observaciones: json["observaciones"] as String?,
        firmado: json["firmado"] as String?,
        fechaCargo: json["fecha_cargo"] as String?,
        albaran: json["albaran"] as String?,
        fechaCierre: json["fecha_cierre"] as String?,
        enGarantia: json["en_garantia"] as bool?,
        numeroGarantia: json["numero_garantia"] as String?,
        fechaLlegadaMaterial: json["fecha_llegada_material"] as String?,
        fechaSalidaProveedor: json["fecha_salida_proveedor"] as String?,
        fechaSalidaCliente: json["fecha_salida_cliente"] as String?,
        marcaIntervencion: json["marca_intervencion"] as String?,
        maquinas: json["maquinas"] == null
            ? []
            : List<MaquinaInt>.from(
                json["maquinas"]!.map((x) => MaquinaInt.fromJson(x))),
        materiales: json["materiales"] == null
            ? []
            : List<dynamic>.from(json["materiales"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "codigo_intervencion": codigoIntervencion,
        "clasificacion": clasificacion,
        "fecha_planificacion": fechaPlanificacion,
        "hora_planificacion": horaPlanificacion,
        "numero": numero,
        "asunto": asunto,
        "trabajo_realizado": trabajoRealizado,
        "material_utilizado": materialUtilizado,
        "observaciones": observaciones,
        "firmado": firmado,
        "fecha_cargo": fechaCargo,
        "albaran": albaran,
        "fecha_cierre": fechaCierre,
        "en_garantia": enGarantia,
        "numero_garantia": numeroGarantia,
        "fecha_llegada_material": fechaLlegadaMaterial,
        "fecha_salida_proveedor": fechaSalidaProveedor,
        "fecha_salida_cliente": fechaSalidaCliente,
        "marca_intervencion": marcaIntervencion,
        "maquinas": maquinas == null
            ? []
            : List<dynamic>.from(maquinas!.map((x) => x.toJson())),
        "materiales": materiales == null
            ? []
            : List<dynamic>.from(materiales!.map((x) => x)),
      };
}

class MaquinaInt {
  MaquinaInt({
    this.codigoMaquina,
    this.marca,
    this.modelo,
    this.numeroSerie,
    this.anioFabricacion,
    this.garantia,
    this.fiGarantia,
    this.ffGarantia,
    this.pmp,
    this.fiPmp,
    this.ffPmp,
    this.numeroPmp,
    this.tipoEquipoTaller,
  });

  int? codigoMaquina;
  String? marca;
  String? modelo;
  String? numeroSerie;
  int? anioFabricacion;
  String? garantia;
  String? fiGarantia;
  String? ffGarantia;
  String? pmp;
  String? fiPmp;
  String? ffPmp;
  String? numeroPmp;
  String? tipoEquipoTaller;

  factory MaquinaInt.fromJson(Map<String, dynamic> json) => MaquinaInt(
        codigoMaquina: json["codigo_maquina"],
        marca: json["marca"],
        modelo: json["modelo"],
        numeroSerie: json["numero_serie"],
        anioFabricacion: json["anio_fabricacion"],
        garantia: json["garantia"],
        fiGarantia: json["fi_garantia"],
        ffGarantia: json["ff_garantia"],
        pmp: json["pmp"],
        fiPmp: json["fi_pmp"],
        ffPmp: json["ff_pmp"],
        numeroPmp: json["numero_pmp"],
        tipoEquipoTaller: json["tipo_equipo_taller"],
      );

  Map<String, dynamic> toJson() => {
        "codigo_maquina": codigoMaquina,
        "marca": marca,
        "modelo": modelo,
        "numero_serie": numeroSerie,
        "anio_fabricacion": anioFabricacion,
        "garantia": garantia,
        "fi_garantia": fiGarantia,
        "ff_garantia": ffGarantia,
        "pmp": pmp,
        "fi_pmp": fiPmp,
        "ff_pmp": ffPmp,
        "numero_pmp": numeroPmp,
        "tipo_equipo_taller": tipoEquipoTaller,
      };
}

class SatForms {
  SatForms({
    this.tipoFormulario,
    this.datosFormulario,
  });

  String? tipoFormulario;
  DatosFormulario? datosFormulario;

  factory SatForms.fromJson(dynamic json) => SatForms(
        tipoFormulario: json["tipo_formulario"] as String?,
        datosFormulario: json["datos_formulario"] == null
            ? null
            : DatosFormulario.fromJson(json["datos_formulario"]),
      );

  Map<String, dynamic> toJson() => {
        "tipo_formulario": tipoFormulario,
        "datos_formulario": datosFormulario?.toJson(),
      };
}

class DatosFormulario {
  DatosFormulario({
    this.area,
    this.tipoMaquina,
    this.marca,
    this.modelo,
    this.numeroSerie,
    this.resumenAveria,
    this.tipoAveria,
    this.codCliente,
    this.razonSocial,
    this.poblacion,
    this.persona,
    this.telefono,
    this.email,
    this.fechaCita,
    this.franjaHoraria,
    this.cif,
  });

  SatInput? area;
  SatInput? tipoMaquina;
  SatInput? marca;
  SatInput? modelo;
  SatInput? numeroSerie;
  SatInput? resumenAveria;
  SatInput? tipoAveria;
  SatInput? codCliente;
  SatInput? razonSocial;
  SatInput? poblacion;
  SatInput? persona;
  SatInput? telefono;
  SatInput? email;
  SatInput? fechaCita;
  SatInput? franjaHoraria;
  SatInput? cif;

  factory DatosFormulario.fromJson(Map<String, dynamic> json) =>
      DatosFormulario(
        area: json["area"] == null ? null : SatInput.fromJson(json["area"]),
        tipoMaquina: json["tipo_maquina"] == null
            ? null
            : SatInput.fromJson(json["tipo_maquina"]),
        marca: json["marca"] == null ? null : SatInput.fromJson(json["marca"]),
        modelo:
            json["modelo"] == null ? null : SatInput.fromJson(json["modelo"]),
        numeroSerie: json["numero_serie"] == null
            ? null
            : SatInput.fromJson(json["numero_serie"]),
        resumenAveria: json["resumen_averia"] == null
            ? null
            : SatInput.fromJson(json["resumen_averia"]),
        tipoAveria: json["tipo_averia"] == null
            ? null
            : SatInput.fromJson(json["tipo_averia"]),
        codCliente: json["cod_cliente"] == null
            ? null
            : SatInput.fromJson(json["cod_cliente"]),
        razonSocial: json["razon_social"] == null
            ? null
            : SatInput.fromJson(json["razon_social"]),
        poblacion: json["poblacion"] == null
            ? null
            : SatInput.fromJson(json["poblacion"]),
        persona:
            json["persona"] == null ? null : SatInput.fromJson(json["persona"]),
        telefono: json["telefono"] == null
            ? null
            : SatInput.fromJson(json["telefono"]),
        email: json["email"] == null ? null : SatInput.fromJson(json["email"]),
        fechaCita: json["fecha_cita"] == null
            ? null
            : SatInput.fromJson(json["fecha_cita"]),
        franjaHoraria: json["franja_horaria"] == null
            ? null
            : SatInput.fromJson(json["franja_horaria"]),
        cif: json["cif"] == null ? null : SatInput.fromJson(json["cif"]),
      );

  Map<String, dynamic> toJson() => {
        "area": area?.toJson(),
        "tipo_maquina": tipoMaquina?.toJson(),
        "marca": marca?.toJson(),
        "modelo": modelo?.toJson(),
        "numero_serie": numeroSerie?.toJson(),
        "resumen_averia": resumenAveria?.toJson(),
        "tipo_averia": tipoAveria?.toJson(),
        "cod_cliente": codCliente?.toJson(),
        "razon_social": razonSocial?.toJson(),
        "poblacion": poblacion?.toJson(),
        "persona": persona?.toJson(),
        "telefono": telefono?.toJson(),
        "email": email?.toJson(),
        "fecha_cita": fechaCita?.toJson(),
        "franja_horaria": franjaHoraria?.toJson(),
        "cif": cif?.toJson(),
      };
}

class SatInput {
  SatInput({
    this.label,
    this.orden,
    this.visible,
    this.requerido,
    this.tipo,
    this.valores,
    this.valorDefault,
  });

  String? label;
  String? orden;
  bool? visible;
  bool? requerido;
  String? tipo;
  List<String>? valores;
  String? valorDefault;

  factory SatInput.fromJson(dynamic json) => SatInput(
        label: json["label"] as String?,
        orden: json["orden"] as String?,
        visible: json["visible"] == 'True',
        requerido: json["requerido"] == 'True',
        tipo: json["tipo"] as String?,
        valores: (json["valores"] == "" || json["valores"] == null)
            ? []
            : List<String>.from(json["valores"]?.map((x) => x)),
        valorDefault: json["valor_default"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "orden": orden,
        "visible": visible,
        "requerido": requerido,
        "tipo": tipo,
        "valores": valores,
        "valor_default": valorDefault,
      };
}

List<SatInput> convertToSatInputList(List<dynamic> originalList) {
  List<SatInput> newList = [];
  for (var item in originalList) {
    Map<String, dynamic> itemMap = Map<String, dynamic>.from(item ?? '');
    SatInput newItem = SatInput(
      label: itemMap['label'],
      orden: itemMap['orden'],
      visible: itemMap['visible'] == 'True',
      requerido: itemMap['requerido'] == 'True',
      tipo: itemMap['tipo'],
      valores: List<String>.from(itemMap['valores']),
      valorDefault: itemMap['valor_default'],
    );
    newList.add(newItem);
  }
  return newList;
}

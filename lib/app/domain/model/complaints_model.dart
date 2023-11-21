class ComplaintsModel {
  ComplaintsModel({
    this.codigoTipoContacto,
    this.nombre,
    this.anonimo,
    this.orden,
  });

  int? codigoTipoContacto;
  String? nombre;
  bool? anonimo;
  int? orden;

  factory ComplaintsModel.fromJson(dynamic json) => ComplaintsModel(
      codigoTipoContacto: json["codigo_tipo_contacto"] as int?,
      nombre: json["nombre"] as String?,
      anonimo: json["anonimo"] as bool?,
      orden: json["orden"] as int?,
  );

  Map<String, dynamic> toJson() => {
        "codigo_tipo_contacto": codigoTipoContacto,
        "nombre": nombre,
        "anonimo": anonimo,
        "orden": orden,
      };
}

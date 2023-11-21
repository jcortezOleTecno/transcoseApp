class ComplaintsCategoriesModel {
  ComplaintsCategoriesModel({
    this.codigoCategoria,
    this.nombre,
    this.orden,
  });

  int? codigoCategoria;
  String? nombre;
  int? orden;

  factory ComplaintsCategoriesModel.fromJson(dynamic json) => ComplaintsCategoriesModel(
    codigoCategoria: json["codigo_categoria"] as int?,
      nombre: json["nombre"] as String?,
      orden: json["orden"] as int?,
  );

  Map<String, dynamic> toJson() => {
        "codigo_categoria": codigoCategoria,
        "nombre": nombre,
        "orden": orden,
      };
}

class AlbaranProductModel {
  AlbaranProductModel({
    this.referencia,
    this.descripcion,
    this.cantidad,
    this.albaran,
  });

  String? referencia;
  String? descripcion;
  int? cantidad;
  String? albaran;

  factory AlbaranProductModel.fromJson(dynamic json) => AlbaranProductModel(
      referencia: json["referencia"] as String?,
      descripcion: json["descripcion"] as String?,
      cantidad: json["cantidad"] as int?,
      albaran: json["albaran"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "referencia": referencia,
        "descripcion": descripcion,
        "albaran": albaran,
        "cantidad": cantidad,
      };

  String toFilter() => {
        "referencia": referencia,
        "descripcion": descripcion,
        "albaran": albaran,
        "cantidad": cantidad,
      }.toString();
}

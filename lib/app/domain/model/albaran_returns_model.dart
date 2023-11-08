class AlbaranReturnsModel {
  AlbaranReturnsModel({
    this.codigoAlbaran,
    this.ejercicio,
    this.albaran,
    this.cliente,
    this.fechaDocumento,
    this.horaDocumento,
  });

  int? codigoAlbaran;
  int? ejercicio;
  String? albaran;
  String? cliente;
  String? fechaDocumento;
  String? horaDocumento;

  factory AlbaranReturnsModel.fromJson(dynamic json) => AlbaranReturnsModel(
      codigoAlbaran: json["codigo_albaran"] as int?,
      ejercicio: json["ejercicio"] as int?,
      albaran: json["albaran"] as String?,
      cliente: json["cliente"] as String?,
      fechaDocumento: json["fecha_documento"] as String?,
      horaDocumento: json["hora_documento"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "codigo_albaran": codigoAlbaran,
        "ejercicio": ejercicio,
        "albaran": albaran,
        "cliente": cliente,
        "fecha_documento": fechaDocumento,
        "hora_documento": horaDocumento,
      };

  String toFilter() => {
        "codigo_albaran": codigoAlbaran,
        "ejercicio": ejercicio,
        "albaran": albaran,
        "cliente": cliente,
        "fecha_documento": fechaDocumento,
        "hora_documento": horaDocumento,
      }.toString();
}

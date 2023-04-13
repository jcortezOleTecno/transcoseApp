class AlbaranDetails {
  AlbaranDetails({
    this.contador,
    this.documento,
    this.linea,
    this.referencia,
    this.cantidad,
    this.descripcionReferencia,
  });

  String? contador;
  int? documento;
  int? linea;
  String? referencia;
  int? cantidad;
  String? descripcionReferencia;

  factory AlbaranDetails.fromJson(dynamic json) => AlbaranDetails(
        contador: json["contador"] as String?,
        documento: json["documento"] as int?,
        linea: json["linea"] as int?,
        referencia: json["referencia"] as String?,
        cantidad: json["cantidad"] as int?,
        descripcionReferencia: json["descripcion_referencia"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "contador": contador,
        "documento": documento,
        "linea": linea,
        "referencia": referencia,
        "cantidad": cantidad,
        "descripcion_referencia": descripcionReferencia,
      };
}

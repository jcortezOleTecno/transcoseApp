class Contrats {
  Contrats({
    this.fecha,
    this.firmado,
    this.codigoContrato,
    this.numeroProyecto,
    this.proyectoFirmado,
    this.asunto,
    this.fechaPresupuesto,
    this.versionPresupuesto,
    this.importePresupuesto,
    this.fechaFirma,
    this.representanteLegal,
    this.nifRepresentante,
  });

  String? fecha;
  bool? firmado;
  int? codigoContrato;
  String? numeroProyecto;
  bool? proyectoFirmado;
  String? asunto;
  String? fechaPresupuesto;
  int? versionPresupuesto;
  String? importePresupuesto;
  String? fechaFirma;
  String? representanteLegal;
  String? nifRepresentante;

  factory Contrats.fromJson(dynamic json) => Contrats(
        fecha: json["fecha"] as String?,
        firmado: json["firmado"] as bool?,
        codigoContrato: json["codigo_contrato"] as int?,
        numeroProyecto: json["numero_proyecto"] as String?,
        proyectoFirmado: json["proyecto_firmado"] as bool?,
        asunto: json["asunto"] as String?,
        fechaPresupuesto: json["fecha_presupuesto"] as String?,
        versionPresupuesto: json["version_presupuesto"] as int?,
        importePresupuesto: json["importe_presupuesto"] as String?,
        fechaFirma: json["fecha_firma"] as String?,
        representanteLegal: json["representante_legal"] as String?,
        nifRepresentante: json["nif_representante"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "fecha": fecha,
        "firmado": firmado,
        "codigo_contrato": codigoContrato,
        "numero_proyecto": numeroProyecto,
        "proyecto_firmado": proyectoFirmado,
        "asunto": asunto,
        "fecha_presupuesto": fechaPresupuesto,
        "version_presupuesto": versionPresupuesto,
        "importe_presupuesto": importePresupuesto,
        "fecha_firma": fechaFirma,
        "representante_legal": representanteLegal,
        "nif_representante": nifRepresentante,
      };

  String toFilter() => {
        "fecha": fecha,
        "firmado": firmado! ? "FIRMADO" : "NO FIRMADO",
        "codigo_contrato": codigoContrato,
        "numero_proyecto": numeroProyecto,
        "proyecto_firmado": proyectoFirmado! ? "FIRMADO" : "NO FIRMADO",
        "asunto": asunto,
        "fecha_presupuesto": fechaPresupuesto,
        "version_presupuesto": versionPresupuesto,
        "importe_presupuesto": importePresupuesto,
        "fecha_firma": fechaFirma,
        "representante_legal": representanteLegal,
        "nif_representante": nifRepresentante,
      }.toString();
}

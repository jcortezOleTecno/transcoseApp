class ContratoRappel {
  ContratoRappel({
    this.codigoContrato,
    this.nombre,
    this.email,
    this.fechaFirma,
    this.firmado,
    this.firmaPersonaquefirma,
    this.nifPersonaquefirma,
    this.notasCliente,
    this.clientesContrato,
    this.documentosFirmados,
  });

  int? codigoContrato;
  String? nombre;
  String? email;
  String? fechaFirma;
  String? firmado;
  String? firmaPersonaquefirma;
  String? nifPersonaquefirma;
  String? notasCliente;
  String? clientesContrato;
  List<DocumentosFirmado>? documentosFirmados;

  factory ContratoRappel.fromJson(dynamic json) => ContratoRappel(
        codigoContrato: json["codigo_contrato"] as int?,
        nombre: json["nombre"] as String?,
        email: json["email"] as String?,
        fechaFirma: json["fecha_firma"] as String?,
        firmado: json["firmado"] as String?,
        firmaPersonaquefirma: json["firma_personaquefirma"] as String?,
        nifPersonaquefirma: json["nif_personaquefirma"] as String?,
        notasCliente: json["notas_cliente"] as String?,
        clientesContrato: json["clientes_contrato"] as String?,
        documentosFirmados: json["documentos_firmados"] == null
            ? []
            : List<DocumentosFirmado>.from(json["documentos_firmados"]!
                .map((x) => DocumentosFirmado.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "codigo_contrato": codigoContrato,
        "nombre": nombre,
        "email": email,
        "fecha_firma": fechaFirma,
        "firmado": firmado,
        "firma_personaquefirma": firmaPersonaquefirma,
        "nif_personaquefirma": nifPersonaquefirma,
        "notas_cliente": notasCliente,
        "clientes_contrato": clientesContrato,
        "documentos_firmados": documentosFirmados == null
            ? []
            : List<dynamic>.from(documentosFirmados!.map((x) => x.toJson())),
      };
}

class DocumentosFirmado {
  DocumentosFirmado({
    this.codigoDocumento,
    this.nombre,
    this.descripcion,
    this.anio,
  });

  int? codigoDocumento;
  String? nombre;
  String? descripcion;
  int? anio;

  factory DocumentosFirmado.fromJson(Map<String, dynamic> json) =>
      DocumentosFirmado(
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

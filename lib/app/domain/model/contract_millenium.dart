import 'package:vemare/app/domain/model/contrato_rappel.dart';

class ContratoMillenium {
  ContratoMillenium({
    this.codigoContrato,
    this.nombre,
    this.movil,
    this.email,
    this.pack,
    this.valorServicios,
    this.objetivoTotal,
    this.cuotaMensual,
    this.cuotaAnual,
    this.cuotaAnualDevolver,
    this.fechaInicio,
    this.fechaFin,
    this.fechaBaja,
    this.fechaFirma,
    this.firmado,
    this.firmaPersonaquefirma,
    this.nifPersonaquefirma,
    this.notasCliente,
    this.clientesContrato,
    this.porcentajeConsecucion,
    this.serviciosContratados,
    this.documentosFirmados,
  });

  int? codigoContrato;
  String? nombre;
  String? movil;
  String? email;
  String? pack;
  String? valorServicios;
  String? objetivoTotal;
  String? cuotaMensual;
  String? cuotaAnual;
  String? cuotaAnualDevolver;
  String? fechaInicio;
  String? fechaFin;
  String? fechaBaja;
  String? fechaFirma;
  String? firmado;
  String? firmaPersonaquefirma;
  String? nifPersonaquefirma;
  String? notasCliente;
  String? clientesContrato;
  String? porcentajeConsecucion;
  List<ServiciosContratado>? serviciosContratados;
  List<DocumentosFirmado>? documentosFirmados;

  factory ContratoMillenium.fromJson(dynamic json) => ContratoMillenium(
        codigoContrato: json["codigo_contrato"] as int?,
        nombre: json["nombre"] as String?,
        movil: json["movil"] as String?,
        email: json["email"] as String?,
        pack: json["pack"] as String?,
        valorServicios: json["valor_servicios"] as String?,
        objetivoTotal: json["objetivo_total"] as String?,
        cuotaMensual: json["cuota_mensual"] as String?,
        cuotaAnual: json["cuota_anual"] as String?,
        cuotaAnualDevolver: json["cuota_anual_devolver"] as String?,
        fechaInicio: json["fecha_inicio"] as String?,
        fechaFin: json["fecha_fin"] as String?,
        fechaBaja: json["fecha_baja"] as String?,
        fechaFirma: json["fecha_firma"] as String?,
        firmado: json["firmado"] as String?,
        firmaPersonaquefirma: json["firma_personaquefirma"] as String?,
        nifPersonaquefirma: json["nif_personaquefirma"] as String?,
        notasCliente: json["notas_cliente"] as String?,
        clientesContrato: json["clientes_contrato"] as String?,
        porcentajeConsecucion: json["porcentaje_consecucion"] as String?,
        serviciosContratados: json["servicios_contratados"] == null
            ? []
            : List<ServiciosContratado>.from(json["servicios_contratados"]!
                .map((x) => ServiciosContratado.fromJson(x))),
        documentosFirmados: json["documentos_firmados"] == null
            ? []
            : List<DocumentosFirmado>.from(json["documentos_firmados"]!
                .map((x) => DocumentosFirmado.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "codigo_contrato": codigoContrato,
        "nombre": nombre,
        "movil": movil,
        "email": email,
        "pack": pack,
        "valor_servicios": valorServicios,
        "objetivo_total": objetivoTotal,
        "cuota_mensual": cuotaMensual,
        "cuota_anual": cuotaAnual,
        "cuota_anual_devolver": cuotaAnualDevolver,
        "fecha_inicio": fechaInicio,
        "fecha_fin": fechaFin,
        "fecha_baja": fechaBaja,
        "fecha_firma": fechaFirma,
        "firmado": firmado,
        "firma_personaquefirma": firmaPersonaquefirma,
        "nif_personaquefirma": nifPersonaquefirma,
        "notas_cliente": notasCliente,
        "clientes_contrato": clientesContrato,
        "porcentaje_consecucion": porcentajeConsecucion,
        "servicios_contratados": serviciosContratados == null
            ? []
            : List<dynamic>.from(serviciosContratados!.map((x) => x.toJson())),
        "documentos_firmados": documentosFirmados == null
            ? []
            : List<dynamic>.from(documentosFirmados!.map((x) => x.toJson())),
      };
}

// class DocumentosFirmado {
//   DocumentosFirmado({
//     this.codigoDocumento,
//     this.nombre,
//     this.descripcion,
//     this.anio,
//   });

//   int? codigoDocumento;
//   String? nombre;
//   String? descripcion;
//   int? anio;

//   factory DocumentosFirmado.fromJson(Map<String, dynamic> json) =>
//       DocumentosFirmado(
//         codigoDocumento: json["codigo_documento"],
//         nombre: json["nombre"],
//         descripcion: json["descripcion"],
//         anio: json["anio"],
//       );

//   Map<String, dynamic> toJson() => {
//         "codigo_documento": codigoDocumento,
//         "nombre": nombre,
//         "descripcion": descripcion,
//         "anio": anio,
//       };
// }

class ServiciosContratado {
  ServiciosContratado({
    this.servicio,
    this.servicioDelPack,
    this.codigo,
    this.valor,
    this.cantidad,
    this.tipoSeleccion,
    this.fechaInicioServicio,
    this.tieneFirmaRgpd,
    this.formatoContratoRgpd,
    this.tipoServicio,
    this.maxAsistentesCliente,
  });

  String? servicio;
  String? servicioDelPack;

  String? codigo;
  String? valor;
  int? cantidad;
  String? tipoSeleccion;
  String? tipoServicio;
  int? maxAsistentesCliente;
  String? fechaInicioServicio;
  String? tieneFirmaRgpd;
  dynamic formatoContratoRgpd;

  factory ServiciosContratado.fromJson(Map<String, dynamic> json) =>
      ServiciosContratado(
        servicio: json["servicio"],
        servicioDelPack: (json["servicio_del_pack"] as bool) ? "SI" : "NO",
        codigo: json["codigo"],
        valor: json["valor"],
        cantidad: json["cantidad"],
        tipoSeleccion: json["tipo_seleccion"],
        tipoServicio: json["tipo_servicio"],
        maxAsistentesCliente: json["max_asistentes_cliente"],
        fechaInicioServicio: json["fecha_inicio_servicio"],
        tieneFirmaRgpd: (json["tiene_firma_rgpd"] as bool) ? "SI" : "NO",
        formatoContratoRgpd: json["formato_contrato_rgpd"],
      );

  Map<String, dynamic> toJson() => {
        "servicio": servicio,
        "servicio_del_pack": servicioDelPack,
        "codigo": codigo,
        "valor": valor,
        "cantidad": cantidad,
        "tipo_seleccion": tipoSeleccion,
        "fecha_inicio_servicio": fechaInicioServicio,
        "tiene_firma_rgpd": tieneFirmaRgpd,
        "formato_contrato_rgpd": formatoContratoRgpd,
        "tipo_servicio": tipoServicio,
        "max_asistentes_cliente": maxAsistentesCliente,
      };

  String toFilter() => {
        "servicio": servicio,
        "servicio_del_pack": servicioDelPack,
        "codigo": codigo,
        "valor": valor,
        "cantidad": cantidad.toString(),
        "tipo_seleccion": tipoSeleccion,
        "fecha_inicio_servicio": fechaInicioServicio,
        "tiene_firma_rgpd": tieneFirmaRgpd,
        "tipo_servicio": tipoServicio,
        "max_asistentes_cliente": maxAsistentesCliente,
      }.toString();
}

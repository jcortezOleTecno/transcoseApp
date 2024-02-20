import 'package:vemare/app/domain/model/contrato_rappel.dart';

class ContratoConventionsModel {
  ContratoConventionsModel({
    this.codigoContrato,
    this.convencion,
    this.codConvencion,
    this.nombre,
    this.movil,
    this.email,
    this.fechaInicio,
    this.fechaBaja,
    this.fechaFirma,
    this.firmado,
    this.firmaPersonaquefirma,
    this.nifPersonaquefirma,
    this.notasCliente,
    this.clientesContrato,
    this.serviciosContratados,
    this.documentosFirmados,
    this.estado,
  });

  int? codigoContrato;
  String? convencion;
  String? codConvencion;
  String? nombre;
  String? movil;
  String? email;
  String? fechaInicio;
  String? fechaBaja;
  String? fechaFirma;
  String? firmado;
  String? firmaPersonaquefirma;
  String? nifPersonaquefirma;
  String? notasCliente;
  String? clientesContrato;
  List<ServiciosContratado>? serviciosContratados;
  List<DocumentosFirmado>? documentosFirmados;
  String? estado;

  factory ContratoConventionsModel.fromJson(dynamic json) => ContratoConventionsModel(
        codigoContrato: json["codigo_contrato"] as int?,
        convencion: json["convencion"] as String?,
        codConvencion: json["cod_convencion"] as String?,
        nombre: json["nombre"] as String?,
        movil: json["movil"] as String?,
        email: json["email"] as String?,
        fechaInicio: json["fecha_inicio"] as String?,
        fechaBaja: json["fecha_baja"] as String?,
        fechaFirma: json["fecha_firma"] as String?,
        firmado: json["firmado"] as String?,
        firmaPersonaquefirma: json["firma_personaquefirma"] as String?,
        nifPersonaquefirma: json["nif_personaquefirma"] as String?,
        notasCliente: json["notas_cliente"] as String?,
        clientesContrato: json["clientes_contrato"] as String?,
        serviciosContratados: json["servicios_contratados"] == null
            ? [] : List<ServiciosContratado>.from(json["servicios_contratados"]!.map((x) => ServiciosContratado.fromJson(x))),
        documentosFirmados: json["documentos_firmados"] == null
            ? [] : List<DocumentosFirmado>.from(json["documentos_firmados"]! .map((x) => DocumentosFirmado.fromJson(x))),
        estado: json["estado"] as String?,
      );
}

class ServiciosContratado {
  ServiciosContratado({
    this.servicio,
    this.codigo,
    this.cantidad,
    this.plazasServicio,
  });

  String? servicio;
  String? codigo;
  int? cantidad;
  int? plazasServicio;

  factory ServiciosContratado.fromJson(Map<String, dynamic> json){
    return ServiciosContratado(
      servicio: json["servicio"] ?? '',
      codigo: json["codigo"] ?? '',
      cantidad: json["cantidad"] ?? 0,
      plazasServicio: json["plazas_servicio"] ?? 0,
    );
  }

  String toFilter() => {
    "servicio": servicio,
    "codigo": codigo,
    "cantidad": cantidad.toString(),
    "plazas_servicio": plazasServicio.toString(),
  }.toString();
}

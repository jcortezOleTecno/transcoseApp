import 'package:intl/intl.dart';
import 'package:vemare/app/domain/utils/money_formatter.dart';

class AlbaranISI {
  AlbaranISI({
    required this.albaran,
    required this.fecha,
    required this.fechaDevolucion,
    required this.total,
    required this.estado,
    required this.lineas,
    required this.cliente,
    required this.contador,
    required this.documento,
    required this.ejercicio,
    required this.typeDoc,
    required this.importe,
  });

  String albaran;
  DateTime fecha;
  DateTime fechaDevolucion;
  double total;
  String estado;
  String cliente;
  String contador;
  String documento;
  String ejercicio;
  String typeDoc;
  double importe;
  List<LineasAlbaran> lineas;

  factory AlbaranISI.fromJson(dynamic json) => AlbaranISI(
    albaran: json["alb_albaran"] ?? '',
    fecha: DateTime.parse(json["alb_fecdoc"] ?? '2025-01-01'),
    fechaDevolucion: DateTime.parse(json["alb_fecdoc"] ?? '2025-01-01'),
    total: double.parse(json["alb_totimp"].toString() ?? '0'),
    estado: json["alb_facturado"] ?? 'NO FACTURADO',
    cliente: json["alb_cli"].toString(),
    contador: json["alb_cont"] ?? '',
    documento: json["alb_docum"].toString(),
    ejercicio: json["alb_ejr"].toString(),
    typeDoc: json["alb_tipo"] ?? '',
    importe: double.parse(json["alb_totimp"].toString() ?? '0'),
    lineas: (json["lineas"] as List).isEmpty ? [] : (json["lineas"] as List).map((e) => LineasAlbaran.fromJson(e)).toList(),
  );

  String toFilter() => {
    "albaran": albaran,
    "fecha": DateFormat.yMd('es').format(fecha),
    "fechaDevolucion": DateFormat.yMd('es').format(fechaDevolucion),
    "alb_totimp": fmf.copyWith(amount: total).output.symbolOnRight,
  }.toString();
}

class LineasAlbaran {
  LineasAlbaran({
    required this.description,
    required this.referencia,
    required this.lineaEstado,
    required this.cant,
    required this.cantidadTotal,
    required this.canAbonado,
    required this.importe,
  });

  String description;
  String referencia;
  String lineaEstado;
  int cant;
  int cantidadTotal;
  int canAbonado;
  double importe;

  factory LineasAlbaran.fromJson(dynamic json){

    int cantBase = int.parse(json["can"].toString() ?? '0');
    int abon = json["can_abonado"].toString().isEmpty ? 0 : int.parse(json["can_abonado"].toString());
    if(abon < 0){
      abon = (-1) * abon;
    }
    int total = cantBase - abon;

    return LineasAlbaran(
      description: json["refer"] ?? '',
      referencia: json["descri"] ?? '',
      lineaEstado: json["linea_estado"] ?? '',
      cant: cantBase,
      canAbonado: abon,
      cantidadTotal: total,
      importe: double.parse(json["imp_linea"].toString() ?? '0'),
    );
  }
}

class Albaran {
  Albaran({
    this.ejercicio,
    this.cliente,
    this.contador,
    this.documento,
    this.fecha,
    this.almacen,
    this.modoEntrega,
    this.tipoAlbaran,
    this.cargoAbono,
    this.facturado,
    this.totalImporte,
    this.id,
  });

  int? ejercicio;
  int? cliente;
  String? contador;
  int? documento;
  DateTime? fecha;
  String? almacen;
  String? modoEntrega;
  String? tipoAlbaran;
  String? cargoAbono;
  String? facturado;
  double? totalImporte;
  String? id;

  factory Albaran.fromJson(dynamic json) => Albaran(
        ejercicio: json["ejercicio"] as int?,
        cliente: json["cliente"] as int?,
        contador: json["contador"] as String?,
        documento: json["documento"] as int?,
        fecha: json["fecha"] == null ? null : DateTime.parse(json["fecha"]),
        almacen: json["almacen"] as String?,
        modoEntrega: json["modo_entrega"] as String?,
        tipoAlbaran: json["tipo_albaran"] as String?,
        cargoAbono: json["cargo_abono"] as String?,
        facturado: json["facturado"] as String?,
        totalImporte: json["total_importe"]?.toDouble() as double?,
        id: json["id"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "ejercicio": ejercicio,
        "cliente": cliente,
        "contador": contador,
        "documento": documento,
        "fecha":
            "${fecha!.year.toString().padLeft(4, '0')}-${fecha!.month.toString().padLeft(2, '0')}-${fecha!.day.toString().padLeft(2, '0')}",
        "almacen": almacen,
        "modo_entrega": modoEntrega,
        "tipo_albaran": tipoAlbaran,
        "cargo_abono": cargoAbono,
        "facturado": facturado,
        "total_importe": totalImporte,
        "id": id,
      };

  String toFilter() => {
        "contador": contador,
        "documento": documento,
        "fecha": DateFormat.yMd('es').format(fecha!),
        "almacen": almacen,
        "modo_entrega": modoEntrega,
        "facturado": facturado,
        "total_importe":
            fmf.copyWith(amount: totalImporte).output.symbolOnRight,
      }.toString();
}

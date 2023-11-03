import 'package:intl/intl.dart';

class ReturnsModel {
  ReturnsModel({
    this.codigoDevolucion,
    this.numeroDevolucion,
    this.estado,
    this.fechaSolicitud,
    this.fechaCierre,
    this.nombreClienteRecogida,
    this.codigoClienteRecogida,
    this.recogerEn,
    this.colorEstado,
    this.cerradoEstado,
    this.almacenGestion,
    this.numLineas,
  });

  int? codigoDevolucion;
  String? numeroDevolucion;
  String? estado;
  String? fechaSolicitud;
  String? fechaCierre;
  String? nombreClienteRecogida;
  int? codigoClienteRecogida;
  String? recogerEn;
  String? colorEstado;
  bool? cerradoEstado;
  String? almacenGestion;
  int? numLineas;

  factory ReturnsModel.fromJson(dynamic json) => ReturnsModel(
    codigoDevolucion: json["codigo_devolucion"] as int?,
    numeroDevolucion: json["numero_devolucion"] as String?,
    estado: json["estado"] as String?,
    fechaSolicitud: json["fecha_solicitud"] as String?,
    fechaCierre: json["fecha_cierre"] as String?,
    nombreClienteRecogida: json["nombre_cliente_recogida"] as String?,
    codigoClienteRecogida: json["codigo_cliente_recogida"] as int?,
    recogerEn: json["recoger_en"] as String?,
    colorEstado: json["color_estado"] as String?,
    cerradoEstado: json["cerrado_estado"] as bool?,
    almacenGestion: json["almacen_gestion"] as String?,
    numLineas: json["num_lineas"] as int?,
  );

  Map<String, dynamic> toJson() => {
    "codigo_devolucion": codigoDevolucion,
    "numero_devolucion": numeroDevolucion,
    "estado": estado,
    "fecha_solicitud": fechaSolicitud,
    "fecha_cierre": fechaCierre,
    "nombre_cliente_recogida": nombreClienteRecogida,
    "codigo_cliente_recogida": codigoClienteRecogida,
    "recoger_en": recogerEn,
    "color_estado": colorEstado,
    "cerrado_estado": cerradoEstado,
    "almacen_gestion": almacenGestion,
    "num_lineas": numLineas,
  };

  String toFilter() => {
    "codigo_devolucion": codigoDevolucion,
    "numero_devolucion": numeroDevolucion,
    "estado": estado,
    "fecha_solicitud": DateFormat.yMd('es').format(DateTime.parse(fechaSolicitud ?? DateTime.now().toString())),
    "fecha_cierre": DateFormat.yMd('es').format(DateTime.parse(fechaCierre ?? DateTime.now().toString())),
    "nombre_cliente_recogida": nombreClienteRecogida,
    "codigo_cliente_recogida": codigoClienteRecogida,
    "recoger_en": recogerEn,
    "color_estado": colorEstado,
    "cerrado_estado": cerradoEstado,
    "almacen_gestion": almacenGestion,
    "num_lineas": numLineas,
  }.toString();
}

class ReturnsStatusModel {
  ReturnsStatusModel({
    this.codigoEstado,
    this.nombre,
    this.color,
    this.cerradoEstado,
    this.orden,
  });

  int? codigoEstado;
  String? nombre;
  String? color;
  bool? cerradoEstado;
  int? orden;

  factory ReturnsStatusModel.fromJson(dynamic json) => ReturnsStatusModel(
    codigoEstado: json["codigo_estado"] as int?,
    nombre: json["nombre"] as String?,
    color: json["color"] as String?,
    cerradoEstado: json["cerrado_estado"] as bool?,
    orden: json["orden"] as int?,
  );

  Map<String, dynamic> toJson() => {
    "codigo_estado": codigoEstado,
    "nombre": nombre,
    "color": color,
    "cerrado_estado": cerradoEstado,
    "orden": orden,
  };
}

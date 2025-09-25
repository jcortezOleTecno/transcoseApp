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
    this.direccionRecogida,
    this.notasRecogida,
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
  String? direccionRecogida;
  String? notasRecogida;

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
    direccionRecogida: json["direccion_recogida"] as String?,
    notasRecogida: json["notas_recogida"] as String?,
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
    "direccion_recogida": direccionRecogida,
    "notas_recogida": notasRecogida,
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
    "direccion_recogida": direccionRecogida,
    "notas_recogida": notasRecogida,
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


class ReturnsItemsModel {
  ReturnsItemsModel({
    this.referencia,
    this.cantidad,
    this.descripcion,
    this.motivoDevolucion,
    this.estado,
  });

  String? referencia;
  int? cantidad;
  String? descripcion;
  String? motivoDevolucion;
  String? estado;

  factory ReturnsItemsModel.fromJson(dynamic json) => ReturnsItemsModel(
    referencia: json["referencia"] as String?,
    cantidad: json["cantidad"] as int?,
    descripcion: json["descripcion"] as String?,
    motivoDevolucion: json["motivo_devolucion"] as String?,
    estado: json["estado"] as String?,
  );

  Map<String, dynamic> toJson() => {
    "referencia": referencia,
    "cantidad": cantidad,
    "descripcion": descripcion,
    "motivo_devolucion": motivoDevolucion,
    "estado": estado,
  };

  String toFilter() => {
    "referencia": referencia,
    "cantidad": cantidad,
    "descripcion": descripcion,
    "motivo_devolucion": motivoDevolucion,
    "estado": estado,
  }.toString();
}

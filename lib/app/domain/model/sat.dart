class Sat {
  Sat({
    this.codigo,
    this.fecha,
    this.tipoAveria,
    this.marca,
    this.modelo,
    this.numeroSerie,
    this.tipoAcuse,
    this.fechaCita,
    this.franjaHorariaCita,
    this.numeroIntervenciom,
    this.estado,
    this.tecnico,
  });

  int? codigo;
  String? fecha;
  String? tipoAveria;
  String? marca;
  String? modelo;
  String? numeroSerie;
  String? tipoAcuse;
  String? fechaCita;
  String? franjaHorariaCita;
  String? numeroIntervenciom;
  String? estado;
  String? tecnico;

  factory Sat.fromJson(dynamic json) => Sat(
        codigo: json["codigo"] as int?,
        fecha: json["fecha"] as String?,
        tipoAveria: json["tipo_averia"] as String?,
        marca: json["marca"] as String?,
        modelo: json["modelo"] as String?,
        numeroSerie: json["numero_serie"] as String?,
        tipoAcuse: json["tipo_acuse"] as String?,
        fechaCita: json["fecha_cita"] as String?,
        franjaHorariaCita: json["franja_horaria_cita"] as String?,
        numeroIntervenciom: json["numero_intervenciom"] as String?,
        estado: json["estado"] as String?,
        tecnico: json["tecnico"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "codigo": codigo,
        "fecha": fecha,
        "tipo_averia": tipoAveria,
        "marca": marca,
        "modelo": modelo,
        "numero_serie": numeroSerie,
        "tipo_acuse": tipoAcuse,
        "fecha_cita": fechaCita,
        "franja_horaria_cita": franjaHorariaCita,
        "numero_intervenciom": numeroIntervenciom,
        "estado": estado,
        "tecnico": tecnico,
      };
}

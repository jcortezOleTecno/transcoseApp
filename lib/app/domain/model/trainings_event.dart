class TrainingsEvents {
  TrainingsEvents({
    this.id,
    this.name,
    this.fecha,
    this.hora,
    this.tipo,
  });

  int? id;
  String? name;
  DateTime? fecha;
  String? hora;
  String? tipo;

  factory TrainingsEvents.fromJson(dynamic json) => TrainingsEvents(
        id: json["id"] as int?,
        name: json["title"] as String?,
        fecha: json["date"] == null ? null : DateTime.parse(json["date"]),
        hora: json["time"] as String?,
        tipo: json["type"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": name,
        "date":
            "${fecha!.year.toString().padLeft(4, '0')}-${fecha!.month.toString().padLeft(2, '0')}-${fecha!.day.toString().padLeft(2, '0')}",
        "time": hora,
        "type": tipo,
      };
}

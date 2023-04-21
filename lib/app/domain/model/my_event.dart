class MyEvents {
  MyEvents({
    this.id,
    this.title,
    this.description,
    this.image,
    this.horario,
  });

  int? id;
  String? title;
  String? description;
  String? image;
  List<EventHorario>? horario;

  factory MyEvents.fromJson(dynamic json) => MyEvents(
        id: json["id"] as int?,
        title: json["title"] as String?,
        description: json["description"] as String?,
        image: json["image"] as String?,
        horario: json["horario"] == null
            ? []
            : List<EventHorario>.from(
                json["horario"]!.map((x) => EventHorario.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        "horario": horario == null
            ? []
            : List<dynamic>.from(horario!.map((x) => x.toJson())),
      };
}

class EventHorario {
  EventHorario({
    this.id,
    this.date,
    this.time,
    this.location,
    this.googleMeet,
    this.allDay,
    this.eventId,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  DateTime? date;
  String? time;
  String? location;
  String? googleMeet;
  int? allDay;
  int? eventId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory EventHorario.fromJson(Map<String, dynamic> json) => EventHorario(
        id: json["id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        time: json["time"],
        location: json["location"],
        googleMeet: json["google_meet"],
        allDay: json["all_day"],
        eventId: json["event_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "time": time,
        "location": location,
        "google_meet": googleMeet,
        "all_day": allDay,
        "event_id": eventId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

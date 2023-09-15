class Locations {
  int? id;
  int? eventId;
  String? location;
  String? center;
  bool centerReference;

  Locations({
    this.id,
    this.eventId,
    this.location,
    this.center,
    this.centerReference = false,
  });

  factory Locations.fromJson(dynamic json) => Locations(
        id: json["id"] as int,
        eventId: json["event_id"] ?? json["formation_id"] as int,
        location: json["location"] as String,
        center: json["center"] as String,
        centerReference: json["center_reference"] as bool,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "event_id": eventId,
        "location": location,
        "center": center,
        "center_reference": centerReference,
      };
}

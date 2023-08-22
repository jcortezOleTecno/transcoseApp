class Locations {
  int? id;
  int? eventId;
  String? location;
  String? center;

  Locations({
    this.id,
    this.eventId,
    this.location,
    this.center,
  });

  factory Locations.fromJson(dynamic json) => Locations(
        id: json["id"] as int,
        eventId: json["event_id"] as int,
        location: json["location"] as String,
        center: json["center"] as String,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "event_id": eventId,
        "location": location,
        "center": center,
      };
}

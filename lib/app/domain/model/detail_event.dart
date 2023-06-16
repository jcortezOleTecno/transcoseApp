class DetailEvent {
  String? title;
  String? date;
  String? time;
  String? endDate;
  String? endTime;
  String? location;
  String? googleMeet;
  String? description;

  DetailEvent({
    this.title,
    this.date,
    this.time,
    this.endDate,
    this.endTime,
    this.location,
    this.googleMeet,
    this.description,
  });

  factory DetailEvent.fromJson(dynamic json) => DetailEvent(
        title: json["title"] as String?,
        date: json["date"] as String?,
        time: json["time"] as String?,
        endDate: json["end_date"] as String?,
        endTime: json["end_time"] as String?,
        location: json["location"] as String?,
        googleMeet: json["google_meet"] as String?,
        description: json["description"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "date": date,
        "time": time,
        "end_date": endDate,
        "end_time": endTime,
        "location": location,
        "google_meet": googleMeet,
        "description": description,
      };
}

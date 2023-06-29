class TrainigGroup {
  TrainigGroup({
    this.id,
    this.title,
    this.slug,
    this.type,
    this.externalLink,
    this.tags,
    this.image,
    this.description,
    // this.formations,
  });

  int? id;
  String? title;
  String? slug;
  String? type;
  String? externalLink;
  String? tags;
  String? image;
  String? description;
  // List<Formation>? formations;

  TrainigGroup copyWith({
    int? id,
    String? title,
    String? slug,
    String? type,
    String? externalLink,
    String? tags,
    String? image,
    String? description,
    // List<Formation>? formations,
  }) =>
      TrainigGroup(
        id: id ?? this.id,
        title: title ?? this.title,
        slug: slug ?? this.slug,
        type: type ?? this.type,
        externalLink: externalLink ?? this.externalLink,
        tags: tags ?? this.tags,
        image: image ?? this.image,
        description: description ?? this.description,
        // formations: formations ?? this.formations,
      );

  factory TrainigGroup.fromJson(dynamic json) => TrainigGroup(
        id: json["id"] as int?,
        title: json["title"] as String?,
        slug: json["slug"] as String?,
        type: json["type"] as String?,
        externalLink: json["external_link"] as String?,
        tags: json["tags"] as String?,
        image: json["image"] as String?,
        description: json["description"] as String?,
        // formations: json["formations"] == null
        //     ? []
        //     : List<Formation>.from(
        //         json["formations"]!.map((x) => Formation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "tags": tags,
        "type": type,
        "image": image,
        "external_link": externalLink,
        "description": description,
        // "formations": formations == null
        //     ? []
        //     : List<dynamic>.from(formations!.map((x) => x.toJson())),
      };
}

/*class Formation {
  Formation({
    this.id,
    this.title,
    this.slug,
    this.tags,
    this.subtitle,
    this.description,
    this.image,
    this.horario,
  });

  int? id;
  String? title;
  String? slug;
  String? tags;
  String? subtitle;
  String? description;
  String? image;
  List<Horario>? horario;

  Formation copyWith({
    int? id,
    String? title,
    String? slug,
    String? tags,
    String? subtitle,
    String? description,
    String? image,
    List<Horario>? horario,
  }) =>
      Formation(
        id: id ?? this.id,
        title: title ?? this.title,
        slug: slug ?? this.slug,
        tags: tags ?? this.tags,
        subtitle: subtitle ?? this.subtitle,
        description: description ?? this.description,
        image: image ?? this.image,
        horario: horario ?? this.horario,
      );

  factory Formation.fromJson(Map<String, dynamic> json) => Formation(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        tags: json["tags"],
        subtitle: json["subtitle"],
        description: json["description"],
        image: json["image"],
        horario: json["horario"] == null
            ? []
            : List<Horario>.from(
                json["horario"]!.map((x) => Horario.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "tags": tags,
        "subtitle": subtitle,
        "description": description,
        "image": image,
        "horario": horario == null
            ? []
            : List<dynamic>.from(horario!.map((x) => x.toJson())),
      };
}

class Horario {
  Horario({
    this.date,
    this.time,
    this.location,
    this.googleMeet,
    this.endDate,
    this.endTime,
    this.postalCode,
  });

  DateTime? date;
  DateTime? endDate;
  String? time;
  String? endTime;
  String? location;
  String? googleMeet;
  String? postalCode;

  Horario copyWith({
    DateTime? date,
    DateTime? endDate,
    String? time,
    String? endTime,
    String? location,
    String? googleMeet,
    String? postalCode,
  }) =>
      Horario(
        date: date ?? this.date,
        endDate: endDate ?? this.endDate,
        time: time ?? this.time,
        endTime: endTime ?? this.endTime,
        location: location ?? this.location,
        googleMeet: googleMeet ?? this.googleMeet,
        postalCode: postalCode ?? this.postalCode,
      );

  factory Horario.fromJson(Map<String, dynamic> json) => Horario(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        time: json["time"],
        endTime: json["end_time"],
        location: json["location"],
        googleMeet: json["google_meet"],
        postalCode: json["postal_code"],
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "endDate":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "time": time,
        "endTime": endTime,
        "location": location,
        "google_meet": googleMeet,
        "postal_code": postalCode,
      };
}*/

class Formation {
  int? id;
  String? title;
  String? slug;
  String? tags;
  int? homeAppearance;
  String? subtitle;
  String? description;
  String? informationForRegistrants;
  String? image;
  List<Horario>? horario;

  Formation({
    this.id,
    this.title,
    this.slug,
    this.tags,
    this.homeAppearance,
    this.subtitle,
    this.description,
    this.informationForRegistrants,
    this.image,
    this.horario,
  });

  factory Formation.fromJson(dynamic json) => Formation(
        id: json["id"] as int?,
        title: json["title"] as String?,
        slug: json["slug"] as String?,
        tags: json["tags"] as String?,
        homeAppearance: json["home_appearance"] as int?,
        subtitle: json["subtitle"] as String?,
        description: json["description"] as String?,
        informationForRegistrants:
            json["information_for_registrants"] as String?,
        image: json["image"] as String?,
        horario: json["horario"] == null
            ? []
            : List<Horario>.from(
                json["horario"]!.map((x) => Horario.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "tags": tags,
        "home_appearance": homeAppearance,
        "subtitle": subtitle,
        "description": description,
        "information_for_registrants": informationForRegistrants,
        "image": image,
        "horario": horario == null
            ? []
            : List<dynamic>.from(horario!.map((x) => x.toJson())),
      };
}

class Horario {
  int dateId;
  DateTime? date;
  String? dateFormat;
  String? time;
  String? timeFormat;
  String? location;
  String? googleMeet;
  DateTime? endDate;
  String? endDateFormat;
  String? endTime;
  String? endTimeFormat;
  String? postalCode;
  bool? isRegistered;
  bool? centerReference;

  Horario({
    required this.dateId,
    this.date,
    this.dateFormat,
    this.time,
    this.timeFormat,
    this.location,
    this.googleMeet,
    this.endDate,
    this.endDateFormat,
    this.endTime,
    this.endTimeFormat,
    this.postalCode,
    this.isRegistered,
    this.centerReference,
  });

  Horario copyWith({
    int? dateId,
    DateTime? date,
    String? dateFormat,
    String? time,
    String? timeFormat,
    String? location,
    String? googleMeet,
    String? postalCode,
    bool? isRegistered,
    bool? centerReference,
  }) =>
      Horario(
        dateId: dateId ?? this.dateId,
        date: date ?? this.date,
        dateFormat: dateFormat ?? this.dateFormat,
        time: time ?? this.time,
        timeFormat: timeFormat ?? this.timeFormat,
        location: location ?? this.location,
        googleMeet: googleMeet ?? this.googleMeet,
        postalCode: postalCode ?? this.postalCode,
        isRegistered: isRegistered ?? this.isRegistered,
        centerReference: centerReference ?? this.centerReference,
      );

  factory Horario.fromJson(Map<String, dynamic> json) => Horario(
        dateId: json["date_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        dateFormat: json["date_format"],
        time: json["time"],
        timeFormat: json["time_format"],
        location: json["location"],
        googleMeet: json["google_meet"],
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        endDateFormat: json["end_date_format"],
        endTime: json["end_time"],
        endTimeFormat: json["end_time_format"],
        postalCode: json["postal_code"],
        isRegistered: json["is_registered"],
        centerReference: json["center_reference"],
      );

  Map<String, dynamic> toJson() => {
        "date_id": dateId,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "date_format": dateFormat,
        "time": time,
        "time_format": timeFormat,
        "location": location,
        "google_meet": googleMeet,
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "end_date_format": endDateFormat,
        "end_time": endTime,
        "end_time_format": endTimeFormat,
        "postal_code": postalCode,
        "is_registered": isRegistered,
        "center_reference": centerReference,
      };
}

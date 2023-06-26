import 'package:vemare/app/domain/model/galery.dart';

class EventsHeld {
  EventsHeld({
    this.id,
    this.title,
    this.slug,
    this.subtitle,
    this.permissions,
    this.date,
    this.image,
    this.gallery,
    this.videos,
  });

  int? id;
  String? title;
  String? slug;
  String? subtitle;
  String? permissions;
  DateTime? date;
  String? image;
  List<Gallery>? gallery;
  List<Video>? videos;

  EventsHeld copyWith({
    int? id,
    String? title,
    String? slug,
    String? subtitle,
    String? permissions,
    DateTime? date,
    String? image,
    List<Gallery>? gallery,
    List<Video>? videos,
  }) =>
      EventsHeld(
        id: id ?? this.id,
        title: title ?? this.title,
        slug: slug ?? this.slug,
        subtitle: subtitle ?? this.subtitle,
        permissions: permissions ?? this.permissions,
        date: date ?? this.date,
        image: image ?? this.image,
        gallery: gallery ?? this.gallery,
        videos: videos ?? this.videos,
      );

  factory EventsHeld.fromJson(dynamic json) => EventsHeld(
        id: json["id"] as int?,
        title: json["title"] as String?,
        slug: json["slug"] as String?,
        subtitle: json["subtitle"] as String?,
        permissions: json["permissions"] as String?,
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        image: json["image"] as String?,
        gallery: json["gallery"] == null
            ? []
            : List<Gallery>.from(
                json["gallery"]!.map((x) => Gallery.fromJson(x))),
        videos: json["videos"] == null
            ? []
            : List<Video>.from(json["videos"]!.map((x) => Video.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "subtitle": subtitle,
        "permissions": permissions,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "image": image,
        "gallery": gallery == null
            ? []
            : List<dynamic>.from(gallery!.map((x) => x.toJson())),
        "videos": videos == null
            ? []
            : List<dynamic>.from(videos!.map((x) => x.toJson())),
      };
}

class Video {
  int? id;
  int? eventVemareId;
  String? link;
  String? name;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;

  Video({
    this.id,
    this.eventVemareId,
    this.link,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json["id"],
        eventVemareId: json["event_vemare_id"],
        link: json["link"],
        name: json["name"],
        description: json["description"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "event_vemare_id": eventVemareId,
        "link": link,
        "name": name,
        "description": description,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

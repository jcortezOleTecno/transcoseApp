import 'package:vemare/app/domain/model/galery.dart';

class EventsVemare {
  EventsVemare({
    this.id,
    this.title,
    this.slug,
    this.subtitle,
    this.permissions,
    this.date,
    this.image,
    this.gallery,
  });

  int? id;
  String? title;
  String? slug;
  String? subtitle;
  String? permissions;
  DateTime? date;
  String? image;
  List<Gallery>? gallery;

  EventsVemare copyWith({
    int? id,
    String? title,
    String? slug,
    String? subtitle,
    String? permissions,
    DateTime? date,
    String? image,
    List<Gallery>? gallery,
  }) =>
      EventsVemare(
        id: id ?? this.id,
        title: title ?? this.title,
        slug: slug ?? this.slug,
        subtitle: subtitle ?? this.subtitle,
        permissions: permissions ?? this.permissions,
        date: date ?? this.date,
        image: image ?? this.image,
        gallery: gallery ?? this.gallery,
      );

  factory EventsVemare.fromJson(dynamic json) => EventsVemare(
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
      };
}

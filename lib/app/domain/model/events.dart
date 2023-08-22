import 'package:vemare/app/domain/model/formation.dart';

class Events {
  Events({
    this.id,
    this.title,
    this.slug,
    this.tags,
    this.subtitle,
    this.description,
    this.image,
    this.imagePrivate,
    this.showCalendar,
    this.horario,
  });

  int? id;
  String? title;
  String? slug;
  String? tags;
  String? subtitle;
  String? description;
  String? image;
  String? imagePrivate;
  bool? showCalendar;
  List<Horario>? horario;

  // Events copyWith({
  //   int? id,
  //   String? title,
  //   String? slug,
  //   String? tags,
  //   String? subtitle,
  //   String? description,
  //   String? image,
  //   List<Horario>? horario,
  // }) =>
  //     Events(
  //       id: id ?? this.id,
  //       title: title ?? this.title,
  //       slug: slug ?? this.slug,
  //       tags: tags ?? this.tags,
  //       subtitle: subtitle ?? this.subtitle,
  //       description: description ?? this.description,
  //       image: image ?? this.image,
  //       horario: horario ?? this.horario,
  //     );

  factory Events.fromJson(dynamic json) => Events(
        id: json["id"] as int?,
        title: json["title"] as String?,
        slug: json["slug"] as String?,
        tags: json["tags"] as String?,
        subtitle: json["subtitle"] as String?,
        description: json["description"] as String?,
        image: json["image"] as String?,
        imagePrivate: json["image_private"] as String?,
        showCalendar: json["show_calendar"] as bool?,
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
        "image_private": imagePrivate,
        "show_calendar": showCalendar,
        "horario": horario == null
            ? []
            : List<dynamic>.from(horario!.map((x) => x.toJson())),
      };
}

class Promotion {
  Promotion({
    required this.id,
    required this.informative,
    this.name,
    this.slug,
    this.tags,
    this.subtitle,
    this.pvpOriginal,
    this.pvpLowered,
    this.description,
    this.renting,
    this.image,
  });

  int id;
  String? name;
  String? slug;
  String? tags;
  String? subtitle;
  String? pvpOriginal;
  String? pvpLowered;
  String? description;
  int? renting;
  String? image;
  bool informative;

  // Promotion copyWith({
  //   int? id,
  //   String? name,
  //   String? slug,
  //   String? tags,
  //   String? subtitle,
  //   String? pvpOriginal,
  //   String? pvpLowered,
  //   String? description,
  //   int? renting,
  //   String? image,
  // }) =>
  //     Promotion(
  //       id: id ?? this.id,
  //       name: name ?? this.name,
  //       slug: slug ?? this.slug,
  //       tags: tags ?? this.tags,
  //       subtitle: subtitle ?? this.subtitle,
  //       pvpOriginal: pvpOriginal ?? this.pvpOriginal,
  //       pvpLowered: pvpLowered ?? this.pvpLowered,
  //       description: description ?? this.description,
  //       renting: renting ?? this.renting,
  //       image: image ?? this.image,
  //     );

  factory Promotion.fromJson(dynamic json) => Promotion(
        id: json["id"] as int,
        name: json["name"] as String?,
        slug: json["slug"] as String?,
        tags: json["tags"] as String?,
        subtitle: json["subtitle"] as String?,
        pvpOriginal: json["pvp_original"] as String?,
        pvpLowered: json["pvp_lowered"] as String?,
        description: json["description"] as String?,
        renting: json["renting"] as int?,
        image: json["image"] as String?,
        informative: (json["informative"] as int) == 1,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "tags": tags,
        "subtitle": subtitle,
        "pvp_original": pvpOriginal,
        "pvp_lowered": pvpLowered,
        "description": description,
        "renting": renting,
        "image": image,
        "informative": informative,
      };
}

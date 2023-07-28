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
  double? pvpOriginal;
  double? pvpLowered;
  String? description;
  int? renting;
  String? image;
  bool informative;

  factory Promotion.fromJson(dynamic json) => Promotion(
        id: json["id"] as int,
        name: json["name"] as String?,
        slug: json["slug"] as String?,
        tags: json["tags"] as String?,
        subtitle: json["subtitle"] as String?,
        pvpOriginal: json["pvp_original"]?.toDouble(),
        pvpLowered: (json["pvp_lowered"]?.toDouble()) == 0
            ? null
            : json["pvp_lowered"]?.toDouble(),
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

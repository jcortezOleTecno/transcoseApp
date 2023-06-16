class TypeOfVehicle {
  int? id;
  String? name;
  String? slug;
  String? subtitle;
  String? description;
  String? image;

  TypeOfVehicle({
    this.id,
    this.name,
    this.slug,
    this.subtitle,
    this.description,
    this.image,
  });

  factory TypeOfVehicle.fromJson(dynamic json) => TypeOfVehicle(
        id: json["id"] as int?,
        name: json["name"] as String?,
        slug: json["slug"] as String?,
        subtitle: json["subtitle"] as String?,
        description: json["description"] as String?,
        image: json["image"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "subtitle": subtitle,
        "description": description,
        "image": image,
      };
}

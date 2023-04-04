class HeroHome {
  HeroHome({
    this.title,
    this.description,
    this.image,
  });

  String? title;
  String? description;
  String? image;

  factory HeroHome.fromJson(dynamic json) => HeroHome(
        title: json["title"] as String?,
        description: json["description"] as String?,
        image: json["image"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "image": image,
      };
}

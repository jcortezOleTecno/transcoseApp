class Header {
  String? module;
  String? landing;
  String? title;
  String? description;
  String? image;

  Header({
    this.module,
    this.landing,
    this.title,
    this.description,
    this.image,
  });

  factory Header.fromJson(dynamic json) => Header(
        module: json["module"] as String?,
        landing: json["landing"] as String?,
        title: json["title"] as String?,
        description: json["description"] as String?,
        image: json["image"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "module": module,
        "landing": landing,
        "title": title,
        "description": description,
        "image": image,
      };
}

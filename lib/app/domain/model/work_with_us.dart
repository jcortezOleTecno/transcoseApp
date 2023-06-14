class WorkWithUs {
  int? id;
  String? title;
  String? tags;
  String? description;
  String? image;

  WorkWithUs({
    this.id,
    this.title,
    this.tags,
    this.description,
    this.image,
  });

  factory WorkWithUs.fromJson(dynamic json) => WorkWithUs(
        id: json["id"] as int?,
        title: json["title"] as String?,
        tags: json["tags"] as String?,
        description: json["description"] as String?,
        image: json["image"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "tags": tags,
        "description": description,
        "image": image,
      };
}
